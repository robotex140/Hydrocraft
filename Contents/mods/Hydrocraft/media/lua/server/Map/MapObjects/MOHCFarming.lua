--***********************************************************
--**                    THE TRYNAEAT STONE                    **
--***********************************************************

if isClient() then return end

require "Farming/SFarmingSystem"
require "Farming/farming_vegetableconf"

local function noise(message) SFarmingSystem.instance:noise(message) end

local function NewPlant(isoObject, typeOfSeed)
	local square = isoObject:getSquare()
	removeExistingLuaObject(square)

	local spriteName = isoObject:getSprite():getName()
	local luaObject = SFarmingSystem.instance:newLuaObjectOnSquare(square)
	luaObject:initNew()
	luaObject.exterior = square:isOutside()
	isoObject:setSpecialTooltip(true)

	luaObject:seed(typeOfSeed)
	luaObject.waterLvl = ZombRand(luaObject.waterNeeded, luaObject.waterNeededMax or 100)

	-- plow: nbOfGrow == -1
	-- seed: nbOfGrow == 0 -> 1
	-- rotten: nbOfGrow == 1

	local sprites = farming_vegetableconf.sprite[typeOfSeed]
	local nbOfGrow = 1
	for i=1,#sprites do
		if sprites[i] == spriteName then
			break
		end
		nbOfGrow = nbOfGrow + 1
	end

	for i=1,nbOfGrow-1 do
		SFarmingSystem.instance:growPlant(luaObject, nil, true)
		luaObject.waterLvl = ZombRand(luaObject.waterNeeded, luaObject.waterNeededMax or 100)
	end

	isoObject:setName(luaObject.objectName)
	isoObject:setSprite(luaObject.spriteName)
	luaObject:toModData(isoObject:getModData())
	noise('created luaObject from pre-existing isoObject '..luaObject.x..','..luaObject.y)
end

local function NewOnion(isoObject)
    NewPlant(isoObject, "Onion")
end

local function NewCorn(isoObject)
    NewPlant(isoObject, "Corn")
end

local function NewWheat(isoObject)
    NewPlant(isoObject, "Wheat")
end

local function NewHemp(isoObject)
    NewPlant(isoObject, "Hemp")
end

local function NewGrapes(isoObject)
    NewPlant(isoObject, "Grapes")
end

local function NewLettuce(isoObject)
    NewPlant(isoObject, "Lettuce")
end

local function NewPeanut(isoObject)
    NewPlant(isoObject, "Peanut")
end

local function NewFlax(isoObject)
    NewPlant(isoObject, "Flax")
end

local function NewCoffeeBeans(isoObject)
    NewPlant(isoObject, "CoffeeBeans")
end

local function NewSunflower(isoObject)
    NewPlant(isoObject, "Sunflower")
end

local function NewSoyBeans(isoObject)
    NewPlant(isoObject, "SoyBeans")
end

local function NewMulberries(isoObject)
    NewPlant(isoObject, "Mulberries")
end

local function NewCandleberries(isoObject)
    NewPlant(isoObject, "Candleberries")
end

local function NewLemontree(isoObject)
    NewPlant(isoObject, "Lemontree")
end

local PRIORITY = 5

MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Onion, NewOnion, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Corn, NewCorn, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Wheat, NewWheat, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Hemp, NewHemp, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Grapes, NewGrapes, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Lettuce, NewLettuce, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Peanut, NewPeanut, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Flax, NewFlax, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.CoffeeBeans, NewCoffeeBeans, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Sunflower, NewSunflower, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.SoyBeans, NewSoyBeans, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Mulberries, NewMulberries, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Candleberries, NewCandleberries, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Lemontree, NewLemontree, PRIORITY)

---

local function LoadPlant(isoObject, typeOfSeed)
	if not SFarmingSystem.instance:isValidIsoObject(isoObject) then
		noise("couldn't find valid modData for existing isoObject; recreating it")
		NewPlant(isoObject, typeOfSeed)
	end
	SFarmingSystem.instance:loadIsoObject(isoObject)
end

local function LoadOnion(isoObject)
    LoadPlant(isoObject, "Onion")
end

local function LoadCorn(isoObject)
    LoadPlant(isoObject, "Corn")
end

local function LoadWheat(isoObject)
    LoadPlant(isoObject, "Wheat")
end

local function LoadHemp(isoObject)
    LoadPlant(isoObject, "Hemp")
end

local function LoadGrapes(isoObject)
    LoadPlant(isoObject, "Grapes")
end

local function LoadLettuce(isoObject)
    LoadPlant(isoObject, "Lettuce")
end

local function LoadPeanut(isoObject)
    LoadPlant(isoObject, "Peanut")
end

local function LoadFlax(isoObject)
    LoadPlant(isoObject, "Flax")
end

local function LoadCoffeeBeans(isoObject)
    LoadPlant(isoObject, "CoffeeBeans")
end

local function LoadSunflower(isoObject)
    LoadPlant(isoObject, "Sunflower")
end

local function LoadSoyBeans(isoObject)
    LoadPlant(isoObject, "SoyBeans")
end

local function LoadMulberries(isoObject)
    LoadPlant(isoObject, "Mulberries")
end

local function LoadCandleberries(isoObject)
    LoadPlant(isoObject, "Candleberries")
end

local function LoadLemontree(isoObject)
    LoadPlant(isoObject, "Lemontree")
end

MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Onion, LoadOnion, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Corn, LoadCorn, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Wheat, LoadWheat, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Hemp, LoadHemp, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Grapes, LoadGrapes, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Lettuce, LoadLettuce, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Peanut, LoadPeanut, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Flax, LoadFlax, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.CoffeeBeans, LoadCoffeeBeans, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Sunflower, LoadSunflower, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.SoyBeans, LoadSoyBeans, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Mulberries, LoadMulberries, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Candleberries, LoadCandleberries, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Lemontree, LoadLemontree, PRIORITY)
