
local MALE = 1
local FEMALE = 2

local function HydrocraftButchering_SplitItems(items)
	local animal, knife
	
	local item1 = items:get(0)
	local item2 = items:get(1)
	--print("HydrocraftButchering_SplitItems: " .. item0:getName() .. " - " .. item1:getName())

	if(instanceof(item1, "Weapon")) then
		knife = item1
		animal = item2
	else
		knife = item2
		animal = item1
	end
	
	return animal, knife
end

function HydrocraftButchering_NoXP(recipe, ingredients, result, player)
	--no xp for you.
	
	--skinning used to give: player:getXp():AddXP(Perks.Doctor, 1); 
	--butchering used to give: player:getXp():AddXP(Perks.Cooking, 2);
	
end

local function HydrocraftButchering_ButcherBoar(player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawboar")
	inv:AddItems("Base.PorkChop", 4)
	inv:AddItems("Base.Bacon", 2)
	inv:AddItems("Hydrocraft.HCFreshham", 2)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 5)
	inv:AddItems("Hydrocraft.HCBone", 4)
	inv:AddItems("Hydrocraft.HCBoartusk", 2)
end

local function HydrocraftButchering_ButcherDeer(player, gender)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawdeer")

	inv:AddItems("Hydrocraft.HCVenison", 10)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 4)
	inv:AddItems("Hydrocraft.HCBone", 6)

	if(gender == MALE) then
		inv:AddItem("Hydrocraft.HCDeerantlers")
	end
	
end

local function HydrocraftButchering_ButcherBear(player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawbear")
	inv:AddItems("Hydrocraft.HCBearsteak", 20)
	inv:AddItems("Hydrocraft.HCIntestines", 6)
	inv:AddItems("Hydrocraft.HCLard", 6)
	inv:AddItems("Hydrocraft.HCBone", 12)
end

local function HydrocraftButchering_ButcherBlackBear(person)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawbearblack")
	inv:AddItems("Hydrocraft.HCBearsteak", 16)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 5)
	inv:AddItems("Hydrocraft.HCBone", 10)
end

local function HydrocraftButchering_ButcherCougar(person)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawcougar")
	inv:AddItems("Hydrocraft.HCCougarsteak", 8)
	inv:AddItems("Hydrocraft.HCIntestines", 3)
	inv:AddItems("Hydrocraft.HCLard", 2)
	inv:AddItems("Hydrocraft.HCBone", 10)
end

local function HydrocraftButchering_ButcherSheep(player)
	local inv = player:getInventory()
	inv:AddItems("Base.MuttonChop", 3)--this seem very low.
	inv:AddItems("Hydrocraft.HCIntestines", 2)
	inv:AddItems("Hydrocraft.HCLard", 3)
	inv:AddItems("Hydrocraft.HCBone", 3)
	inv:AddItem("Hydrocraft.HCHiderawsheep")
end

local function HydrocraftButchering_ButcherGoat(player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawgoat")
	inv:AddItems("Base.MuttonChop", 3)--this seem very low.
	inv:AddItems("Hydrocraft.HCIntestines", 2)
	inv:AddItems("Hydrocraft.HCLard", 3)
	inv:AddItems("Hydrocraft.HCBone", 3)
	inv:AddItems("Hydrocraft.HCGoathorn", 2)
end

local function HydrocraftButchering_ButcherPig(player, gender)
	local inv = player:getInventory()
	inv:AddItems("Base.PorkChop", 4)
	inv:AddItems("farming.Bacon", 2)
	inv:AddItems("Hydrocraft.HCFreshham", 2)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 6)
	inv:AddItems("Hydrocraft.HCBone", 4)	
end

local function HydrocraftButchering_ButcherCow(player, gender)

	local inv = player:getInventory()
	inv:AddItems("Base.Steak", 10)
	inv:AddItems("Hydrocraft.HCIntestines", 5)
	inv:AddItems("Hydrocraft.HCLard", 6)
	inv:AddItems("Hydrocraft.HCBone", 6)
	
	if(gender == MALE) then
		inv:AddItem("Hydrocraft.HCHiderawbull")
	else
		inv:AddItem("Hydrocraft.HCHiderawcow")
	end

end

local function HydrocraftButchering_ButcherDonkey(player)

	local inv = player:getInventory()

	inv:AddItem("Hydrocraft.HCHiderawdonkey")
	inv:AddItems("Hydrocraft.HCCheval", 8)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 5)
	inv:AddItems("Hydrocraft.HCBone", 6)

end

local function HydrocraftButchering_ButcherHorse(player)

	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCCheval", 10)
	inv:AddItems("Hydrocraft.HCIntestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 6)
	inv:AddItems("Hydrocraft.HCBone", 6)

	inv:AddItem("Hydrocraft.HCHiderawhorse")

end

function HydrocraftButchering_ButcherLargeAnimal(items, result, player)
	local animal, cleaver = HydrocraftButchering_SplitItems(items)

	--print(" **** HydrocraftButchering_ButcherAnimal: animal = " .. animal:getName() .. " - " .. animal:getType())
	
	local fullType = animal:getFullType()
	
	if(fullType == "Hydrocraft.HCBoardead") then
		HydrocraftButchering_ButcherBoar(player)
	elseif(fullType == "Hydrocraft.HCDeerdead") then
		HydrocraftButchering_ButcherDeer(player, MALE)
	elseif(fullType == "Hydrocraft.HCDeerdead2") then
		HydrocraftButchering_ButcherDeer(player, FEMALE)
	elseif(fullType == "Hydrocraft.HCBeardead") then
		HydrocraftButchering_ButcherBear(person)
	elseif(fullType == "Hydrocraft.HCBlackbeardead") then
		HydrocraftButchering_ButcherBlackBear(person)
	elseif(fullType == "Hydrocraft.HCCougardead") then
		HydrocraftButchering_ButcherCougar(person)
	elseif(fullType == "Hydrocraft.HCSheepdead") then
		HydrocraftButchering_ButcherSheep(player)
	elseif(fullType == "Hydrocraft.HCGoatdead" or fullType == "Hydrocraft.HCGoatdead2") then
		HydrocraftButchering_ButcherGoat(player)
	elseif(fullType == "Hydrocraft.HCPigdead") then
		HydrocraftButchering_ButcherPig(player)
	elseif(fullType == "Hydrocraft.HCCowdead") then
		HydrocraftButchering_ButcherCow(player, MALE)
	elseif(fullType == "Hydrocraft.HCCowdead2") then
		HydrocraftButchering_ButcherCow(player, FEMALE)
	elseif(fullType == "Hydrocraft.HCDonkeydead") then
		HydrocraftButchering_ButcherDonkey(player)	
	elseif(fullType == "Hydrocraft.HCHorsedead") then
		HydrocraftButchering_ButcherHorse(player)
	else
		print("Exception: unknown large animal: " .. animal:getFullType())
		return
	end
	
	player:getXp():AddXP(Perks.Cooking, 4);
	
	
end

local function HydrocraftButchering_GenericButcherMeat(animal, meatFullType)

	local meat = InventoryItemFactory.CreateItem(meatFullType)
	if(meat == nil) then
		print("Exception: Unknown type: " .. meatFullType)
	end
	
	local new_hunger = animal:getBaseHunger() * 1.05
	if(new_hunger < -100) then
		new_hunger = -100
	end

	meat:setBaseHunger(new_hunger)
	meat:setHungChange(new_hunger)
	
	meat:setCustomWeight(true)
	meat:setWeight(animal:getWeight() * 0.7)
	meat:setActualWeight(animal:getActualWeight() * 0.7)

	meat:setLipids(animal:getLipids() * 0.75)
	meat:setProteins(animal:getProteins() * 0.75)
	meat:setCalories(animal:getCalories() * 0.75)
	meat:setCarbohydrates(animal:getCarbohydrates() * 0.75)

	return meat	
end

function HydrocraftButchering_ButcherSmallAnimal(items, result, player)

	local animal, knife = HydrocraftButchering_SplitItems(items)
	local fullType = animal:getFullType()

	--some give generic items, like all the big animals
	-- vary rewards based on weight?
	--some give an edible / cookable (rabbit, chicken, turkey).

	local inv = player:getInventory()

	if(fullType == "Base.DeadRabbit") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Rabbitmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCHiderawrabbit")
	elseif(fullType == "Base.DeadSquirrel") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCHiderawsquirrel")
	elseif(fullType == "Hydrocraft.HCMuskratdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCHiderawmuskrat")
	elseif(fullType == "Hydrocraft.HCGroundhogdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCHiderawgroundhog")
	elseif(fullType == "Base.DeadMouse" or fullType == "Base.DeadRat") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
		--no hide, no bones
	elseif(fullType == "Hydrocraft.HCPondturtle") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
	elseif(fullType == "Hydrocraft.HCSnappingturtle") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallanimalmeat")
		inv:AddItem(meat)
	-----------------------------------------------	
	--for animals below, maybe adjust the number of small game steaks based on the animals weight
	--maybe add a bonus for good cooks?
	-----------------------------------------------
	elseif(fullType == "Hydrocraft.HCNutriadead") then
		inv:AddItem("Hydrocraft.HCHiderawnutria")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCBeaverdead") then
		inv:AddItem("Hydrocraft.HCHiderawbeaver")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCPorcupinedead") then
		inv:AddItem("Hydrocraft.HCPorcupinequills")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCArmadillodead") then
		inv:AddItem("Hydrocraft.HCHiderawarmadillo")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCFoxdead") then
		inv:AddItem("Hydrocraft.HCHiderawfox")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCOpossumdead") then
		inv:AddItem("Hydrocraft.HCHiderawopossum")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCSkunkdead") then
		inv:AddItem("Hydrocraft.HCHiderawskunk")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCRaccoondead") then
		inv:AddItem("Hydrocraft.HCHiderawraccoon")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 4)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCBone", 2)
	elseif(fullType == "Hydrocraft.HCBeagledead" or fullType == "Hydrocraft.HCBernesedead" or fullType == "Hydrocraft.HCBordercolliedead" or fullType == "Hydrocraft.HCBoxerdead" or fullType == "Hydrocraft.HCColliedead" or fullType == "Hydrocraft.HCCorgidead" or fullType == "Hydrocraft.HCDachshunddead" or fullType == "Hydrocraft.HCDobermandead" or fullType == "Hydrocraft.HCGermanshepherddead" or fullType == "Hydrocraft.HCGreatdanedead" or fullType == "Hydrocraft.HCGoldendead" or fullType == "Hydrocraft.HCHeelerdead" or fullType == "Hydrocraft.HCHuskydead" or fullType == "Hydrocraft.HCIrishsetterdead" or fullType == "Hydrocraft.HCLabradordead" or fullType == "Hydrocraft.HCPitbulldead" or fullType == "Hydrocraft.HCRottweilerdead" or fullType == "Hydrocraft.HCShibainudead") then
		inv:AddItem("Hydrocraft.HCHiderawdog")
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 11)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCLard", 2)
		inv:AddItems("Hydrocraft.HCBone", 3)
	elseif(fullType == "Hydrocraft.HCCatdead" or fullType == "Hydrocraft.HCCatblackdead" or fullType == "Hydrocraft.HCCatbluedead"or fullType == "Hydrocraft.HCCatbrowndead" or fullType == "Hydrocraft.HCCatcreamdead" or fullType == "Hydrocraft.HCCatgingerdead" or fullType == "Hydrocraft.HCCatsilverdead" or fullType == "Hydrocraft.HCCatwhitedead") then
		--no cat hide
		inv:AddItems("Hydrocraft.HCSmallgamesteak", 5)
		inv:AddItems("Hydrocraft.HCIntestines", 2)
		inv:AddItems("Hydrocraft.HCLard", 2)
		inv:AddItem("Hydrocraft.HCBone")
	else
		print("Exception: unknown small animal: " .. animal:getFullType() )
		return
	end
	
	player:getXp():AddXP(Perks.Cooking, 2);
	
end

function HydrocraftButchering_ButcherBird(items, result, player)

	local animal, knife = HydrocraftButchering_SplitItems(items)
	local fullType = animal:getFullType()
	local inv = player:getInventory()

	if(fullType == "Hydrocraft.HCChickendead" or fullType == "Hydrocraft.HCChickendead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Chicken")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCTurkeydead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCTurkeymeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 12)		
	elseif(fullType == "Hydrocraft.HCPigeondead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCWhitefeathers", 2)
	elseif(fullType == "Hydrocraft.HCQuaildead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 2)
	elseif(fullType == "Hydrocraft.HCGrousedead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 2)
	elseif(fullType == "Hydrocraft.HCCrowdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBlackfeathers", 4)
	elseif(fullType == "Hydrocraft.HCMagpiedead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCWhitefeathers", 3)
	elseif(fullType == "Hydrocraft.HCBluejaydead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBluejayfeather", 2)
	elseif(fullType == "Hydrocraft.HCCardinaldead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCRedfeather", 2)
	elseif(fullType == "Hydrocraft.HCSparrowdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 2)
	elseif(fullType == "Base.DeadBird") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Base.Smallbirdmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 2)
	elseif(fullType == "Hydrocraft.HCDuckdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCWhitefeathers", 5)
	elseif(fullType == "Hydrocraft.HCCootdead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBlackfeathers", 5)
	elseif(fullType == "Hydrocraft.HCBlackduckdead" or fullType == "Hydrocraft.HCBlackduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBlackfeathers", 5)
	elseif(fullType == "Hydrocraft.HCCanvasbackduckdead" or fullType == "Hydrocraft.HCCanvasbackduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCMallarddead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCPintailduckdead" or fullType == "Hydrocraft.HCPintailduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCRedheadduckdead" or fullType == "Hydrocraft.HCRedheadduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCScaupduckdead" or fullType == "Hydrocraft.HCScaupduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCWoodduckdead" or fullType == "Hydrocraft.HCWoodduckdead2") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCDuckmeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 5)
	elseif(fullType == "Hydrocraft.HCSnowgoosedead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCGoosemeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCWhitefeathers", 6)
	elseif(fullType == "Hydrocraft.HCCanadiangoosedead") then
		local meat = HydrocraftButchering_GenericButcherMeat(animal, "Hydrocraft.HCGoosemeat")
		inv:AddItem(meat)
		inv:AddItem("Hydrocraft.HCBone")
		inv:AddItem("Hydrocraft.HCWishbone")
		inv:AddItems("Hydrocraft.HCBrownfeathers", 6)
	end

	player:getXp():AddXP(Perks.Cooking, 2);
	
end

