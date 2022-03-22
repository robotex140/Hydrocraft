local MOD_ID = "HydroCombat";


local function HydroCombatOnHitZombie(zombie,player,bodyType,weapon)
	local weaponName = ""
	if(weapon ~= nil) then
		weaponName = weapon:getType()
	else
		weaponName = "This should never happen, but if it does weaponName still needs some text in it" -- :D
	end

	local getArrowBack = (ZombRand(5) > 1) --60% chance of getting the arrow back
	if(not getArrowBack) then
		return
	end
	
	if(weaponName == "HCLongbow" or weaponName == "HCLongbowMag") then
		zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCArrow"))
	elseif(weaponName == "HCCrossbow") then
		zombie:addItemToSpawnAtDeath(InventoryItemFactory.CreateItem("Hydrocraft.HCXbowbolt"))
	end
end


Events.OnHitZombie.Add(HydroCombatOnHitZombie);
