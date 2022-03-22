
local ROLLS = { 1, 1, 2, 2, 2, 2, 2, 2, 3, 3 } --number of rolls will be picked from this list

--easy to turn off if so desired.
--Maybe we could add a settings menu at some point.
local SPAWN_MONEY = true 
local SPAWN_HC_GUNS = true

local LOOT = {}
-- Money --
	if(SPAWN_MONEY) then
		LOOT["Hydrocraft.HCPenny"] = 1
		LOOT["Hydrocraft.HCNickel"] = 1
		LOOT["Hydrocraft.HCDime"] = 1
		LOOT["Hydrocraft.HCQuarter"] = 1
		LOOT["Hydrocraft.HCHalfdollar"] = 1
		LOOT["Hydrocraft.HCDollar"] = 1
	end

-- Weapons/Tools --
	LOOT["Base.Lighter"] = 1
	LOOT["Base.Matches"] = 1
	LOOT["Hydrocraft.HCSurvivalaxe"] = 0.06
	LOOT["Base.Hammer"] = 0.3
	LOOT["Base.Saw"] = 0.3
	LOOT["Hydrocraft.HCPliers"] = 0.05
	LOOT["Base.TinOpener"] = 0.1
	LOOT["Hydrocraft.HCJackknife"] = 0.05
	LOOT["Hydrocraft.HCBinoculars"] = 0.05
	LOOT["Hydrocraft.HCMeasuringtape"] = 0.05
	LOOT["Hydrocraft.HCCompass"] = 0.1
	LOOT["Hydrocraft.HCCamera"] = 0.05
	LOOT["Base.Torch"] = 0.1
	LOOT["Hydrocraft.HCFlashlightoff"] = 0.5
	LOOT["Hydrocraft.HCManometer"] = 0.04
	LOOT["Hydrocraft.HCTrashsmall"] = 0.2
	LOOT["Hydrocraft.HCFile"] = 0.05
	LOOT["Hydrocraft.HCCalculator"] = 0.1

	if(SPAWN_HC_GUNS) then
		LOOT["Hydrocraft.HCMagAA12"] = 0.05
		LOOT["Hydrocraft.HCAA12"] = 0.06
		LOOT["Hydrocraft.HCUziSilencer"] = 0.05
		LOOT["Hydrocraft.HCUzi"] = 0.06
		LOOT["Hydrocraft.HCMagUZI"] = 0.05
		LOOT["Hydrocraft.HCShotgunSilencer"] = 0.05
	end

-- Clothes --
	LOOT["Hydrocraft.HCWorkgloves"] = 0.2
	LOOT["Hydrocraft.HCDentures"] = 0.2
	LOOT["Hydrocraft.HCEyepatch"] = 0.2
	LOOT["Hydrocraft.HCHearingaid"] = 0.2
	LOOT["Hydrocraft.HCGlasseye"] = 0.2
	LOOT["Hydrocraft.HCProstheticleg"] = 0.2

-- Food --
	LOOT["Hydrocraft.HCTrailmix"] = 0.1
	LOOT["Hydrocraft.HCEnergybar"] = 0.1
	LOOT["Hydrocraft.HCGum"] = 0.2
	LOOT["Hydrocraft.HCGum2"] = 0.2
	LOOT["Hydrocraft.HCGum3"] = 0.2
	LOOT["Hydrocraft.HCMysteryseedspacket"] = 0.1
	LOOT["Hydrocraft.HCMRE"] = 0.2

-- Other --
	LOOT["Hydrocraft.HCHousefly"] = 0.2
	LOOT["Hydrocraft.HCMaggot"] = 0.2
	LOOT["Base.Cockroach"] = 0.25
	LOOT["Base.Worm"] = 0.25
	LOOT["Base.Book"] = 0.2

	LOOT["Base.WaterBottleEmpty"] = 0.3
	LOOT["Base.BandageDirty"] = 0.2
	LOOT["Base.Headphones"] = 0.2


local function calculate() 
	
	local tmp = 0
	for k, v in pairs(LOOT) do
		tmp = tmp + LOOT[k]
	end
	return tmp
	
end

local TOTAL = calculate()

local function pickRandomItem()

	local r = ZombRandFloat(0.0, TOTAL)
	local tmp = 0
	for k, v in pairs(LOOT) do
		tmp = tmp + LOOT[k]
		if(r < tmp) then
			return InventoryItemFactory.CreateItem(k)
		end
	end	
	return nil
end

local function SpawnLootOnDeadZombie(zombie)
	
	local randomRolls = ROLLS[ZombRand(#(ROLLS)) + 1]
	
	for i=1, randomRolls, 1 do
		local item = pickRandomItem()
		if(item == nil) then
			print("Exception / Error - SpawnOnZeds.lua, pickRandomItem() returned nil")
		else
			zombie:getInventory():addItem(item)
		end
	end
	
end

Events.OnZombieDead.Add(SpawnLootOnDeadZombie)