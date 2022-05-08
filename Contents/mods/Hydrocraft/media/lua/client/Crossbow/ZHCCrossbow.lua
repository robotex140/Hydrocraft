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

-- Override base ISRackFirearm action to set the sprite when rack finishes
local original_removeBullet = ISRackFirearm.removeBullet
function ISRackFirearm:removeBullet()
    if HydroCrossbow.isHydroCrossbow(self.gun:getFullType()) then
        HydroCrossbow.setCrossbowSprite(self.character, self.gun, 'Hydrocraft.HCCrossbowEmpty')
    end
    original_removeBullet(self)
end

-- Override AttackHook to get rid of the muzzle flash
local original_attackHook = ISReloadWeaponAction.attackHook
Hook.Attack.Remove(ISReloadWeaponAction.attackHook)
ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
    local type = weapon:getFullType()
    if not HydroCrossbow.isHydroCrossbow(type) then return original_attackHook(character, chargeDelta, weapon); end
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

Events.OnLoad.Add(HydroCrossbow.OnLoad)
Events.OnEquipPrimary.Add(HydroCrossbow.OnEquipPrimary)
Events.OnWeaponSwingHitPoint.Add(HydroCrossbow.OnFire)
Hook.Attack.Add(ISReloadWeaponAction.attackHook)
