HydroCrossbow = HydroCrossbow or {};

function HydroCrossbow.setCrossbowSprite(player, item, spriteName)
    item:setWeaponSprite(spriteName)
    player:resetEquippedHandsModels()
end

function HydroCrossbow.isHydroCrossbow(name)
    return name == 'Hydrocraft.HCCrossbow'
end

function HydroCrossbow.setup(player, item)
    if item:getCurrentAmmoCount() > 0 then
        HydroCrossbow.setCrossbowSprite(player, item, 'Hydrocraft.HCCrossbow')
    else
        HydroCrossbow.setCrossbowSprite(player, item, 'Hydrocraft.HCCrossbowEmpty')
    end
end

function HydroCrossbow.OnLoad()
    local player = getPlayer();
    local item = player:getPrimaryHandItem();
    if item ~= nil then  
		local itemFullType = item:getFullType();
		if HydroCrossbow.isHydroCrossbow(itemFullType) then
			HydroCrossbow.setup(player,item);
		end
	end
end

function HydroCrossbow.OnEquipPrimary(player, item)
    if item ~= nil then
        local itemFullType = item:getFullType();
        if HydroCrossbow.isHydroCrossbow(itemFullType) then
            HydroCrossbow.setup(player, item)
        end
    end
end

function HydroCrossbow.OnFire(player, weapon)
    if not HydroCrossbow.isHydroCrossbow(weapon:getFullType()) then return; end
    HydroCrossbow.setCrossbowSprite(player, weapon, 'Hydrocraft.HCCrossbowEmpty')
end

-- Override base ISReloadWeaponAction to set the sprite when reload finishes
local original_loadAmmo = ISReloadWeaponAction.loadAmmo
function ISReloadWeaponAction:loadAmmo()
    if self.gun and HydroCrossbow.isHydroCrossbow(self.gun:getFullType()) then
        if self.bullets and not self.bullets:isEmpty() then
            HydroCrossbow.setCrossbowSprite(self.character, self.gun, 'Hydrocraft.HCCrossbow')
        end
    end
    original_loadAmmo(self)
end

-- Override base ISUnloadBulletsFromFirearm action to set the sprite when unload finishes
local original_animEvent = ISUnloadBulletsFromFirearm.animEvent
function ISUnloadBulletsFromFirearm:animEvent(event, parameter)
    if HydroCrossbow.isHydroCrossbow(self.gun:getFullType()) then
        if event == 'playReloadSound' then
            HydroCrossbow.setCrossbowSprite(self.character, self.gun, 'Hydrocraft.HCCrossbowEmpty')
        end
    end
    original_animEvent(self, event, parameter)
end

Events.OnLoad.Add(HydroCrossbow.OnLoad)
Events.OnEquipPrimary.Add(HydroCrossbow.OnEquipPrimary)
Events.OnWeaponSwingHitPoint.Add(HydroCrossbow.OnFire)
