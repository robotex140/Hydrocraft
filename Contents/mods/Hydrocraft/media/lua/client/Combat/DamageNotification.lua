
local function OnWeaponHitCharacter(player, target, handWeapon, damage)	
	player:setHaloNote(string.format("%.1f", damage))
end

local function OnLoad()
	if(SandboxVars.Hydrocraft.ShowDamage ~= nil and SandboxVars.Hydrocraft.ShowDamage == true) then
		Events.OnWeaponHitCharacter.Add(OnWeaponHitCharacter)
	end
end

Events.OnLoad.Add(OnLoad)