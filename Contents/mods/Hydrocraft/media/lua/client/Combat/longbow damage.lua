

local HCLongbowOnEquipPrimary = function(player, item)

    if item == nil then return end

	local gunType = item:getType()
	--print ("Gun Type:" .. gunType)

	if(gunType == "HCLongbow" or gunType == "HCLongbowMag") then
	
		--print(" ********* Longbow equipped!")
	
		local scriptItem = item:getScriptItem()
		local maxDamage = scriptItem:getMaxDamage()
		
		--print("Script damage: " .. maxDamage)
		
		local strength = player:getPerkLevel(Perks.Strength)
		
		--print("Strength: " .. strength)

		maxDamage = maxDamage + (strength * 0.2) - 1
		
		item:setMaxDamage(maxDamage)
		
		--print("Item damage: " .. maxDamage)
		
	end
end

Events.OnEquipPrimary.Add(HCLongbowOnEquipPrimary)
Events.OnGameStart.Add(function()
	local player = getPlayer()
	HCLongbowOnEquipPrimary(player, player:getPrimaryHandItem())
end)

