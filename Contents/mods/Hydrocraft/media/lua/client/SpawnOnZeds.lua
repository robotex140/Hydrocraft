
--Each time a zed dies, a random number of items will be placed on the corpse
--the number of items will be picked at random from this list
local ROLLS = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 2 }--avg 1 item per zombie
local LOW_ROLLS = {0,0,0,0,0,1,1,1,1,1}
local VERY_LOW_ROLLS = {0,0,0,0,0,0,0,0,0,1}

local NOTHING = "$nothing$"
local TOTAL = 0
local LOOT = {}
LOOT[NOTHING] = 0

local function pickRandomItem()
	local r = ZombRandFloat(0.0, TOTAL)
	local tmp = 0
	for k, v in pairs(LOOT) do
		tmp = tmp + LOOT[k]
		if(r < tmp) then
			if(k == NOTHING) then
				return nil
			end
			return InventoryItemFactory.CreateItem(k)
		end
	end	
	return nil--should never happen, but if it does nothing bad happens.
end

local function SpawnLootOnDeadZombie(zombie)

	local badWeapons = false
	if SandboxVars.Hydrocraft.LowConditionWeaponsOnZombies ~= nil and SandboxVars.Hydrocraft.LowConditionWeaponsOnZombies == true then
		badWeapons = true
		local items = zombie:getInventory():getItems()
		for i=0, items:size()-1 do
			local item = items:get(i)
			if item:IsWeapon() then
				item:setCondition( 1 )
			end
		end
	end
	
	local rolls = ROLLS
	if(SandboxVars.Hydrocraft.ZombieLoot ~= nil) then
		if(SandboxVars.Hydrocraft.ZombieLoot == 1) then
			rolls = ROLLS
		elseif(SandboxVars.Hydrocraft.ZombieLoot == 2) then
			rolls = LOW_ROLLS
		elseif(SandboxVars.Hydrocraft.ZombieLoot == 3) then
			rolls = VERY_LOW_ROLLS
		else
			print("Error: Unknown ZombieLoot value, defaulting to normal.  Value: ", SandboxVars.Hydrocraft.ZombieLoot)
			rolls = ROLLS
		end
	end
	
	local randomRolls = rolls[ZombRand(#(rolls)) + 1]
	--print("randomRolls = ", randomRolls)
	
	for i=1, randomRolls, 1 do
		local item = pickRandomItem()--can be nil if dice roll is NOTHING
		if(item ~= nil) then
			if badWeapons and item:IsWeapon() then
				item:setCondition( 1 )
			end
			zombie:getInventory():addItem(item)
		end
	end
	
end
Events.OnZombieDead.Add(SpawnLootOnDeadZombie)

local function OnLoadSpawnOnZeds()

	local SPAWN_MONEY = true --no sandbox setting for money, yet.
	local SPAWN_HC_GUNS = true
	
	if(SandboxVars.Hydrocraft.SpawnHydrocraftGuns ~= nil) then
		SPAWN_HC_GUNS = SandboxVars.Hydrocraft.SpawnHydrocraftGuns
	end
	
	--print("SPAWN_HC_GUNS = ", SPAWN_HC_GUNS)
	
	-- Money --
	if(SPAWN_MONEY) then --if you edit these values, also edit the value in the else clause
		LOOT["Hydrocraft.HCPenny"] = 1
		LOOT["Hydrocraft.HCNickel"] = 1
		LOOT["Hydrocraft.HCDime"] = 1
		LOOT["Hydrocraft.HCQuarter"] = 1
		LOOT["Hydrocraft.HCHalfdollar"] = 1
		LOOT["Hydrocraft.HCDollar"] = 1
	else
		LOOT[NOTHING] = LOOT[NOTHING] + 6 --prevents disabling money from boosting spawn rates.
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
	--LOOT["Hydrocraft.HCCompass"] = 0.1
	LOOT["Hydrocraft.HCCamera"] = 0.05
	LOOT["Base.Torch"] = 0.1
	LOOT["Hydrocraft.HCFlashlightoff"] = 0.25
	LOOT["Hydrocraft.HCFlashlighton"] = 0.25
	LOOT["Hydrocraft.HCManometer"] = 0.04
	LOOT["Hydrocraft.HCTrashsmall"] = 0.2
	LOOT["Hydrocraft.HCFile"] = 0.05
	LOOT["Hydrocraft.HCCalculator"] = 0.1

	if(SPAWN_HC_GUNS) then --if you edit these values, also edit the value in the else clause
		LOOT["Hydrocraft.HCMagAA12"] = 0.05
		LOOT["Hydrocraft.HCAA12"] = 0.06
		LOOT["Hydrocraft.HCUziSilencer"] = 0.05
		LOOT["Hydrocraft.HCUzi"] = 0.06
		LOOT["Hydrocraft.HCMagUZI"] = 0.05
		LOOT["Hydrocraft.HCShotgunSilencer"] = 0.05
	else
		LOOT[NOTHING] = LOOT[NOTHING] + 0.32 --prevents disabling guns from boosting spawn rates.
	end

	-- Clothes --
	LOOT["Hydrocraft.HCWorkgloves"] = 0.2
	--LOOT["Hydrocraft.HCDentures"] = 0.2
	--LOOT["Hydrocraft.HCEyepatch"] = 0.2
	LOOT["Hydrocraft.HCBrokenHearingaid"] = 0.2
	--LOOT["Hydrocraft.HCGlasseye"] = 0.2
	--LOOT["Hydrocraft.HCProstheticleg"] = 0.2
	LOOT["Base.Belt2"] = 0.2

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

	local total = 0
	for k, v in pairs(LOOT) do
		total = total + LOOT[k]
	end
	
	TOTAL = total
	
end
Events.OnLoad.Add(OnLoadSpawnOnZeds)