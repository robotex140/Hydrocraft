
local NO_FOCUS = 0
local MUSHROOM_FOCUS = 1
local BERRY_FOCUS = 2
local BAIT_FOCUS = 3
local FIREWOOD_FOCUS = 4
local MEDICINE_FOCUS = 5
local GRASS_FOCUS = 6
local FLOWER_FOCUS = 7
local ROCK_FOCUS = 8
local DUNG_FOCUS = 9
local NUTS_FOCUS = 10

local focus = NO_FOCUS --set default focus

local searchEnabled = false
local thePlayer = nil

--labels, maybe add translations to these
local NONE = "None"
local MUSHROOM_LABEL = "Mushrooms"
local BERRY_LABEL = "Berries"
local BAIT_LABEL = "Bait"
local FIREWOOD_LABEL = "Firewood"
local MEDICINE_LABEL = "Medical Herbs"
local GRASS_LABEL = "Grass"
local FLOWERS_LABEL = "Flowers"
local ROCKS_LABEL = "Rocks"
local DUNG_LABEL = "Dung"
local NUTS_LABEL = "Nuts, Leaves & Bark"

local FOCUS_INDICATOR = " *" --appended to currently selected focus

local OAK_LOG_CHANCE = 100

local function SetFocus(f)
	focus = f
end

local function showHowInfo()
	luautils.okModal("This lets you fine-tune your foraging.\n1) Select your desired focus. \n2) Start vanilla foraging.\n3) Desired items will spawn in your inventory.\n(See tooltips for biome / skill requirements)\nThis feature is new, feedback welcome on the Discord", true)

	--local modal = ISModalDialog:new(0,0, 250, 150, "1) Select your desired focus.  2) Use vanilla foraging 3) Profit!", false);
	--modal:initialise()
	--modal:addToUIManager()
end

--local BIOMES = { "Forest", "DeepForest", "Vegitation", "FarmLand", "Farm", "TrailerPark", "TownZone", "Nav" }
-- 										    Vegitation is TIS spelling

local MUSHROOMS = {
	"Hydrocraft.HCBlewitshroom", "Hydrocraft.HCLobstershroom", "Hydrocraft.HCYellowmorelshroom", "Hydrocraft.HCWitchshatshroom", "Hydrocraft.HCShiitake", "Hydrocraft.HCPortobello", "Base.MushroomGeneric7", "Base.MushroomGeneric6", "Base.MushroomGeneric5", "Base.MushroomGeneric4", "Base.MushroomGeneric3", "Base.MushroomGeneric2", "Base.MushroomGeneric1", "Hydrocraft.HCChantrelle"
}

local BERRIES = {
	"Base.Strewberrie", "Base.BerryBlack", "Base.BerryBlue", "Base.BerryGeneric1", "Base.BerryGeneric2", "Base.BerryGeneric3", "Base.BerryGeneric4", "Base.BerryGeneric5","Hydrocraft.HCCandleberry", "Hydrocraft.HCHuckleberry", "Hydrocraft.HCCranberry", "Hydrocraft.HCSeaberry", "Hydrocraft.HCBlackcurrant", "Hydrocraft.HCRedcurrant", "Hydrocraft.HCArrowwoodberry", "Hydrocraft.HCRaspberry", "Hydrocraft.HCBlackthornberry", "Hydrocraft.HCCrampbarkberry", "Hydrocraft.HCCrowberry", "Hydrocraft.HCGooseberry", "Hydrocraft.HCHawthornfruit", "Hydrocraft.HCMulberry", "Base.Rosehips", "Hydrocraft.HCSumacberry"
}

local BAITS = {
	"Worm", "Worm", "Worm", "worm", "Worm", "Cockroach", "Cockroach", "Cricket", "Grasshopper"
}--"HCBeetle", "HCBeetlegrub", "HCMolecricket", "HCCicada" ?

local FIREWOOD = {
	"Hydrocraft.HCYewbough", "Hydrocraft.HCSprucebough", "Hydrocraft.HCElmbough", "Hydrocraft.HCAlderbough", "Hydrocraft.HCWillowbranch", "Base.TreeBranch", "Base.Twigs", "Hydrocraft.HCFirbough", "Hydrocraft.HCPinebough" 
}

local MEDICINE = {
	"Base.Plantain", "Base.Comfrey", "Base.WildGarlic", "Base.CommonMallow", "Base.LemonGrass", "Base.BlackSage", "Base.Ginseng"
}

local FLOWERS = {
	"Hydrocraft.HCBleedingheart", "Hydrocraft.HCTetterwort", "Hydrocraft.HCMazus", "Hydrocraft.HCCamellia", "Hydrocraft.HCMorningglory", "Hydrocraft.HCStrelitzia", "Hydrocraft.HCColumbine", "Hydrocraft.HCCinquefoils","Hydrocraft.HCChrysanthemum", "Hydrocraft.HCSunflower", "Hydrocraft.HCRhododendron", "Hydrocraft.HCCalily","Hydrocraft.HCMagnolia","Hydrocraft.HCCarnation", "Hydrocraft.HCBluedaisy", "Hydrocraft.HCAnemome", "Hydrocraft.HCDaffodil","Hydrocraft.HCTulip", "Hydrocraft.HCPansy", "Hydrocraft.HCDaisy", "Hydrocraft.HCIris", "Hydrocraft.HCWolfsbane","Hydrocraft.HCMandrake", "Hydrocraft.HCBelladonna", "Hydrocraft.HCValerian", "Hydrocraft.HCCamomile", "Hydrocraft.HCLavender","Hydrocraft.HCSpeedwell", "Hydrocraft.HCDogwood", "Hydrocraft.HCChicory", "Hydrocraft.HCKvann", "Hydrocraft.HCHolly","Hydrocraft.HCJutestems", "Hydrocraft.HCThistle", "Base.Violets", "Hydrocraft.HCRosebud", "Hydrocraft.HCFlaxflower", "Hydrocraft.HCFlax", "Hydrocraft.HCClover", "Hydrocraft.HCNettles"
}

local ROCKS = {
	"Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.Stone", "Base.SharpedStone", "Hydrocraft.HCRedclay", "Hydrocraft.HCGreyclay", "Hydrocraft.HCSandstone", "Hydrocraft.HCLimestone", "Hydrocraft.HCChalkrock", "Hydrocraft.HCCopperore", "Hydrocraft.HCTinore", "Hydrocraft.HCIronore", "Hydrocraft.HCLeadore"
}

local NUTS = {
	"Hydrocraft.HCBark", "Hydrocraft.HCBirchbark", "Hydrocraft.HCWillowbark", "Hydrocraft.HCAcorn", "Hydrocraft.HCBirchcatkin", "Hydrocraft.HCBeechnut", "Hydrocraft.HCFircone", "Hydrocraft.HCPinenuts", "Hydrocraft.HCChestnut", "Hydrocraft.HCHickorynuts", "Hydrocraft.HCHickoryleaves", "Hydrocraft.HCOakleaves", "Hydrocraft.HCMapleleaf", "Hydrocraft.HCFern", "Hydrocraft.HCFiddleheadfern", "Hydrocraft.HCBirdnesteggs", "Hydrocraft.HCMulberryleaf"
}

--"",".",",''

	--',,'Hydrocraft.HCStraw','Hydrocraft.HCGrass',''}
	--medium = {'','Hydrocraft.HCCrabapple','','','','','','''','','farming.Cabbage','farming.Potato','Base.Corn',}
	--good = {'Base.Lemon','Base.Apple','.','','.','.','.','.'}	


local function modifySkill(player)

	local job = player:getDescriptor():getProfession()
	local traits = player:getTraits()
	local skillModifier = 0
	
	if(job =="ParkRanger") then
		skillModifier = skillModifier + 5
	end
	
	if (traits:contains("Hiker")) then
		skillModifier = skillModifier + 3
	end		

	if (traits:contains("FormerScout")) then
		skillModifier = skillModifier + 3
	end

	if (traits:contains("Hunter")) then
		skillModifier = skillModifier + 3
	end
	
	if (traits:contains("EagleEyed")) then
		skillModifier = skillModifier + 2
	end

	if (traits:contains("Gardener")) then
		skillModifier = skillModifier + 2
	end

	if (traits:contains("Outdoorsman")) then
		skillModifier = skillModifier + 2
	end	

	if (traits:contains("Cook")) then
		skillModifier = skillModifier + 1
	end

	if (traits:contains("NightVision")) then
		skillModifier = skillModifier + 1
	end

	if (traits:contains("Nutritionist")) then
		skillModifier = skillModifier + 1
	end

	if (traits:contains("Herbalist")) then
		skillModifier = skillModifier + 1
	end

	--negative traits
	if (traits:contains("Agoraphobic")) then
		skillModifier = skillModifier - 3
	end

	if (traits:contains("ShortSighted")) then
		skillModifier = skillModifier - 2
	end
	
	return skillModifier  -- (range: -5 to +19)
	
end

local function GatherMushrooms(player, zoneType, forageSkill, isWinter)

	if(isWinter) then
		if(zombRand(2) == 0) then --50% reduction in winter
			return;
		end
	end

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest") then
		player:Say("There are no mushrooms around here.")
		return;		
	end

	if(ZombRand(10) ~= 0) then --10% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local shroom = MUSHROOMS[ZombRand(#(MUSHROOMS)) + 1]
		
		--print("shroom = " .. shroom)
		
		player:getInventory():AddItem(shroom)
		player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		player:Say("+1")	
	end
	
end

local function GatherBerries(player, zoneType, forageSkill, isWinter)

	if(isWinter) then
		player:Say("There is no berries at this time of year.")
		return;		
	end

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation" and zoneType ~= "TownZone") then
		player:Say("There are no berries around here.")
		return;	
	end	

	if(ZombRand(10) ~= 0) then --10% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local berry = BERRIES[ZombRand(#(BERRIES)) + 1]
		player:getInventory():AddItem(berry)
		player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		player:Say("+1")	
	end	

end

local function GatherBait(player, zoneType, forageSkill, isWinter)

	--no winter reduction

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation" and zoneType ~= "FarmLand" and zoneType ~= "Farm" and zoneType ~= "TrailerPark" and zoneType ~= "TownZone") then
		player:Say("There is no bait around here.")
		return;
	end

	if(ZombRand(6) ~= 0) then --17% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local bait = BAITS[ZombRand(#(BAITS)) + 1]
		player:getInventory():AddItem(bait)
		player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		player:Say("+1")	
	end	
end

local function GatherFirewood(player, zoneType, forageSkill, isWinter)

	--no winter reduction

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest") then
		player:Say("There is no firewood around here.")
		return;		
	end

	if(ZombRand(OAK_LOG_CHANCE) == 0) then
		player:getInventory():AddItem("Hydrocraft.HCOakLog")
		player:Say("+1 [Oak Log]")		
		return
	end
	
	if(ZombRand(10) == 0) then 		
		local wood = FIREWOOD[ZombRand(#(FIREWOOD)) + 1]
		player:getInventory():AddItem(wood)
		player:Say("+1")
		--no xp for a no skill task.
	end	
end

local function GatherMedical(player, zoneType, forageSkill, isWinter)

	if(isWinter) then
		player:Say("There is no herbs at this time of year.")
		return;		
	end

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation") then
		player:Say("There are no herbs around here.")
		return;		
	end

	if(ZombRand(10) ~= 0) then --10% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local meds = MEDICINE[ZombRand(#(MEDICINE)) + 1]
		player:getInventory():AddItem(meds)
		player:getXp():AddXP(Perks.PlantScavenging, 4); -- 1xp, with no buffs
		player:Say("+1")	
	end	
end

local function GatherGrass(player, zoneType, forageSkill, isWinter)

	if(isWinter) then
		player:Say("There is no long grass at this time of year.")
		return;		
	end

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation" and zoneType ~= "FarmLand" and zoneType ~= "Farm" and zoneType ~= "TrailerPark" and zoneType ~= "TownZone") then
		player:Say("There is no grass around here.")
		return;
	end

	if(ZombRand(10) == 0) then 		
		player:getInventory():AddItem("Hydrocraft.HCGrass")
		player:getXp():AddXP(Perks.PlantScavenging, 1); -- 0.25xp, with no buffs
		player:Say("+1")	
	end
	
end

local function GatherFlowers(player, zoneType, forageSkill, isWinter)

	if(isWinter) then
		player:Say("There are no flowers at this time of year.")
		return;		
	end
	
	if(zoneType ~= "Forest" and zoneType ~= "Vegitation") then
		player:Say("There are no flowers around here.")
		return;		
	end	

	if(ZombRand(10) ~= 0) then --10% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local flower = FLOWERS[ZombRand(#(FLOWERS)) + 1]
		player:getInventory():AddItem(flower)
		player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		player:Say("+1")	
	end	
end

local function GatherRocks(player, zoneType, forageSkill, isWinter)

	--no winter penalty
	
	if(zoneType ~= "Forest" and zoneType ~= "DeepForest" and zoneType ~= "Vegitation") then
		player:Say("There are no rocks around here.")
		return;		
	end	
	
	if(ZombRand(10) ~= 0) then --10% chance
		return
	end
	
	local rand = ZombRand(40)
	
	if(rand < forageSkill) then
		local rock = ROCKS[ZombRand(#(ROCKS)) + 1]
		player:getInventory():AddItem(rock)
		player:getXp():AddXP(Perks.PlantScavenging, 1); -- 0.25xp, with no buffs
		player:Say("+1")	
	end	
	
	--
end

local function GatherDung(player, zoneType, forageSkill, isWinter)
	if(isWinter) then
		player:Say("There is no dung around at this time of year.")
		return;		
	end

	if(ZombRand(20) ~= 0) then --5% chance
		return
	end

	local dunglist = nil

	--no dog poop, get a dog and feed it for that.
	--"Forest", "DeepForest", "Vegitation", "FarmLand", "Farm", "TrailerPark", "TownZone", "Nav"
	if(zoneType == "Forest" or zoneType == "DeepForest") then
		dunglist = {"Hydrocraft.HCBearpoop", "Hydrocraft.HCCougarpoop", "Hydrocraft.HCBoarpoop", "Hydrocraft.HCDeerpoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop", "Hydrocraft.HCSmallgamepoop"}
		--bear, deer, cougar, boar
	elseif(zoneType == "FarmLand" or zoneType == "Farm") then
		dunglist = {"Hydrocraft.HCHorsepoopferal", "Hydrocraft.HCDonkeypoopferal", "Hydrocraft.HCPigpoopferal", "Hydrocraft.HCGoatpoopferal", "Hydrocraft.HCSheeppoopferal", "Hydrocraft.HCCowpoopferal" }
	end

	if(dunglist ~= nil) then
		local d = dunglist[ZombRand(#(dunglist)) + 1]
		player:getInventory():AddItem(d)
		player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
		player:Say("+1")		
	end
	
end

local function GatherNuts(player, zoneType, forageSkill, isWinter)
	if(isWinter) then
		player:Say("There are no nuts around at this time of year.")
		return;		
	end

	if(zoneType ~= "Forest" and zoneType ~= "DeepForest") then
		player:Say("There are no nuts around here.")
		return
	end
	
	if(ZombRand(4) ~= 0) then --25% chance
		return
	end

	local nut = NUTS[ZombRand(#(NUTS)) + 1]
	player:getInventory():AddItem(nut)
	player:getXp():AddXP(Perks.PlantScavenging, 2); -- 0.5xp, with no buffs
	player:Say("+1")		

end

local function makeMushroomToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(MUSHROOM_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Fungi Fieldguide <LINE>Biome: Forest, Deep Forest"
	--t:setTexture("media/textures/Item_HCWitchshatmushroom.png")
	return t
end

local function makeBerryToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(BERRY_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Foraging: 1 <LINE>Biome: Forest, Deep Forest, Vegetation, Urban Area"
	--t:setTexture("media/textures/Item_HCCandleberry.png")
	return t
end

--Fisherman, Angler, Fishing: 1
local function makeBaitToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(BAIT_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Fish Fieldguide <LINE>Biome: Anywhere, except roads"
	--t:setTexture("media/textures/WorldItems/Worm.png") --vanilla image, can't find S-shaped worm icon.
	return t
end

local function makeFirewoodToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(FIREWOOD_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>No skills required <LINE>Biome: Forest, Deep Forest"
	--t:setTexture("media/textures/Item_HCAlderbough.png")
	return t
end

local function makeMedicalToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(MEDICINE_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Herbalist trait <LINE>Biome: Forest, Deep Forest, Vegetation"
	--t:setTexture("????") --which texture?
	return t
end

local function makeGrassToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(GRASS_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>No skills required <LINE>Biome: Anywhere, except roads"
	--t:setTexture("media/textures/Item_HCGrass.png")
	return t
end

local function makeFlowerToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(FLOWERS_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Flower Fieldguide <LINE>Biome:Forest, Vegetation"
	--t:setTexture("media/textures/Item_HCSunflower.png")
	return t
end

local function makeRockToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(ROCKS_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Geology Textbook <LINE>Biome: Forest, Deep Forest, Vegetation"
	--t:setTexture("media/textures/Item_HCStonepilebox.png")
	return t
end


--
local function makeDungToolTip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(DUNG_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Mammal Fieldguide <LINE>Biome: Forest, Deep Forest, Farm land, Farm"
	--t:setTexture("media/textures/Item_HCCowpoop.png")
	return t
end

local function makeNutsTooltip()
	local t = ISToolTip:new()
	t:initialise()
	t:setName(NUTS_LABEL)
	t:setVisible(false)
	t.description = "<RGB:1,1,1>Tree Fieldguide <LINE>Biome: Forest, Deep Forest"
	--t:setTexture("????")
	return t
end

local function CreateGatherMenu(_player, _context, _worldObjects)

	-- _player is player id, 0 for single player

	--print("CreateGatherMenu")

	local context = _context;
	local worldobjects = _worldObjects;
	local gatherMenu = context:addOption("Foraging Focus", worldobjects);
	
	local gatherSubMenu = ISContextMenu:getNew(context);
	context:addSubMenu(gatherMenu, gatherSubMenu);
	
	local noFocusLabel = NONE
	local mushroomLabel = MUSHROOM_LABEL
	local berryLabel = BERRY_LABEL
	local baitLabel = BAIT_LABEL
	local firewoodLabel = FIREWOOD_LABEL
	local medicineLabel = MEDICINE_LABEL
	local grassLabel = GRASS_LABEL
	local flowerLabel = FLOWERS_LABEL
	local rockLabel = ROCKS_LABEL
	local dungLabel = DUNG_LABEL
	local nutsLabel = NUTS_LABEL
	
	if(focus == NO_FOCUS) then
		noFocusLabel = NONE .. FOCUS_INDICATOR
	elseif(focus == MUSHROOM_FOCUS) then
		mushroomLabel = MUSHROOM_LABEL .. FOCUS_INDICATOR
	elseif(focus == BERRY_FOCUS) then
		berryLabel = BERRY_LABEL .. FOCUS_INDICATOR
	elseif(focus == BAIT_FOCUS) then
		baitLabel = BAIT_LABEL .. FOCUS_INDICATOR
	elseif(focus == FIREWOOD_FOCUS) then
		firewoodLabel = FIREWOOD_LABEL .. FOCUS_INDICATOR
	elseif(focus == MEDICINE_FOCUS) then
		medicineLabel = MEDICINE_LABEL .. FOCUS_INDICATOR
	elseif(focus == GRASS_FOCUS) then
		grassLabel = GRASS_LABEL .. FOCUS_INDICATOR
	elseif(focus == FLOWER_FOCUS) then
		flowerLabel = FLOWERS_LABEL .. FOCUS_INDICATOR
	elseif(focus == ROCK_FOCUS) then
		rockLabel = ROCKS_LABEL .. FOCUS_INDICATOR
	elseif(focus == DUNG_FOCUS) then
		dungLabel = DUNG_LABEL .. FOCUS_INDICATOR
	elseif(focus == NUTS_FOCUS) then
		nutsLabel = NUTS_LABEL .. FOCUS_INDICATOR
	end

	local showInfooption = gatherSubMenu:addOption("What does this do?", nil, function() showHowInfo() end)
	
	local noFocusOption = gatherSubMenu:addOption(noFocusLabel, nil, function() SetFocus(NO_FOCUS) end)
	local mushroomOption = gatherSubMenu:addOption(mushroomLabel, nil, function() SetFocus(MUSHROOM_FOCUS) end)
	local berryOption = gatherSubMenu:addOption(berryLabel, nil, function() SetFocus(BERRY_FOCUS) end)
	local baitOption = gatherSubMenu:addOption(baitLabel, nil, function() SetFocus(BAIT_FOCUS) end)
	local firewoodOption = gatherSubMenu:addOption(firewoodLabel, nil, function() SetFocus(FIREWOOD_FOCUS) end)
	local medicalOption = gatherSubMenu:addOption(medicineLabel, nil, function() SetFocus(MEDICINE_FOCUS) end)
	local grassOption = gatherSubMenu:addOption(grassLabel, nil, function() SetFocus(GRASS_FOCUS) end)
	local flowerOption = gatherSubMenu:addOption(flowerLabel, nil, function() SetFocus(FLOWER_FOCUS) end)
	local rockOption = gatherSubMenu:addOption(rockLabel, nil, function() SetFocus(ROCK_FOCUS) end)
	local dungOption = gatherSubMenu:addOption(dungLabel, nil, function() SetFocus(DUNG_FOCUS) end)
	local nutsOption = gatherSubMenu:addOption(nutsLabel, nil, function() SetFocus(NUTS_FOCUS) end)
	
	thePlayer = getSpecificPlayer(_player)
	local books = thePlayer:getAlreadyReadBook()
	local traits = thePlayer:getTraits()
	local job = thePlayer:getDescriptor():getProfession()

	local fishingPerk = thePlayer:getPerkInfo(Perks.Fishing) --can be nil, when new character
	local fishingLevel = 0
	if(fishingPerk ~= nil) then
		fishingLevel = fishingPerk:getLevel()
	end
	
	local foragingPerk = thePlayer:getPerkInfo(Perks.PlantScavenging) --can be nil, when new character
	local foragingLevel = 0
	if(foragingPerk ~= nil) then
		foragingLevel = foragingPerk:getLevel()
	end
	
	local readFishGuide = books:contains("Hydrocraft.HCBookfishguide")
	local readFungiGuide = books:contains("Hydrocraft.HCBookfungiguide")
	local readFlowerGuide = books:contains("Hydrocraft.HCBookflowerguide")
	local readGeologyBook = books:contains("Hydrocraft.HCBookgeology")
	local readMammalGuide = books:contains("Hydrocraft.HCBookmammalguide")
	local readTreeGuide = books:contains("Hydrocraft.HCBooktreeguide")
	
	local fisherman = (job == "Fisherman")
	local parkranger = (job == "parkranger")
	
	local herbalist = traits:contains("Herbalist")
	local formerScout = traits:contains("Formerscout")
	local angler = traits:contains("Fishing")

	--print("****all books = " .. books:size()) -- doesn't include skill books! WTF?
	--THIS DOES NOT WORK!!!
	--local pages = thePlayer:getAlreadyReadPages​("Base.BookForaging1")
	
	mushroomOption.notAvailable = ((not parkranger) and (not readFungiGuide))
	
	berryOption.notAvailable = ((not formerScout) and (not herbalist) and (foragingLevel < 1))
	
	baitOption.notAvailable = ((not fisherman) and (not angler) and (fishingLevel < 1) and (not readFishGuide))
	
	firewoodOption.notAvailable = false --no skills required.
	
	medicalOption.notAvailable = (not herbalist) --locked behind Herbalist trait
	
	grassOption.notAvailable = false --no skills required.
	
	flowerOption.notAvailable = (not readFlowerGuide)

	rockOption.notAvailable = (not readGeologyBook)
	
	dungOption.notAvailable = (not readMammalGuide)
	
	nutsOption.notAvailable = (not readTreeGuide)
	
	mushroomOption.toolTip = makeMushroomToolTip()
	berryOption.toolTip = makeBerryToolTip()
	baitOption.toolTip = makeBaitToolTip()
	firewoodOption.toolTip = makeFirewoodToolTip()
	medicalOption.toolTip = makeMedicalToolTip()
	grassOption.toolTip = makeGrassToolTip()
	flowerOption.toolTip = makeFlowerToolTip()
	rockOption.toolTip = makeRockToolTip()
	dungOption.toolTip = makeDungToolTip()
	nutsOption.toolTip = makeNutsTooltip()
	
end

local function func_Init()
	Events.OnFillWorldObjectContextMenu.Add(CreateGatherMenu)
end
Events.OnGameStart.Add(func_Init)

local function StartForaging(player, isSearchMode)
	searchEnabled = true
end
Events.onEnableSearchMode.Add(StartForaging)

local function StopForaging(player, isSearchMode)
	searchEnabled = false
end
Events.onDisableSearchMode.Add(StopForaging)

--do every 2 minutes instead?
local function EveryOneMinute()
	if(not searchEnabled) then
		return
	end
	
	if(focus == NO_FOCUS) then
		return
	end
	
	if(thePlayer == nil) then --should never happen
		return
	end

	if(ZombRand(5) + 1 > SandboxVars.NatureAbundance) then 
		return-- 80% return on very poor, 0% return on very abundant
	end
	
	local sq = thePlayer:getCurrentSquare()
	if(sq:getZ() > 0) then
		thePlayer:Say("I won't find anything up here!")
	end

	if(not thePlayer:isOutside()) then
		thePlayer:Say("I need to do this outside!")
	end

	local zoneType = sq:getZoneType()	
	if(zoneType == nil) then
		print("** nil zone")
		return
	end
	
	local forageSkill = 10;
	local foraging = thePlayer:getPerkInfo(Perks.PlantScavenging);
	if(foraging ~= nil) then
		forageSkill = forageSkill + foraging:getLevel()
	end
	forageSkill = forageSkill + modifySkill(thePlayer)
	
	local month = getGameTime():getMonth() + 1 --change to 1 to 12
	local isWinter = (month <= 2 or month == 12)

	if(focus == MUSHROOM_FOCUS) then
		GatherMushrooms(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == BERRY_FOCUS) then
		GatherBerries(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == BAIT_FOCUS) then
		GatherBait(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == FIREWOOD_FOCUS) then
		GatherFirewood(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == MEDICINE_FOCUS) then
		GatherMedical(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == GRASS_FOCUS) then
		GatherGrass(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == FLOWER_FOCUS) then
		GatherFlowers(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == ROCK_FOCUS) then
		GatherRocks(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == DUNG_FOCUS) then
		GatherDung(thePlayer, zoneType, forageSkill, isWinter)
	elseif(focus == NUTS_FOCUS) then
		GatherNuts(thePlayer, zoneType, forageSkill, isWinter)
	end
	
end

Events.EveryOneMinute.Add(EveryOneMinute)

--[[
--Vanilla search categories, but I can't find a way to hook into that system.
IGUI_SearchMode_Categories_Materials = "Materials",
    IGUI_SearchMode_Categories_Medicinal = "Plantes medicinals",
    **IGUI_SearchMode_Categories_Animals = "Animals",
    IGUI_SearchMode_Categories_Food = "Menjar",
    IGUI_SearchMode_Categories_Other = "Altres",

	--SearchMode Exact Category Names
	**IGUI_SearchMode_Categories_Firewood = "Llenya",
	**IGUI_SearchMode_Categories_Stones = "Pedres",
	**IGUI_SearchMode_Categories_Berries = "Baies",
	**IGUI_SearchMode_Categories_Mushrooms = "Bolets",
	**IGUI_SearchMode_Categories_Insects = "Insectes",
	**IGUI_SearchMode_Categories_Trash = "Fem",
	**IGUI_SearchMode_Categories_Fruits = "Fruites",
	**IGUI_SearchMode_Categories_Vegetables = "Vegetals",
	**IGUI_SearchMode_Categories_Crops = "Collites",
	IGUI_SearchMode_Categories_Junk = "Runa",
	IGUI_SearchMode_Categories_JunkWeapons = "Armes",
	IGUI_SearchMode_Categories_Ammunition = "Munició",
	IGUI_SearchMode_Categories_JunkFood = "Menjar de pot",
	IGUI_SearchMode_Categories_Clothing = "Roba",
	IGUI_SearchMode_Categories_Medical = "Coses mèdiques",
    **IGUI_SearchMode_Categories_MedicinalPlants = "Plantes medicinals",
    **IGUI_SearchMode_Categories_WildPlants = "Plantes bordes",

]]--