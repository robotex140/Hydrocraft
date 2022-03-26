
--copied from vanilla, do not change.
local function iterList(_list)
	local list = _list;
	local size = list:size() - 1;
	local i = -1;
	return function()
		i = i + 1;
		if i <= size and not list:isEmpty() then
			return list:get(i), i;
		end;
	end;
end

--doWildFoodSpawn, copied from vanilla, do not change.
--problem: _items is nil!
local function doWildFoodSpawn(_character, _inventory, _itemDef, _items)

	--print("******** What is _items ? ", _items)
	--print("******** What is _items : 1 - ", _items:get(1), _items:get(1):getDisplayName())

	-- Randomize the size of the item
	local perkLevel = forageSystem.getPerkLevel(_character, _itemDef);
	for item in iterList(_items) do
		item:setName(item:getDisplayName() .. " (" .. getText("UI_foraging_WildFood") .. ")"); --appends "(wild)"
		--25 to 75 percent size
		local sizeModifier = ((ZombRand(50) + 25) / 100);
		--add up to 50% for perk level
		sizeModifier = sizeModifier + ((ZombRand(perkLevel) + 1) / 5)
		-- Set the item's stats depending on the random size
		if item:getBaseHunger() <= -0.02 then
			item:setBaseHunger(item:getBaseHunger() * sizeModifier);
			item:setHungChange(item:getHungChange() * sizeModifier);
			item:setCarbohydrates(item:getCarbohydrates() * sizeModifier);
			item:setLipids(item:getLipids() * sizeModifier);
			item:setProteins(item:getProteins() * sizeModifier);
			item:setCalories(item:getCalories() * sizeModifier);
			item:setUnhappyChange(item:getUnhappyChange() * sizeModifier);
			--item:multiplyFoodValues(sizeModifier); --commented out in original
			--item:setActualWeight(item:getActualWeight() * sizeModifier); --commented out in original
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

--doRandomAgeSpawn, copied from vanilla, do not change.
local function doRandomAgeSpawn(_character, _inventory, _itemDef, _items)
	-- Randomize the size of the item
	local perkLevel = forageSystem.getPerkLevel(_character, _itemDef);
	for item in iterList(_items) do
		--set random age based on perkLevel and random chance
		local randomAge = 0;
		if (ZombRand(10) + 1) <= perkLevel then
			randomAge = ZombRandFloat(0.0, item:getOffAge() / 2);
		elseif ZombRand(3) <= perkLevel then
			randomAge = ZombRandFloat(0.0, item:getOffAge());
		else
			randomAge = ZombRandFloat(item:getOffAge(), item:getOffAgeMax());
		end;
		item:setAge(randomAge);
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

--copied worldSprites.berryBushes in vanilla
local berryBushes = {
	{ "f_bushes_1_4", "f_bushes_1_68", "f_bushes_1_84" },
	{ "f_bushes_1_4", "f_bushes_1_68", "f_bushes_1_88" },
}

local hcForageDefs = {}

--tweaked from vanilla, but with just HC berries.
local function generateHCBerryDefs()
	local items = {
		specific = {
			chance = 10,
			poisonChance = 0,
			poisonPowerMin = 0,
			poisonPowerMax = 0,
			poisonDetectionLevel = 0,
			spawnFuncs = { doWildFoodSpawn, doRandomAgeSpawn }, --doWildFoodSpawn, doRandomAgeSpawn, removed as causing Exceptions
			items = {
				HCCandleberry = "Hydrocraft.HCCandleberry",
				HCHuckleberry = "Hydrocraft.HCHuckleberry",
				HCCranberry = "Hydrocraft.HCCranberry",
				HCSeaberry = "Hydrocraft.HCSeaberry",
				HCBlackcurrant = "Hydrocraft.HCBlackcurrant",
				HCRedcurrant = "Hydrocraft.HCRedcurrant",
				HCArrowwoodberry = "Hydrocraft.HCArrowwoodberry",
				HCRaspberry = "Hydrocraft.HCRaspberry",
				HCElderberry = "Hydrocraft.HCElderberry",
				--HCHolly = "Hydrocraft.HCHolly", --flower? or berry?
				HCBlackthornberry = "Hydrocraft.HCBlackthornberry",
				HCCrampbarkberry = "Hydrocraft.HCCrampbarkberry",
				HCCrowberry = "Hydrocraft.HCCrowberry",
				HCGooseberry = "Hydrocraft.HCGooseberry",
				HCHawthornfruit = "Hydrocraft.HCHawthornfruit",
				HCJuniperberry = "Hydrocraft.HCJuniperberry",
				HCSumacberry = "Hydrocraft.HCSumacberry",
			},
		},
	};
	for _, spawnTable in pairs(items) do
		for itemName, itemFullName in pairs(spawnTable.items) do
			hcForageDefs[itemName] = {
				type = itemFullName,
				minCount = 1,
				maxCount = 4,
				xp = 5,
				snowChance = -10,
				categories = { "Berries" },
				zones = { --edit? chance should vary?
					Forest      = spawnTable.chance,
					DeepForest  = spawnTable.chance,
					Vegitation  = spawnTable.chance,
					FarmLand    = spawnTable.chance,
					Farm        = spawnTable.chance,
				},
				months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
				bonusMonths = { 5, 6, 7 },
				malusMonths = { 3, 4 },
				spawnFuncs = spawnTable.spawnFuncs,
				poisonChance = spawnTable.poisonChance, --0
				poisonPowerMin = spawnTable.poisonPowerMin, --0
				poisonPowerMax = spawnTable.poisonPowerMax, --0
				poisonDetectionLevel = spawnTable.poisonDetectionLevel,  --0
				altWorldTexture = berryBushes, --worldSprites.berryBushes, --caused an error, as worldSprites is nil (not visible)
				doIsoMarkerObject = true,
				itemSizeModifier = 1.0,
			};
		end;
	end;
end

local function generateHCMushroomDefs()
	local items = {
		generic = {
			chance = 15, --test, change back 15
			poisonChance = 0,
			poisonPowerMin = 0,
			poisonPowerMax = 0,
			poisonDetectionLevel = 0,
			spawnFuncs = { doWildFoodSpawn, doRandomAgeSpawn }, --doPoisonItemSpawn removed, as thse are not poisonous, doWildFoodSpawn, doRandomAgeSpawn removed as causing Exceptions
			items = {
				HCPortobello	 = "Hydrocraft.HCPortobello",
				HCShiitake		 = "Hydrocraft.HCShiitake",
				HCBlewitshroom	 = "Hydrocraft.HCBlewitshroom",
				HCLobstershroom	 = "Hydrocraft.HCLobstershroom",
				HCWitchshatshroom = "Hydrocraft.HCWitchshatshroom",
				HCYellowmorelshroom = "Hydrocraft.HCYellowmorelshroom",
				HCChantrelle	 = "Hydrocraft.HCChantrelle",
			},
		},
	};
	for _, spawnTable in pairs(items) do
		for itemName, itemFullName in pairs(spawnTable.items) do
			hcForageDefs[itemName] = {
				type = itemFullName,
				minCount = 1,
				maxCount = 3,
				xp = 5,
				rainChance = 15,
				categories = { "Mushrooms" },
				zones = { --edit, chance should vary.
					Forest      = 10, --spawnTable.chance,
					DeepForest  = 15,
					--Vegitation  = spawnTable.chance,
					--FarmLand    = spawnTable.chance,
					--Farm        = spawnTable.chance,
					--TrailerPark = spawnTable.chance,
					--TownZone    = spawnTable.chance,
					--Nav         = spawnTable.chance,
				},
				months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
				bonusMonths = { 8, 9, 10 },
				malusMonths = { 3, 4 },
				spawnFuncs = spawnTable.spawnFuncs,
				poisonChance = spawnTable.poisonChance,
				poisonPowerMin = spawnTable.poisonPowerMin,
				poisonPowerMax = spawnTable.poisonPowerMax,
				poisonDetectionLevel = spawnTable.poisonDetectionLevel,
			};
		end;
	end;
end

local function generateWoodDefs()

	hcForageDefs["HCOakLog"] = {
		type = "Hydrocraft.HCOakLog",
		skill = 5, --? Base.Log = 0
		xp = 10, --double that of Base.Log
		categories = { "Firewood" },
		zones = {
			DeepForest  = 1,
			Forest      = 1,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		itemSizeModifier = 5,
		isItemOverrideSize = true,
	}

	hcForageDefs["HCYewbough"] = {
		type = "Hydrocraft.HCYewbough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCSprucebough"] = {
		type = "Hydrocraft.HCSprucebough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCElmbough"] = {
		type = "Hydrocraft.HCElmbough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCAlderbough"] = {
		type = "Hydrocraft.HCAlderbough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCWillowbranch"] = {
		type = "Hydrocraft.HCWillowbranch",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCFirbough"] = {
		type = "Hydrocraft.HCFirbough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCPinebough"] = {
		type = "Hydrocraft.HCPinebough",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "Firewood" },
		zones = {
			DeepForest  = 3, --1/5 as common as Base.TreeBranch
			Forest      = 3,
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		bonusMonths = { 9, 10, 11 },
	}

	hcForageDefs["HCBirdnesteggs"] = {
		type = "Hydrocraft.HCBirdnesteggs",
		minCount = 1,
		maxCount = 2,
		xp = 2,
		categories = { "ForestRarities" }, --Locked behind foraging 8
		zones = {
			DeepForest  = 1,
			Forest      = 1,
		},
	}
	
end

local function generateClayDefs()
	hcForageDefs["HCRedclay"] = {
		type = "Hydrocraft.HCRedclay",
		minCount = 3,
		maxCount = 5,
		snowChance = -50,
		skill = 2, --? Base.Log = 0
		xp = 5,
		categories = { "Stones" },
		zones = {
			DeepForest  = 2,
			Forest      = 2,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
	}
	
	hcForageDefs["HCGreyclay"] = {
		type = "Hydrocraft.HCGreyclay",
		minCount = 3,
		maxCount = 5,
		snowChance = -50,
		skill = 2, --? Base.Log = 0
		xp = 5,
		categories = { "Stones" },
		zones = {
			DeepForest  = 2,
			Forest      = 2,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
	}	
end

local function createFlowerCategory()

	local flowersCatDef = { --1052
		name = "Flowers",
		typeCategory            = "Food",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 0,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 30,
			Forest          = 30,
			Vegitation      = 30,
			FarmLand        = 30,
			Farm            = 30,
			TrailerPark     = 15,
			TownZone        = 15,
			--Nav             = 120,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 20.0,
		chanceToCreateIcon      = 10.0,
		focusChanceMin			= 25.0,
		focusChanceMax			= 40.0,
	}

	forageSystem.addCatDef( flowersCatDef )
	
end

local function generateFlowerDefs()
	local items = {
		specific = {
			chance = 10,
			poisonChance = 0,
			poisonPowerMin = 0,
			poisonPowerMax = 0,
			poisonDetectionLevel = 0,
			spawnFuncs = { },
			items = {
				HCBleedingheart = "Hydrocraft.HCBleedingheart",
				HCTetterwort = "Hydrocraft.HCTetterwort",
				HCMazus = "Hydrocraft.HCMazus",
				HCCamellia = "Hydrocraft.HCCamellia",
				HCMorningglory = "Hydrocraft.HCMorningglory",
				HCStrelitzia = "Hydrocraft.HCStrelitzia",
				HCColumbine = "Hydrocraft.HCColumbine",
				HCCinquefoils = "Hydrocraft.HCCinquefoils",
				HCChrysanthemum = "Hydrocraft.HCChrysanthemum",
				HCSunflower = "Hydrocraft.HCSunflower",
				HCRhododendron = "Hydrocraft.HCRhododendron",
				HCCalily = "Hydrocraft.HCCalily",
				HCMagnolia = "Hydrocraft.HCMagnolia",
				HCCarnation = "Hydrocraft.HCCarnation",
				HCBluedaisy = "Hydrocraft.HCBluedaisy",
				HCAnemome = "Hydrocraft.HCAnemome",
				HCTulip = "Hydrocraft.HCTulip",
				HCPansy = "Hydrocraft.HCPansy",
				HCDaisy = "Hydrocraft.HCDaisy",
				HCIris = "Hydrocraft.HCIris",
				HCWolfsbane = "Hydrocraft.HCWolfsbane",
				HCMandrake = "Hydrocraft.HCMandrake",
				HCBelladonna = "Hydrocraft.HCBelladonna",
				HCValerian = "Hydrocraft.HCValerian",
				HCCamomile = "Hydrocraft.HCCamomile",
				HCLavender = "Hydrocraft.HCLavender",
				HCSpeedwell = "Hydrocraft.HCSpeedwell",
				HCDogwood = "Hydrocraft.HCDogwood",
				HCChicory = "Hydrocraft.HCChicory",
				HCHolly = "Hydrocraft.HCHolly",			
				HCJutestems = "Hydrocraft.HCJutestems",
				HCThistle = "Hydrocraft.HCThistle",
				HCRosebud = "Hydrocraft.HCRosebud",
				HCFlaxflower = "Hydrocraft.HCFlaxflower",
				HCFlax = "Hydrocraft.HCFlax",
				HCClover = "Hydrocraft.HCClover",
				HCNettles = "Hydrocraft.HCNettles",				
			},
		},
	};
	for _, spawnTable in pairs(items) do
		for itemName, itemFullName in pairs(spawnTable.items) do
			hcForageDefs[itemName] = {
				type = itemFullName,
				minCount = 2,
				maxCount = 4,
				xp = 5,
				snowChance = -10,
				categories = { "Flowers" },
				zones = { --edit? chance should vary?
					Forest      = spawnTable.chance,
					DeepForest  = spawnTable.chance,
					Vegitation  = spawnTable.chance,
					FarmLand    = spawnTable.chance,
					Farm        = spawnTable.chance,
				},
				months = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
				bonusMonths = { 5, 6, 7 },
				malusMonths = { 3, 4 },
				spawnFuncs = spawnTable.spawnFuncs,
				poisonChance = spawnTable.poisonChance, --0
				poisonPowerMin = spawnTable.poisonPowerMin, --0
				poisonPowerMax = spawnTable.poisonPowerMax, --0
				poisonDetectionLevel = spawnTable.poisonDetectionLevel,  --0
				--altWorldTexture = berryBushes,
				doIsoMarkerObject = true,
				itemSizeModifier = 1.0,
			};
		end;
	end;
end

local function OnLoadHydrocraftForaging()

	--print(" *************** OnLoadHydrocraftForaging()")
	
	generateHCBerryDefs()
	generateHCMushroomDefs()
	
	generateWoodDefs()
	generateClayDefs()
	
	--createFlowerCategory() --too many flowers, too hard to find via foraging.
	--generateFlowerDefs()
	
	forageSystem.populateItemDefs(hcForageDefs, false) --false means don't remove existing defs.

end

Events.OnLoad.Add(OnLoadHydrocraftForaging)



--[[

Note: the is a bug in vanilla PZ.

When an item is found via foraging, the icon displays above the player's head.  If the item is from a mod the icon fails to load, which results in a very long file path being displayed instead.

Acknowledged by the devs in ISforageAction.lua:
"TODO: this requires item images to be in media/textures - should get the image location from the texture here instead"

]]--
