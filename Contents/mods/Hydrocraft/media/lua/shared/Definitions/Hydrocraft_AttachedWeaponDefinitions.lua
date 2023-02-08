
--Add Hydrocraft weapons to vanilla 'impaled' weapons system.
--Adds to an existing location, so HC weapons will spawn in place of vanilla weapons - should keep the drop rates balanced.

--Check the AttachedWeaponDefinitions table exists, just in case.
if AttachedWeaponDefinitions == nil then
	return
end

--Note: vanilla location 'meatCleaverBack' is actually used for Machete & Hand Axe and *not* Meat Cleaver
if AttachedWeaponDefinitions.meatCleaverBack and AttachedWeaponDefinitions.meatCleaverBack.weapons then
	table.insert(AttachedWeaponDefinitions.meatCleaverBack.weapons, "Hydrocraft.HCSurvivalaxe")
end

local bad_knife_locations = {}
if AttachedWeaponDefinitions.knifeBack then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knifeBack) end
if AttachedWeaponDefinitions.knifeLeftLeg then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knifeLeftLeg) end
if AttachedWeaponDefinitions.knifeRightLeg then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knifeRightLeg) end
if AttachedWeaponDefinitions.knifeShoulder then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knifeShoulder) end
if AttachedWeaponDefinitions.knifeStomach then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knifeStomach) end
if AttachedWeaponDefinitions.knivesBelt then table.insert(bad_knife_locations, AttachedWeaponDefinitions.knivesBelt) end --Bandit zombies

for _,v in pairs(bad_knife_locations) do
	if v["weapons"] then
		table.insert(v["weapons"], "Hydrocraft.HCJackknife")
		table.insert(v["weapons"], "Hydrocraft.HCPumpkinknife")
		table.insert(v["weapons"], "Hydrocraft.HCSteakknife")
		
		--add more here if desired
	end
end

local good_knife_locations = {}
if AttachedWeaponDefinitions.huntingKnifeBack then table.insert(good_knife_locations, AttachedWeaponDefinitions.huntingKnifeBack) end
if AttachedWeaponDefinitions.huntingKnifeLeftLeg then table.insert(good_knife_locations, AttachedWeaponDefinitions.huntingKnifeLeftLeg) end
if AttachedWeaponDefinitions.huntingKnifeRightLeg then table.insert(good_knife_locations, AttachedWeaponDefinitions.huntingKnifeRightLeg) end
if AttachedWeaponDefinitions.huntingKnifeShoulder then table.insert(good_knife_locations, AttachedWeaponDefinitions.huntingKnifeShoulder) end
if AttachedWeaponDefinitions.huntingKnifeStomach then table.insert(good_knife_locations, AttachedWeaponDefinitions.huntingKnifeStomach) end
if AttachedWeaponDefinitions.knivesBelt then table.insert(good_knife_locations, AttachedWeaponDefinitions.knivesBelt) end --Bandit zombies

for _,v in pairs(good_knife_locations) do
	if v["weapons"] then
		table.insert(v["weapons"], "Hydrocraft.HCCombatknife")
		
		--add more here if desired
	end
end


--Test code, use this to check a weapon is spawning in.  Change the location as required.

--	AttachedWeaponDefinitions.huntingKnifeBack.daySurvived = 0 --make them spawn on day 1
--	AttachedWeaponDefinitions.huntingKnifeBack.chance = 1000 --high chance, so they almost always get picked
--	AttachedWeaponDefinitions.chanceOfAttachedWeapon = 100 --every zombie has an impaled weapon, so you don't need to go looking
