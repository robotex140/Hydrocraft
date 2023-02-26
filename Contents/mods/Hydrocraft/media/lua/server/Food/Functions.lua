
Recipe = Recipe or {}
Recipe.OnTest = Recipe.OnTest or {}
Recipe.OnCreate = Recipe.OnCreate or {}
Recipe.OnCanPerform = Recipe.OnCanPerform or {}
Recipe.OnTest.Hydrocraft = Recipe.OnTest.Hydrocraft or {}
Recipe.OnCreate.Hydrocraft = Recipe.OnCreate.Hydrocraft or {}
Recipe.OnCanPerform.Hydrocraft = Recipe.OnCanPerform.Hydrocraft or {}

Hydrocraft = Hydrocraft or {}
Hydrocraft.OnTest = Hydrocraft.OnTest or {}
Hydrocraft.OnCreate = Hydrocraft.OnCreate or {}

local allRecipes = nil

local function getRecipe(recipeName)
	if allRecipes == nil then
		allRecipes = getAllRecipes()
	end
	for i=0,allRecipes:size()-1 do
		local recipe = allRecipes:get(i)
		if recipe:getName() == recipeName then	
			return recipe
		end
	end
	return nil
end

--[[
IMPORTANT
Only call is from OnCreate for 'simple' recipes, that is recipes that take whole food items and combine them into a new food.
DO NOT call this if the recipes takes part of an item, e.g. "OilVegetable;1", doing so will give wildly inflated food stats.
]]--

function Hydrocraft.OnCreate.GenericFood(items, result, player)

	local calories = 0
	local carbs = 0
	local lipids = 0
	local proteins = 0
	local hunger = 0
	local baseHunger = 0

	for i=0, items:size()-1 do

		local item = items:get(i)

		if item:IsFood() then
			calories = calories + item:getCalories()
			carbs = carbs + item:getCarbohydrates()
			lipids = lipids + item:getLipids()
			proteins = proteins + item:getProteins()
			hunger = hunger + item:getHungChange()
			baseHunger = baseHunger + item:getBaseHunger()
		end
	end

	result:setCalories( calories )
	result:setCarbohydrates( carbs )
	result:setLipids( lipids )
	result:setProteins( proteins )
	result:setHungChange( hunger )
	result:setBaseHunger( baseHunger )

end



--[[
Don't call this from a recipe, call Recipe.OnCreate.TransferToPaperBag_GiveRoastingPan
Or create a similar function if using a different pan/pot.
]]--
local function Recipe_OnCreate_TransferToPaperBag(items, result, player, panName)

	local split = {}

	for i=0, items:size()-1 do
		local item = items:get(i)
		local ft = item:getFullType()
		if ft == "Base.PaperBag" or ft == "Base.Paperbag_Spiffos" or ft == "Base.Paperbag_Jays" or ft == "Hydrocraft.HCPaperbag" then
			split["PaperBag"] = item
		elseif item:IsFood() then
			split["Food"] = item
		end
	end

	local paperBag = split["PaperBag"]
	local food = split["Food"]

	result:setCalories( food:getCalories() )
	result:setCarbohydrates( food:getCarbohydrates() )
	result:setLipids( food:getLipids() )
	result:setProteins( food:getProteins() )
	result:setHungChange( food:getHungChange() )
	result:setBaseHunger( food:getBaseHunger() )

	result:setCooked( food:isCooked() )
	result:setAge( food:getAge() )
	--How to translate this?
	result:setName( "Bag of " .. food:getScriptItem():getDisplayName() )
	result:setUnhappyChange( food:getUnhappyChange() )
	result:setBoredomChange( food:getBoredomChange() )
	result:setStressChange( food:getStressChange() )

	local pan = InventoryItemFactory.CreateItem( panName )

	local weight = food:getWeight() - pan:getWeight()
	result:setCustomWeight( true )
	result:setWeight( weight )
	result:setWeight( weight )

	player:getInventory():AddItem(pan)

end

--Generic function, takes any food item and a paper bag, sets the result's calorie/lipid stats and returns the Roasting Pan
function Recipe.OnCreate.TransferToPaperBag_GiveRoastingPan(items, result, player)
	Recipe_OnCreate_TransferToPaperBag(items, result, player, "Base.RoastingPan")
end

--TODO: What to do with frying pans? They have a condition which would be lost using this technique...




--if a recipe uses part of an ingredient, rather than a whole item, this function creates the new item and calculates the stats. 
local function createDummyItem( fullType, useAmount )

	local dummyItem = InventoryItemFactory.CreateItem( fullType )
	local fullCalories = dummyItem:getCalories()
	local fullCarbs = dummyItem:getCarbohydrates()
	local fullLipids = dummyItem:getLipids()
	local fullProteins = dummyItem:getProteins()
	local fullHunger = math.abs( dummyItem:getHungChange() * 100 )
	local fullWeight = dummyItem:getActualWeight()
		
	local actualCaloriesUsed = (fullCalories / fullHunger) * useAmount
	local actualCarbsUsed = (fullCarbs / fullHunger) * useAmount
	local actualLipidsUsed = (fullLipids / fullHunger) * useAmount
	local actualProteinsUsed = (fullProteins / fullHunger) * useAmount
	local actualHungerUsed = -( useAmount / 100 )
	local actualWeightUsed = (fullWeight / fullHunger) * useAmount
			
	dummyItem:setCalories( actualCaloriesUsed )
	dummyItem:setCarbohydrates( actualCarbsUsed )
	dummyItem:setLipids( actualLipidsUsed )
	dummyItem:setProteins( actualProteinsUsed )
	dummyItem:setHungChange( actualHungerUsed )
	dummyItem:setActualWeight( actualWeightUsed )
	dummyItem:setWeight( actualWeightUsed )
	
	return dummyItem

end

local function Recipe_OnCreate_ComplexBetter(items, result, recipeName)

	local recipe = getRecipe(recipeName)

	if recipe == nil then
		print("Exception, unknown recipe: " .. recipeName)
		return
	end

	local calories = 0
	local carbs = 0
	local lipids = 0
	local proteins = 0
	local hunger = 0
	local baseHunger = 0

	local source = recipe:getSource()

	local itemIndex = 0
	for i=0, source:size()-1 do

		local ingredientLine = source:get(i)
		local ingredients = ingredientLine:getItems() --Array: could be 1 item, could be many, e.g. [Base.RoastingPan], or [a, b, c, d]
		local count = ingredientLine:getCount()
		local partialUseAmount = ingredientLine:getUse() --use amount, in hunger, or 0 for use all.
		
		local item = items:get( itemIndex ) --full item
		
		--print( "partialUseAmount = ", partialUseAmount )
		if partialUseAmount > 0 then --must be food
			local dummyItem = createDummyItem( item:getFullType(), partialUseAmount )
			--print( "Dummy Item created: ", item:getFullType(), partialUseAmount )
			calories = calories + dummyItem:getCalories()			--print( "Calories: ", dummyItem:getCalories() )
			carbs = carbs + dummyItem:getCarbohydrates()			--print( "Carbs: ", dummyItem:getCarbohydrates() )
			lipids = lipids + dummyItem:getLipids()					--print( "lipids: ", dummyItem:getLipids() )
			proteins = proteins + dummyItem:getProteins()			--print( "Proteins: ", dummyItem:getProteins() )
			hunger = hunger + dummyItem:getHungChange()				--print( "Hunger: ", dummyItem:getHungChange() )
			baseHunger = baseHunger + dummyItem:getBaseHunger()
			
			itemIndex = itemIndex + 1
			
		else --partialUseAmount == 0
			for j=0, count-1 do
				item = items:get( itemIndex )
				
				if item:IsFood() then
					--print( "Item used: ", item:getFullType() )
					calories = calories + item:getCalories()		--print( "Calories: ", item:getCalories() )
					carbs = carbs + item:getCarbohydrates()			--print( "Carbs: ", item:getCarbohydrates() )
					lipids = lipids + item:getLipids()				--print( "lipids: ", item:getLipids() )
					proteins = proteins + item:getProteins()		--print( "Proteins: ", item:getProteins() )
					hunger = hunger + item:getHungChange()			--print( "Hunger: ", item:getHungChange() )
					baseHunger = baseHunger + item:getBaseHunger()				
				end
				itemIndex = itemIndex + 1
			end			
		end
		
	end

	result:setCalories( calories )
	result:setCarbohydrates( carbs )
	result:setLipids( lipids )
	result:setProteins( proteins )
	result:setHungChange( hunger )
	result:setBaseHunger( baseHunger )

end

function Hydrocraft.OnCreate.BakePotato(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Bake Potato")
end

function Hydrocraft.OnCreate.MakePotatoPancakes(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Make Potato Pancakes")
end

function Hydrocraft.OnCreate.MakePlainMashedPotatoes(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Make Plain Mashed Potatoes")
end

function Hydrocraft.OnCreate.MakeCreamyMashedPotatoes(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Make Creamy Mashed Potatoes")
end

function Hydrocraft.OnCreate.MakeFrenchFries(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Make French Fries")
end

function Hydrocraft.OnCreate.MakeBowlofCereal(items, result, player)
	Recipe_OnCreate_ComplexBetter(items, result, "Make Bowl of Cereal")
end

function Recipe.OnTest.Hydrocraft.IsCooked(item)
	if item:IsFood() then
		if item:isCooked() then
			return true
		end
		return false --food, but not cooked
	end
	return true
end


function Hydrocraft.OnTest.FoodNotRotten(item)
	if item:IsFood() and item:IsRotten() then
		return false
	end
	return true
end

--Code based on vanilla: Recipe.OnCreate.SlicePie
local function CutIntoPieces(item, result, count)
	result:setBaseHunger(item:getBaseHunger() / count);
	result:setHungChange(item:getHungChange() / count);
	result:setThirstChange(item:getThirstChangeUnmodified() / count)
	result:setBoredomChange(item:getBoredomChangeUnmodified() / count)
	result:setUnhappyChange(item:getUnhappyChangeUnmodified() / count)
	result:setCalories(item:getCalories() / count)
	result:setCarbohydrates(item:getCarbohydrates() / count)
	result:setLipids(item:getLipids() / count)
	result:setProteins(item:getProteins() / count)
end

function Hydrocraft.OnCreate.CutIntoEightPieces(items, result, player)
	local food = items:get(0)
	CutIntoPieces(food, result, 8)
	local rou = food:getReplaceOnUseFullType()
	if rou and rou ~= '' then
		player:getInventory():AddItem(InventoryItemFactory.CreateItem(rou))
	end
end

function Hydrocraft.OnCreate.CutIntoSixPieces(items, result, player)
	local food = items:get(0)
	CutIntoPieces(food, result, 6)
	local rou = food:getReplaceOnUseFullType()
	if rou and rou ~= '' then
		player:getInventory():AddItem(InventoryItemFactory.CreateItem(rou))
	end
end

function Hydrocraft.OnCreate.CutIntoTwoPieces(items, result, player)
	local food = items:get(0)
	CutIntoPieces(food, result, 2)
	local rou = food:getReplaceOnUseFullType()
	if rou and rou ~= '' then
		player:getInventory():AddItem(InventoryItemFactory.CreateItem(rou))
	end
end