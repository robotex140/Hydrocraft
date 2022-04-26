HydroLongbow = HydroLongbow or {};

HydroLongbow.isAiming = false

function HydroLongbow.setLongbowSprite(player, item, spriteName)
    item:setWeaponSprite(spriteName)
    player:resetEquippedHandsModels()
end

function HydroLongbow.isHydroLongbow(name)
    return name == 'Hydrocraft.HCLongbow'
end

function HydroLongbow.setArrow(bow, show)
    if show then
        local arrow = InventoryItemFactory.CreateItem('Hydrocraft.HCArrowAttachment')
        bow:attachWeaponPart(arrow)
    else
        bow:detachWeaponPart(bow:getWeaponPart('Clip'))
    end
end

function HydroLongbow.setup(player, item)
    if item:getCurrentAmmoCount() > 0 then
        HydroLongbow.setArrow(item, true)
    else
        HydroLongbow.setArrow(item, false)
    end
end

function HydroLongbow.OnPlayerUpdate(player)
    local item = player:getPrimaryHandItem();
    if item and HydroLongbow.isHydroLongbow(item:getFullType()) then
        -- We save when the player was last aiming to this module's isAiming var.
        -- This way we only draw again once the player lets go of aim, then aims again
        local isAiming = player:IsAiming()
        local wasAiming = HydroLongbow.isAiming
        if isAiming and not wasAiming then
            HydroLongbow.isAiming = true
            HydroLongbow.setLongbowSprite(player, item, 'Hydrocraft.HCLongbowDrawn')
        elseif not isAiming and wasAiming then
            HydroLongbow.isAiming = false
            HydroLongbow.setLongbowSprite(player, item, 'Hydrocraft.HCLongbow')
        end
    end
end

function HydroLongbow.OnLoad()
    local player = getPlayer();
    local item = player:getPrimaryHandItem();
    if item ~= nil then  
		local itemFullType = item:getFullType();
		if HydroLongbow.isHydroLongbow(itemFullType) then
			HydroLongbow.setup(player,item);
		end
	end
end

function HydroLongbow.OnEquipPrimary(player, item)
    if item ~= nil then
        local itemFullType = item:getFullType();
        if HydroLongbow.isHydroLongbow(itemFullType) then
            HydroLongbow.setup(player, item)
        end
    end
end

function HydroLongbow.OnFire(player, weapon)
    if not HydroLongbow.isHydroLongbow(weapon:getFullType()) then return; end
    HydroLongbow.setLongbowSprite(player, weapon, 'Hydrocraft.HCLongbow')
    HydroLongbow.setArrow(weapon, false)
end

-- Override base ISReloadWeaponAction to set the sprite when reload finishes
local original_loadAmmo = ISReloadWeaponAction.loadAmmo
function ISReloadWeaponAction:loadAmmo()
    if self.gun and HydroLongbow.isHydroLongbow(self.gun:getFullType()) then
        if self.bullets and not self.bullets:isEmpty() then
            HydroLongbow.setArrow(self.gun, true)
            if self.character:IsAiming() then
                HydroLongbow.isAiming = true
                HydroLongbow.setLongbowSprite(self.character, self.gun, 'Hydrocraft.HCLongbowDrawn')
            end
        end
    end
    original_loadAmmo(self)
end

-- Override base ISUnloadBulletsFromFirearm action to set the sprite when unload finishes
local original_animEvent = ISUnloadBulletsFromFirearm.animEvent
function ISUnloadBulletsFromFirearm:animEvent(event, parameter)
    if HydroLongbow.isHydroLongbow(self.gun:getFullType()) then
        if event == 'playReloadSound' then
            HydroLongbow.setArrow(self.gun, false)
        end
    end
    original_animEvent(self, event, parameter)
end

Events.OnLoad.Add(HydroLongbow.OnLoad)
Events.OnEquipPrimary.Add(HydroLongbow.OnEquipPrimary)
Events.OnWeaponSwingHitPoint.Add(HydroLongbow.OnFire)
Events.OnPlayerUpdate.Add(HydroLongbow.OnPlayerUpdate)