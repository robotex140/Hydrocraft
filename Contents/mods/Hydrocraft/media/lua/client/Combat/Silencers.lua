HCUziSilencer = {}
HCShotgunSilencer = {}

if(ItemValueTable == nil) then ItemValueTable = {}; end
ItemValueTable["Hydrocraft.HCUziSilencer"] = 6.00;
ItemValueTable["Hydrocraft.HCShotgunSilencer"] = 6.00;

-- HC silencer handling
local HCSilencersOnEquipPrimary = function(player, item)

    if item == nil then return end

	local gunType = item:getType()
	--print ("Gun Type:" .. gunType)
	
	--check if the gun allows a silencer to be attached
	if(gunType == "Pistol" or gunType == "Pistol2" or gunType == "Pistol3" or gunType == "Revolver" or gunType == "Revolver_Short" or gunType == "Revolver_Long" or gunType == "HCUzi" or gunType == "Shotgun" or gunType == "HCAA12") then
		local scriptItem = item:getScriptItem()
		local soundVolume = scriptItem:getSoundVolume()
		local soundRadius = scriptItem:getSoundRadius()
		local swingSound = scriptItem:getSwingSound()
		
		--Does the gun have an attachment?
		if(item:getCanon() ~= nil) then
			local canonType = item:getCanon():getType()
			
			--print ("attachment: " .. canonType)
			
			--Is the attachment a silencer?
			if (canonType == "HCUziSilencer") then
				soundVolume = soundVolume * (0.10)
				soundRadius = soundRadius * (0.10)
				swingSound = "HCsilentPistolShot"
			elseif (canonType == "HCShotgunSilencer") then 
				soundVolume = soundVolume * (0.10)
				soundRadius = soundRadius * (0.10)
				swingSound = "HCshotgunSilenced"
			end
		end

		--Set gun sounds to either silenced, or default.  Gun could previously have had a silencer, so resetting to default is required.
		item:setSoundVolume(soundVolume)
		item:setSoundRadius(soundRadius)
		item:setSwingSound(swingSound)	
		
		--print ("Volume: " .. soundVolume .. " Radius:" .. soundRadius .. " Sound: " .. swingSound)
		
	end
end

Events.OnEquipPrimary.Add(HCSilencersOnEquipPrimary)
Events.OnGameStart.Add(function()
	local player = getPlayer()
	HCSilencersOnEquipPrimary(player, player:getPrimaryHandItem())
end)

