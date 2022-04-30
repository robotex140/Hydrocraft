HydroLongbow = HydroLongbow or {};

HydroLongbow.isAiming = false

function HydroLongbow.setReloadSpeed(character)
    local baseReloadSpeed = 1;
    baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.07);
	baseReloadSpeed = baseReloadSpeed - (character:getMoodles():getMoodleLevel(MoodleType.Panic) * 0.05);

    -- bonus for quiver
    local quiver = character:getWornItem('Back')
    if quiver and quiver:getClothingItemName() == 'HCQuiver' then
        baseReloadSpeed = baseReloadSpeed * 1.5;
    end
    -- vehicles driver take bit longer to reload their weapon
	if character:getVehicle() and character:getVehicle():getDriver() == character then
		baseReloadSpeed = baseReloadSpeed * 0.8;
	end
    character:setVariable("ReloadSpeed", baseReloadSpeed * GameTime.getAnimSpeedFix());
end

function HydroLongbow.setLongbowSprite(player, item, spriteName)
    item:setWeaponSprite(spriteName)
    player:resetEquippedHandsModels()
end

function HydroLongbow.isHydroLongbow(name)
    return name == 'Hydrocraft.HCLongbow'
end

function HydroLongbow.isHydroLongbowMag(name)
    return name == 'Hydrocraft.HCLongbowMag'
end

-- Show/hide arrow on regular bow
function HydroLongbow.setArrow(bow, show)
    if show then
        local arrow = InventoryItemFactory.CreateItem('Hydrocraft.HCArrowAttachment')
        bow:attachWeaponPart(arrow)
    else
        bow:detachWeaponPart(bow:getWeaponPart('Clip'))
    end
end

-- Show/hide mag on bow w/ detachable mag
function HydroLongbow.setMag(bow, show)
    if show then
        local mag = InventoryItemFactory.CreateItem('Hydrocraft.HCMagLongbow')
        bow:attachWeaponPart(mag)
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
    if not item or not HydroLongbow.isHydroLongbow(item:getFullType()) then return; end
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

-- Override base ISRackFirearm action to set the sprite when rack finishes
local original_removeBullet = ISRackFirearm.removeBullet
function ISRackFirearm:removeBullet()
    if HydroLongbow.isHydroLongbow(self.gun:getFullType()) then
        HydroLongbow.setArrow(self.gun, false)
    end
    original_removeBullet(self)
end

-- Override setReloadSpeed to give a bonus for wearing a quiver
local original_setReloadSpeed = ISReloadWeaponAction.setReloadSpeed
function ISReloadWeaponAction.setReloadSpeed(character, rack)
    local item = character:getPrimaryHandItem()
    if not item or not HydroLongbow.isHydroLongbow(item:getFullType()) then
        return original_setReloadSpeed(character, rack)
    end
    HydroLongbow.setReloadSpeed(character)
end

local original_loadAmmo = ISInsertMagazine.loadAmmo
function ISInsertMagazine:loadAmmo()
    original_loadAmmo(self)
    if HydroLongbow.isHydroLongbowMag(self.gun:getFullType()) then
        HydroLongbow.setMag(self.gun, true)
    end
end

local original_unloadAmmo = ISEjectMagazine.unloadAmmo
function ISEjectMagazine:unloadAmmo()
    original_unloadAmmo(self)
    if HydroLongbow.isHydroLongbowMag(self.gun:getFullType()) then
        HydroLongbow.setMag(self.gun, false)
    end
end

-- Override AttackHook to get rid of the muzzle flash
local original_attackHook = ISReloadWeaponAction.attackHook
Hook.Attack.Remove(ISReloadWeaponAction.attackHook)
ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
    local type = weapon:getFullType()
    if not HydroLongbow.isHydroLongbow(type) and not HydroLongbow.isHydroLongbowMag(type) then return original_attackHook(character, chargeDelta, weapon); end
    ISTimedActionQueue.clear(character)
	if character:isAttackStarted() then return; end
	if instanceof(character, "IsoPlayer") and not character:isAuthorizeMeleeAction() then
		return;
	end
	if weapon:isRanged() and not character:isDoShove() then
		if ISReloadWeaponAction.canShoot(weapon) then
			character:playSound(weapon:getSwingSound());
			local radius = weapon:getSoundRadius();
			if isClient() then -- limit sound radius in MP
				radius = radius / 2.2;
			end
			character:addWorldSoundUnlessInvisible(radius, weapon:getSoundVolume(), false);
			character:DoAttack(0);
		else
			character:DoAttack(0);
			character:setRangedWeaponEmpty(true);
		end
	else
		ISTimedActionQueue.clear(character)
		if(chargeDelta == nil) then
			character:DoAttack(0);
		else
			character:DoAttack(chargeDelta);
		end
	end
end

Events.OnLoad.Add(HydroLongbow.OnLoad)
Events.OnEquipPrimary.Add(HydroLongbow.OnEquipPrimary)
Events.OnWeaponSwingHitPoint.Add(HydroLongbow.OnFire)
Events.OnPlayerUpdate.Add(HydroLongbow.OnPlayerUpdate)
Hook.Attack.Add(ISReloadWeaponAction.attackHook)
