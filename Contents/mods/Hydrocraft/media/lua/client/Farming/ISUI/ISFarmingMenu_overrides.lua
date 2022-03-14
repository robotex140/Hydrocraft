


function ISFarmingMenu:doSeedMenu(context, plant, sq, playerObj)
	local seedOption = context:addOption(getText("ContextMenu_Sow_Seed"), nil, nil)
	local subMenu = context:getNew(context)
	context:addSubMenu(seedOption, subMenu)

	-- Sort seed types by display name.
	local typeOfSeedList = {}
	for typeOfSeed,props in pairs(farming_vegetableconf.props) do
		table.insert(typeOfSeedList, { typeOfSeed = typeOfSeed, props = props, text = getText("Farming_" .. typeOfSeed) })
	end
	
	table.sort(typeOfSeedList, function(a,b) return not string.sort(a.text, b.text) end)
	
	for _,tos in ipairs(typeOfSeedList) do
		local typeOfSeed = tos.typeOfSeed
		local option = subMenu:addOption(tos.text, playerObj, ISFarmingMenu.onSeed, typeOfSeed, plant, sq)
		local nbOfSeed = playerObj:getInventory():getCountTypeRecurse(tos.props.seedName)
		ISFarmingMenu.canPlow(nbOfSeed, typeOfSeed, option)
		
		if (nbOfSeed < tos.props.seedsRequired and tos.props.plantWithFruit == true) then
			nbOfSeed = playerObj:getInventory():getCountTypeRecurse(tos.props.vegetableName)
			if (nbOfSeed > 0 ) then
				tos.props.typeOfSeed = tos.props.vegetableName
				tos.props.seedsRequired = 1
				option = subMenu:addOption(tos.text, playerObj, ISFarmingMenu.onSeedPWF, typeOfSeed, plant, sq)
				ISFarmingMenu.canPlow(1, typeOfSeed, option)
			end
		end
	end
end


function ISFarmingMenu.onSeedPWF(playerObj, typeOfSeed, plant, sq)
	if ISFarmingMenu.walkToPlant(playerObj, sq) then
		local playerInv = playerObj:getInventory()
		local props = farming_vegetableconf.props[typeOfSeed]
		local items = playerInv:getSomeTypeRecurse(props.vegetableName, 1)
		ISInventoryPaneContextMenu.transferIfNeeded(playerObj, items)
		local seeds = {}
		for i=1,items:size() do
			local item = items:get(i-1)
			table.insert(seeds, items:get(i-1))
		end
		ISTimedActionQueue.add(ISSeedAction:new(playerObj, seeds, props.seedsRequired, typeOfSeed, plant, 40))
	end
	if playerObj:getJoypadBind() ~= -1 then
		return
	end
	ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onSeedSquareSelected, ISFarmingMenu.isSeedValid)
	getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
	ISFarmingMenu.cursor.typeOfSeed = typeOfSeed;
end



ISFarmingMenu.canPlow = function(seedAvailable, typeOfSeed, option)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	option.toolTip = tooltip;
	tooltip:setName(getText("Farming_" .. typeOfSeed));
	local result = true;
	tooltip.description = getText("Farming_Tooltip_MinWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. "";
	if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
		tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_MaxWater") ..  farming_vegetableconf.props[typeOfSeed].waterLvlMax;
	end
	tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_TimeOfGrow") .. math.floor((farming_vegetableconf.props[typeOfSeed].timeToGrow * 7) / 24) .. " " .. getText("IGUI_Gametime_days");
    local waterPlus = "";
    if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
        waterPlus = "-" .. farming_vegetableconf.props[typeOfSeed].waterLvlMax;
    end
    tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_AverageWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. waterPlus;

    if farming_vegetableconf.props[typeOfSeed].plantWithFruit then
    tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_PlantWithFruit");
    end


	local rgb = "";
	if seedAvailable < farming_vegetableconf.props[typeOfSeed].seedsRequired then
		result = false;
		rgb = "<RGB:1,0,0>";
	end
	tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_RequiredSeeds") .. seedAvailable .. "/" .. farming_vegetableconf.props[typeOfSeed].seedsRequired;
	tooltip:setTexture(farming_vegetableconf.props[typeOfSeed].texture);
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
    end
    tooltip:setWidth(170);
end
