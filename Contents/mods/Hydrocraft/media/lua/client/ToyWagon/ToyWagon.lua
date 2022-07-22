HydroToyWagon = HydroToyWagon or {};

function HydroToyWagon.isHydroToyWagon(name)
    return name == "Hydrocraft.HCToywagon"
end


function HydroToyWagon.OnLoad()
    local player = getPlayer();
    local item = player:getPrimaryHandItem();
    if item ~= nil then  
		local itemFullType = item:getFullType();
		if HydroToyWagon.isHydroToyWagon(itemFullType) then
			player:SetVariable("HCToyWagonEquip", "true");
        else
            player:SetVariable("HCToyWagonEquip", "false");
        end
	else
        player:SetVariable("HCToyWagonEquip", "false");
    end
end

function HydroToyWagon.checkBothHands(player)
    local primary = player:getPrimaryHandItem()
    local secondary = player:getSecondaryHandItem()
    if primary ~= nil and HydroToyWagon.isHydroToyWagon(primary:getFullType()) then
        player:SetVariable("HCToyWagonEquip", "true");
        return
    end
    if secondary ~= nil and HydroToyWagon.isHydroToyWagon(secondary:getFullType()) then
        player:SetVariable("HCToyWagonEquip", "true");
        return
    end
    -- Doesn't have it equipped in either hand
    player:SetVariable("HCToyWagonEquip", "false");
end

function HydroToyWagon.OnEquipPrimary(player, item)
    HydroToyWagon.checkBothHands(player)
end

function HydroToyWagon.OnEquipSecondary(player, item)
    HydroToyWagon.checkBothHands(player)
end

Events.OnLoad.Add(HydroToyWagon.OnLoad)
Events.OnEquipPrimary.Add(HydroToyWagon.OnEquipPrimary)
Events.OnEquipSecondary.Add(HydroToyWagon.OnEquipSecondary)
