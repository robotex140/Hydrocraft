local searchEnabled = false

local thePlayer = nil

local lastX = 0
local lastY = 0

local playerInventory = nil

local skillModifier = 1

local has3Books = false

local isWinter = false

local minutes = 0
local count = 0

local forestSpawnRate = 90
--"Base.Log", "Base.TreeBranch", "Base.Twigs", removed as common in vanilla, and logs are annoyingly heavy.
local forest_flora = {"Hydrocraft.HCOakLog", "Hydrocraft.HCAcorn", "Hydrocraft.HCYewbough", "Hydrocraft.HCSprucebough", "Hydrocraft.HCElmbough", "Hydrocraft.HCAlderbough", "Hydrocraft.HCWillowbranch", "Hydrocraft.HCFirbough", "Hydrocraft.HCPinebough", "Hydrocraft.HCMapleleaf", "Hydrocraft.HCHickoryleaves", "Hydrocraft.HCOakleaves", "Hydrocraft.HCWillowbark", "Hydrocraft.HCBirchbark", "Hydrocraft.HCBark", "Hydrocraft.HCCrabapple", "Hydrocraft.HCBlewitshroom", "Hydrocraft.HCLobstershroom", "Hydrocraft.HCYellowmorelshroom", "Hydrocraft.HCWitchshatshroom", "Base.MushroomGeneric7", "Base.MushroomGeneric6", "Base.MushroomGeneric5", "Base.MushroomGeneric4", "Base.MushroomGeneric3", "Base.MushroomGeneric2", "Base.MushroomGeneric1", "Hydrocraft.HCChantrelle"}

local vegetationSpawnRate = 60
local vegetation_flora = {"Hydrocraft.HCFlax", "Base.BerryGeneric1", "Base.BerryGeneric2", "Base.BerryGeneric3", "Base.BerryGeneric4", "Hydrocraft.HCThistle", "Base.Violets", "Hydrocraft.HCClover", "Hydrocraft.HCFern", "Hydrocraft.HCFiddleheadfern", "Hydrocraft.HCClover", "Hydrocraft.HCGrass", "Hydrocraft.HCNettles", "Hydrocraft.HCFlaxflower", "Hydrocraft.HCFlax", "Hydrocraft.HCRaspberry", "Hydrocraft.HCCandleberry"}

local farmSpawnRate = 30
local farm_flora = {"Hydrocraft.HCStraw", "farming.Cabbage", "farming.Potato", "Base.Corn"}

local townSpawnRate = 30
local town_flora = {"Hydrocraft.HCGrass"}


--[[
	low = {'','','','"','','','','','','','','','','','','','','','','','','','','','','','','','',''}
	medium = {'Hydrocraft.HCBleedingheart','','Hydrocraft.HCSeaberry','Hydrocraft.HCBlackcurrant','Hydrocraft.HCRedcurrant','Hydrocraft.HCCrampbarkberry','Hydrocraft.HCGooseberry','Hydrocraft.HCHuckleberry','Hydrocraft.HCCranberry','Hydrocraft.HCArrowwoodberry','Hydrocraft.HCRaspberry','Hydrocraft.HCSumacberry','Hydrocraft.HCCrowberry','Hydrocraft.HCBlackthornberry','Hydrocraft.HCHawthornfruit','','','','Hydrocraft.HCTetterwort','Hydrocraft.HCMazus','Hydrocraft.HCCamellia','Hydrocraft.HCMorningglory','Hydrocraft.HCStrelitzia','Hydrocraft.HCColumbine','Hydrocraft.HCCinquefoils','Hydrocraft.HCChrysanthemum','','Hydrocraft.HCSunflower','Hydrocraft.HCRhododendron','Hydrocraft.HCCalily','Hydrocraft.HCMagnolia','Hydrocraft.HCCarnation','Hydrocraft.HCBluedaisy',
	
	'','Hydrocraft.HCAnemome','Hydrocraft.HCDaffodil','Hydrocraft.HCTulip','Hydrocraft.HCPansy','Hydrocraft.HCDaisy','Hydrocraft.HCIris','Hydrocraft.HCWolfsbane','Hydrocraft.HCMandrake','Hydrocraft.HCBelladonna','','','','','','','','','','','Base.Rosehips','Hydrocraft.HCValerian','Hydrocraft.HCCamomile','Hydrocraft.HCLavender','Hydrocraft.HCSpeedwell','Hydrocraft.HCDogwood','','Hydrocraft.HCChicory','Hydrocraft.HCMulberry','Hydrocraft.HCMulberryleaf','Hydrocraft.HCKvann','Hydrocraft.HCHolly','Hydrocraft.HCJutestems','Hydrocraft.HCAcorn','Hydrocraft.HCThistle','Base.Violets','',''}
	good = {'Base.Lemon','Base.Apple','','','Hydrocraft.HCCamellia','','Hydrocraft.HCRosebud','Hydrocraft.HCLavender'}

	]]--
	
local function onEnableSearchMode(player, isSearchMode)
	searchEnabled = true
	thePlayer = player
	skillModifier = 1
	--player:Say("Nature Abundance: " .. SandboxVars.NatureAbundance)
	
	lastX = player:getX()
	lastY = player:getY()
	
	local traits = player:getTraits()

	--values copied from vanilla, forageSystem.lua
	--["Lucky"] = 1.0, ["Hiker"]= 1.0, 	["Formerscout"]	= 1.0, ["Hunter"]= 0.7, ["EagleEyed"]= 0.5,["Gardener"]	= 0.4,["Outdoorsman"]= 0.4,
	--["Cook"]= 0.2, ["NightVision"]= 0.2, ["Nutritionist"]	= 0.2, ["Herbalist"]= 0.2, ["Unlucky"]= -1.0, ["Agoraphobic"]= -1.5,["ShortSighted"]= -2.0,
		
	--positive traits
	if (traits:contains("Lucky")) then
		skillModifier = skillModifier + 10
	end	

	if (traits:contains("Hiker")) then
		skillModifier = skillModifier + 10
	end	

	if (traits:contains("FormerScout")) then
		skillModifier = skillModifier + 10
	end

	if (traits:contains("Hunter")) then
		skillModifier = skillModifier + 7
	end
	
	if (traits:contains("EagleEyed")) then
		skillModifier = skillModifier + 5
	end

	if (traits:contains("Gardener")) then
		skillModifier = skillModifier + 4
	end

	if (traits:contains("Outdoorsman")) then
		skillModifier = skillModifier + 4
	end	

	if (traits:contains("Cook")) then
		skillModifier = skillModifier + 2
	end

	if (traits:contains("NightVision")) then
		skillModifier = skillModifier + 2
	end

	if (traits:contains("Nutritionist")) then
		skillModifier = skillModifier + 2
	end

	if (traits:contains("Herbalist")) then
		skillModifier = skillModifier + 2
	end

	--negative traits
	if (traits:contains("Unlucky")) then
		skillModifier = skillModifier - 10
	end

	if (traits:contains("Agoraphobic")) then
		skillModifier = skillModifier - 15
	end

	if (traits:contains("ShortSighted")) then
		skillModifier = skillModifier - 20
	end
	
	local job = player:getDescriptor():getProfession()
	if (job == "ParkRanger") then --add more? "Lumberjack", "Chef", "Farmer", "Fisherman", "Veteran", "Unemployed"
		skillModifier = skillModifier + 1
	end

	local forageSkill = 0;
	local foraging = player:getPerkInfo(Perks.PlantScavenging);
	if(foraging ~= nil) then
		forageSkill = foraging:getLevel()
	end
	
	print ("forageSkill = " .. forageSkill)
	skillModifier = skillModifier + (forageSkill * 5)
	
	--player:Say("Modified skill: " .. skillModifier)
	
	playerInventory = player:getInventory()
	
	local bookFlowers = playerInventory:contains("HCBookflowerguide")
	local bookFungi = playerInventory:contains("HCBookfungiguide")
	local bookTree = playerInventory:contains("HCBooktreeguide")
	
	has3Books = (bookFlowers and bookFungi and bookTree)
	
	if (getGameTime():getMonth() + 1) > 10 or (getGameTime():getMonth() + 1) < 3 then 
		isWinter = true
	end
	
	minutes = 0
	count = 0
	
end

--Events.onEnableSearchMode.Add(onEnableSearchMode)

local function onDisableSearchMode(player, isSearchMode)
	searchEnabled = false
	thePlayer = nil
	playerInventory = nil
	lastX = 0
	lastY = 0
	has3Books = false
	isWinter = false
	minutes = 0
	count = 0
end

--Events.onDisableSearchMode.Add(onDisableSearchMode)

local function EveryOneMinute()

	minutes = minutes + 1

	if(not searchEnabled) then
		return
	end
	
	if(thePlayer == nil) then  --should never happen
		return
	end

	if(not has3Books) then
		return
	end

	--books:
	-- HCBookfungiguide, HCBookamphibianguide, HCBookreptileguide, HCBookmammalguide, HCBookflowerguide, HCBookfishguide
	-- HCBookbirdgude, HCBooktreeguide
	
	--thePlayer:Say("I'm searching")
	local sq = thePlayer:getCurrentSquare()  --getCurrentSquare
	if sq:getZ() > 0 then
		thePlayer:Say("There are no flora up here.")
		return;
	end

	local zoneType = sq:getZoneType()
	if(zoneType == nil) then
		zoneType = "????"
	end

	--Nature Abundance
	-- 1 = very poor
	-- 3 = default
	-- 5 = very abundant
	local rand = ZombRand(5) + 1 --rand will be 1-5
	if(rand > SandboxVars.NatureAbundance) then -- 80% return on very poor, 0% return on very abundant
		return
	end
	
	--60% should get here on normal abundance setting
	
	local x = thePlayer:getX()
	local y = thePlayer:getY()
	
	local xDistance = math.abs(x - lastX)
	local yDistance = math.abs(y - lastY)

	lastX = x
	lastY = y
	
	if(xDistance < 4 and yDistance < 4) then
		--print("Keep moving! - " .. xDistance .. " - " .. yDistance)
		--thePlayer:Say("Keep moving! - " .. xDistance .. " - " .. yDistance)
		return
	end

	
	--a = -a
	--a = math.abs(a)

	local chance = 100 + skillModifier -- > 100 if better, < 100 if worse
	if(isWinter) then
		chance = chance - 50
	end
	
	thePlayer:Say("Chance: " .. chance .. " in 200")
	
	if(chance < ZombRand(200)) then
		return;
	end

--local forestSpawnRate = 80
--local vegetationSpawnRate = 30
--local farmSpawnRate = 10
	
	local found = false
	
	chance = ZombRand(100)
	
	if (zoneType == "Forest") then
		if(chance < forestSpawnRate) then
			playerInventory:AddItem(forest_flora[(ZombRand(#forest_flora)+1)])
			count = count + 1
			found = true
		end
	elseif (zoneType == "DeepForest") then
		if(chance < forestSpawnRate) then
			playerInventory:AddItem(forest_flora[(ZombRand(#forest_flora)+1)])
			count = count + 1
			found = true
		end
	elseif (zoneType == "Vegitation") then --sic, TIS spelling
		if(chance < vegetationSpawnRate) then
			playerInventory:AddItem(vegetation_flora[(ZombRand(#vegetation_flora)+1)])
			count = count + 1
			found = true
		end		
	elseif (zoneType == "FarmLand") then
		if(chance < farmSpawnRate) then
			playerInventory:AddItem(farm_flora[(ZombRand(#farm_flora)+1)])
			count = count + 1
			found = true
		end	
	elseif (zoneType == "Farm") then
		if(chance < farmSpawnRate) then
			playerInventory:AddItem(farm_flora[(ZombRand(#farm_flora)+1)])
			count = count + 1
			found = true
		end	
	elseif (zoneType == "TrailerPark") then
		if(chance < townSpawnRate) then
			playerInventory:AddItem(town_flora[(ZombRand(#town_flora)+1)])
			count = count + 1
			found = true
		end	
	elseif (zoneType == "TownZone") then
		if(chance < townSpawnRate) then
			playerInventory:AddItem(town_flora[(ZombRand(#town_flora)+1)])
			count = count + 1
			found = true
		end	
	elseif (zoneType == "Nav") then
		--thePlayer:Say("Nav")
	end	
	
	if(found) then
		thePlayer:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		thePlayer:Say("+1")
	end
	
	--thePlayer:Say(minutes .. " / " .. count)

end

--Events.EveryOneMinute.Add(EveryOneMinute)