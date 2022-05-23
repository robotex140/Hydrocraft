
local _searchEnabled = false
local _player = nil
--local readMammalGuide = false
--local readFlowerGuide = false
--local readTreeGuide = false

local FLOWERS = {
	"Hydrocraft.HCBleedingheart", "Hydrocraft.HCTetterwort", "Hydrocraft.HCMazus", "Hydrocraft.HCCamellia", "Hydrocraft.HCMorningglory", "Hydrocraft.HCStrelitzia", "Hydrocraft.HCColumbine", "Hydrocraft.HCCinquefoils","Hydrocraft.HCChrysanthemum", "Hydrocraft.HCSunflower", "Hydrocraft.HCRhododendron", "Hydrocraft.HCCalily","Hydrocraft.HCMagnolia","Hydrocraft.HCCarnation", "Hydrocraft.HCBluedaisy", "Hydrocraft.HCAnemome", "Hydrocraft.HCDaffodil","Hydrocraft.HCTulip", "Hydrocraft.HCPansy", "Hydrocraft.HCDaisy", "Hydrocraft.HCIris", "Hydrocraft.HCWolfsbane","Hydrocraft.HCMandrake", "Hydrocraft.HCBelladonna", "Hydrocraft.HCValerian", "Hydrocraft.HCCamomile", "Hydrocraft.HCLavender","Hydrocraft.HCSpeedwell", "Hydrocraft.HCDogwood", "Hydrocraft.HCChicory", "Hydrocraft.HCKvann", "Hydrocraft.HCHolly","Hydrocraft.HCJutestems", "Hydrocraft.HCThistle", "Base.Violets", "Hydrocraft.HCRosebud", "Hydrocraft.HCFlaxflower", "Hydrocraft.HCFlax", "Hydrocraft.HCClover", "Hydrocraft.HCNettles", "Hydrocraft.HCBirchcatkin"
}

local NUTS = {
	"Hydrocraft.HCAcorn", "Hydrocraft.HCBeechnut", "Hydrocraft.HCFircone", "Hydrocraft.HCPinenuts", "Hydrocraft.HCChestnut", "Hydrocraft.HCHickorynuts"
}

local BARK = {
	"Hydrocraft.HCBark", "Hydrocraft.HCBirchbark", "Hydrocraft.HCWillowbark"
}

local LEAVES = {
	"Hydrocraft.HCHickoryleaves", "Hydrocraft.HCOakleaves", "Hydrocraft.HCMapleleaf", "Hydrocraft.HCFern", "Hydrocraft.HCFiddleheadfern", "Hydrocraft.HCMulberryleaf"
}

--lazy randomness
local FOREST_DUNG = {"Hydrocraft.HCBearpoop", "Hydrocraft.HCCougarpoop", "Hydrocraft.HCBoarpoop", "Hydrocraft.HCDeerpoop","Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop"
}

--more lazy randomness
local FARM_DUNG = {"Hydrocraft.HCHorsepoopferal", "Hydrocraft.HCDonkeypoopferal", "Hydrocraft.HCPigpoopferal", "Hydrocraft.HCGoatpoopferal", "Hydrocraft.HCSheeppoopferal", "Hydrocraft.HCCowpoopferal"
}

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
					TrailerPark = 0,
					TownZone    = 0,
					Nav         = 0,
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
				HCPortobello		=	"Hydrocraft.HCPortobello",
				HCShiitake			=	"Hydrocraft.HCShiitake",
				HCBlewitshroom		=	"Hydrocraft.HCBlewitshroom",
				HCLobstershroom		=	"Hydrocraft.HCLobstershroom",
				HCWitchshatshroom	=	"Hydrocraft.HCWitchshatshroom",
				HCYellowmorelshroom	=	"Hydrocraft.HCYellowmorelshroom",
				HCChantrelle		=	"Hydrocraft.HCChantrelle",
				HCGarlic			=	"Hydrocraft.HCGarlic", --shoe-horned in, need to look into adding HC 'crop' items to farm land.
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
				zones = {
					Forest      = 10, 
					DeepForest  = 15,
					Vegitation  = 0,
					FarmLand    = 0,
					Farm        = 0,
					TrailerPark = 0,
					TownZone    = 0,
					Nav         = 0,
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
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
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
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
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
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
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
			Vegitation  = 0,
			FarmLand    = 0,
			Farm        = 0,
			TrailerPark = 0,
			TownZone    = 0,
			Nav         = 0,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
	}	
end

local function createHCCategories()

	local flowersCatDef = { --1052
		name = "Flowers",
		typeCategory            = "Food", --?
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 2,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 0,--30
			Forest          = 0,--30
			Vegitation      = 0,--30
			FarmLand        = 0,--30
			Farm            = 0,--30
			TrailerPark     = 0,--15
			TownZone        = 0,--15
			Nav             = 0,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 0.0, --20.0
		chanceToCreateIcon      = 0.0, --20.0
		focusChanceMin			= 0.0, --25.0
		focusChanceMax			= 0.0, --40.0
	}

	local nutsCatDef = { --1052
		name = "Nuts",
		typeCategory            = "Food", --?
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 3,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 0,--30
			Forest          = 0,--30
			Vegitation      = 0,--30
			FarmLand        = 0,--30
			Farm            = 0,--30
			TrailerPark     = 0,--15
			TownZone        = 0,--15
			Nav             = 0,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 0.0, --20.0
		chanceToCreateIcon      = 0.0, --20.0
		focusChanceMin			= 0.0, --25.0
		focusChanceMax			= 0.0, --40.0
	}	

	local leavesCatDef = { --1052
		name = "Leaves",
		typeCategory            = "Food", --?
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 1,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 0,--30
			Forest          = 0,--30
			Vegitation      = 0,--30
			FarmLand        = 0,--30
			Farm            = 0,--30
			TrailerPark     = 0,--15
			TownZone        = 0,--15
			Nav             = 0,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 0.0, --20.0
		chanceToCreateIcon      = 0.0, --20.0
		focusChanceMin			= 0.0, --25.0
		focusChanceMax			= 0.0, --40.0
	}

	local dungCatDef = { --1052
		name = "Dung",
		typeCategory            = "Food", --?
		identifyCategoryPerk    = "Trapping",
		identifyCategoryLevel   = 2,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 0,--30
			Forest          = 0,--30
			Vegitation      = 0,--30
			FarmLand        = 0,--30
			Farm            = 0,--30
			TrailerPark     = 0,--15
			TownZone        = 0,--15
			Nav             = 0,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 0.0, --20.0
		chanceToCreateIcon      = 0.0, --20.0
		focusChanceMin			= 0.0, --25.0
		focusChanceMax			= 0.0, --40.0
	}

	local barkCatDef = { --1052
		name = "Bark",
		typeCategory            = "Food", --?
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 0,
		categoryHidden          = false,
		validFloors             = { "ANY" },
		zoneChance              = {
			DeepForest      = 0,--30
			Forest          = 0,--30
			Vegitation      = 0,--30
			FarmLand        = 0,--30
			Farm            = 0,--30
			TrailerPark     = 0,--15
			TownZone        = 0,--15
			Nav             = 0,
		},
		--spriteAffinities        = spriteAffinities.stones,
		chanceToMoveIcon        = 0.0, --20.0
		chanceToCreateIcon      = 0.0, --20.0
		focusChanceMin			= 0.0, --25.0
		focusChanceMax			= 0.0, --40.0
	}
	
	forageSystem.addCatDef( flowersCatDef )
	forageSystem.addCatDef( nutsCatDef )
	forageSystem.addCatDef( leavesCatDef )
	forageSystem.addCatDef( dungCatDef )
	forageSystem.addCatDef( barkCatDef )
	
end

--never called
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
	
	createHCCategories()
	--generateFlowerDefs()
	
	forageSystem.populateItemDefs(hcForageDefs, false) --false means don't remove existing defs.

end

local function onEnableSearchMode(player, isSearchMode)
	_searchEnabled = true
	_player = player

	--local books = _player:getAlreadyReadBook()
	--readMammalGuide = books:contains("Hydrocraft.HCBookmammalguide")
	--readFlowerGuide = books:contains("Hydrocraft.HCBookflowerguide")
	--readTreeGuide = books:contains("Hydrocraft.HCBooktreeguide")
	
end

local function onDisableSearchMode(player, isSearchMode)
	searchEnabled = false
	_player = nil
	--readMammalGuide = false
	--readFlowerGuide = false
	--readTreeGuide = false
end

local function randomFlower(zoneType)

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation" and zoneType ~= "FarmLand" and zoneType ~= "Farm" and zoneType ~= "TrailerPark" and zoneType ~= "TownZone") then
		return nil
	end
	
	local flower = FLOWERS[ZombRand(#(FLOWERS)) + 1]
	return flower
	
end

local function randomDung(zoneType)
	local dung = nil
	if(zoneType == "Forest" or zoneType == "DeepForest") then
		dung = FOREST_DUNG[ZombRand(#(FOREST_DUNG)) + 1]
	elseif(zoneType ~= "FarmLand" or zoneType ~= "Farm") then
		dung = FARM_DUNG[ZombRand(#(FARM_DUNG)) + 1]
	end
	return dung
end

local function randomNut(zoneType)
	local nut = nil
	if(zoneType == "Forest" or zoneType == "DeepForest") then
		nut = NUTS[ZombRand(#(NUTS)) + 1]
	end
	return nut
end

local function randomBark(zoneType)
	local bark = nil
	if(zoneType == "Forest" or zoneType == "DeepForest") then
		bark = BARK[ZombRand(#(BARK)) + 1]
	end
	return bark
end

local function randomLeaf(zoneType)
	local leaf = nil
	if(zoneType == "Forest" or zoneType == "DeepForest") then
		leaf = LEAVES[ZombRand(#(LEAVES)) + 1]
	end
	return leaf
end

local function EveryOneMinute()
	if(not _searchEnabled or _player == nil) then
		return
	end

	-- 80% return on very poor, 0% return on very abundant
	if(ZombRand(5) + 1 > SandboxVars.NatureAbundance) then return end	

	local sq = _player:getCurrentSquare()
	if(sq:getZ() > 0) then return end

	if(not _player:isOutside()) then return end
	
	--if(_player:Asleep()) then return end

	--if(not _player:isMoving()) then print(" ** not moving!") return end
	
	local zoneType = sq:getZoneType()	
	if(zoneType == nil) then return end
	
	local searchWindow = ISSearchWindow.players[_player]
	--local i = searchWindow.searchFocus.selected --index
	local c = searchWindow.searchFocusCategory --category
	--print("***************** ", c)

	local foragingLevel = _player:getPerkLevel(Perks.PlantScavenging)
		
	if(ZombRand(10) > foragingLevel) then return end

	local xp = false

	local inv = _player:getInventory()
	if(c == "Flowers") then --and readFlowerGuide
		local flower = randomFlower(zoneType)
		if(flower ~= nil) then
			inv:AddItems(flower, ZombRand(4)+1)--1 to 4 flowers
			xp = true
		end
	elseif(c == "Dung") then
		local dung = randomDung(zoneType)
		if(dung ~= nil) then
			inv:AddItem(dung)
			xp = true
		end
	elseif(c == "Nuts") then --and (readTreeGuide or foragingLevel >= 4)
		local nut = randomNut(zoneType)
		if(nut ~= nil) then
			inv:AddItems(nut, ZombRand(2)+1)--1 or 2 nuts
			xp = true
		end	
	elseif(c == "Bark") then
		local bark = randomBark(zoneType)
		if(bark ~= nil) then
			inv:AddItem(bark)
			xp = true
		end		
	elseif(c == "Leaves") then --and (readTreeGuide or foragingLevel >= 3)
		local leaf = randomLeaf(zoneType)
		if(leaf ~= nil) then
			inv:AddItems(leaf, ZombRand(3)+1)--1 to 3 leaves
			xp = true
		end			
	end

	if(xp == true) then
		_player:getXp():AddXP(Perks.PlantScavenging, 2)
		_player:Say("+1")
		--_player:getStats():setFatigue(_player:getStats():getFatigue()+0.05)
	end
	
end

Events.EveryOneMinute.Add(EveryOneMinute)

Events.onDisableSearchMode.Add(onDisableSearchMode)

Events.onEnableSearchMode.Add(onEnableSearchMode)

Events.OnLoad.Add(OnLoadHydrocraftForaging)

--[[

Note: the is a bug in vanilla PZ.

When an item is found via foraging, the icon displays above the player's head.  If the item is from a mod the icon fails to load, which results in a very long file path being displayed instead.

Acknowledged by the devs in ISforageAction.lua:
"TODO: this requires item images to be in media/textures - should get the image location from the texture here instead"

]]--
