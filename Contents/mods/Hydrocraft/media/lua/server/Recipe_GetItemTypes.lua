
--These will exist, but just in case
Recipe = Recipe or {}
Recipe.GetItemTypes = Recipe.GetItemTypes or {}
--TODO: rename to Hydrocraft.GetItemTypes, to make it clearer which are vanilla and which are HC?

function Recipe.GetItemTypes.LeatherGloves(scriptItems)
	local all = getScriptManager():getAllItems()
	for i=0, all:size()-1 do
		local item = all:get(i)
		if item:getTypeString() == "Clothing" and item:getBodyLocation() == "Hands" and item:getFabricType() == "Leather" then
			scriptItems:add(item)
		end
	end
end

function Recipe.GetItemTypes.BlacksmithTongs(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("BlacksmithTongs"))
end

function Recipe.GetItemTypes.Potato(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Potato"))
end

function Recipe.GetItemTypes.RoastingPanFull(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("RoastingPanFull"))
end

function Recipe.GetItemTypes.PaperBagFull(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("PaperBagFull"))
end

function Recipe.GetItemTypes.ServeInPaperBag(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("ServeInPaperBag"))
end

function Recipe.GetItemTypes.Box12(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box12"))
end

function Recipe.GetItemTypes.Box25(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box25"))
end

function Recipe.GetItemTypes.Box50(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box50"))
end

function Recipe.GetItemTypes.Box100(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box100"))
end

--Note: Recipe.GetItemTypes.Milk exists in Vanilla PZ
function Recipe.GetItemTypes.Cereal(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Cereal"))
end

function Recipe.GetItemTypes.NylonBag(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("NylonBag"))
end

function Recipe.GetItemTypes.HuntingShotgun(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("HuntingShotgun"))
end

function Recipe.GetItemTypes.BooksWithNumberOfPages(scriptItems)
	local all = getScriptManager():getAllItems()
	for i=0, all:size()-1 do
		local item = all:get(i)
		local pageCount = item:getNumberOfPages() --returns -1 for NA, or 220, 260, etc.

		if pageCount > 0 then
			scriptItems:add( item )
		end
	end
end

function Recipe.GetItemTypes.FoodThatCanRot(scriptItems)
	local all = getScriptManager():getAllItems()
	for i=0, all:size()-1 do
		local item = all:get(i)
		if item:getTypeString() == "Food" and item:getDaysTotallyRotten() > 0 then
			scriptItems:add( item )
		end
	end
end

function Recipe.GetItemTypes.Shit(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Shit"))
end

function Recipe.GetItemTypes.BucketConcrete(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("BucketConcrete"))
end