Hydrocraft = {}

HcMenu = HcMenu or {}; 
HcMenu._index = HcMenu


 Hydrocraft.doBuildMenus = function(_player, _context, _worldObjects)

	local player = _player;
	local context = _context;
	local worldobjects = _worldObjects;
	local HcMenuOption = context:addOption("Building", worldobjects);
	local HcSubMenu = ISContextMenu:getNew(context);
	context:addSubMenu(HcMenuOption, HcSubMenu);

	Hydrocraft.BuildOptionGlassRoof(player, HcSubMenu)
	Hydrocraft.BuildOptionMetalStairs (player, HcSubMenu)
	Hydrocraft.BuildOptionGlassWall (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrick (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrickWin (player, HcSubMenu)
	
	Hydrocraft.BuildOptionIBCTower (player, HcSubMenu)
	Hydrocraft.BuildOptionWaterPump(player, HcSubMenu)

	Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCKiln", "Kiln", "hcBuildingKiln_01_0")
	--Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCSmelter", "Smelter", "hcBuildingSmelter_01_0")
	Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCHerbtable", "Herbalist Table", "hcBuildingHerbtable_01_0")
	Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCCellar", "Cellar", "hcBuildingCellar_01_0")
	Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCGrindstone", "Grindstone", "hcBuildingGrindstone_01_0")
	Hydrocraft.buildOptionSimpleStation (player, HcSubMenu, "Hydrocraft.HCTarkiln", "Tarkiln", "hcBuildingTarkiln_01_0")
	
	Hydrocraft.BuildOptionCarpybench (player, HcSubMenu)

	HcMenuOption = context:addOption("Ranching", worldobjects);
	HcSubMenu = ISContextMenu:getNew(context);


	--context:addSubMenu(HcMenuOption, HcSubMenu);
	Hydrocraft.RanchingOptionBeehive(player, HcSubMenu)
    -- add beehive contect menu 
	beehive = nil
	for i,v in ipairs(worldobjects) do
		if CBeehiveSystem.instance:isValidIsoObject(v) then
			beehive = v
		end
	end

	if beehive then
		-- Hydrocraft.show_info(player, HcSubMenu, worldobjects, beehive)
	end

end


Hydrocraft.RanchingOptionBeehive = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption('Beehive', nil, function() Hydrocraft.onBuildBeehive(player)  end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Beehive")
tooltip.description = "<RGB:1,1,1>A Beehive for some Honey and Wax"
tooltip:setTexture("hcBuildingBeehive_00_0")
end

Hydrocraft.onBuildBeehive = function(player)
	local beehive = Beehive:new(player, "hcBuildingBeehive_00_0", Beehive.HoneyMax);
	--beehive.modData["need:Hydrocraft.HCBeehive"] = "1";
	beehive.modData["need:Base.Nails"] = "1";
	beehive.player = player
	beehive.skipBuildAction = true
	beehive.noNeedHammer = true;
	getCell():setDrag(beehive, player);
end


Hydrocraft.BuildOptionIBCTower  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("IBC Tower", nil, function() Hydrocraft.onBuildIBCTower(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Huge IBC Tower")
tooltip.description = "<RGB:1,1,1>IBCtower"
tooltip:setTexture("carpentry_02_52")
end

Hydrocraft.onBuildIBCTower = function(player)
local barrel = RainCollectorBarrel:new(player, "hcBuildingIBCTower_01_0", 2000);
	barrel.modData["need:Hydrocraft.HCIBCtower"] = "1";
	barrel.player = player
	getCell():setDrag(barrel, player);
end

Hydrocraft.BuildOptionWaterPump = function(player, HcSubMenu)
	local option
	local tooltip
	option = HcSubMenu:addOption("Water Pump", nil, function() Hydrocraft.onBuildWaterPump(player) end);
	tooltip = Hydrocraft.toolTipcheck(option)
	tooltip:setName("Water Pump")
	tooltip.description = "<RGB:1,1,1>Water Pump"
	tooltip:setTexture("hcBuildingWaterPump_01_0")
end

Hydrocraft.onBuildWaterPump = function(player)
	local pump = WaterPump:new(player, "hcBuildingWaterPump_01_0", WaterPump.waterMax);
	pump.modData["need:Hydrocraft.HCWaterpump"] = "1";
	pump.player = player
	getCell():setDrag(pump, player);
end

-- *********************** Stations ********************

Hydrocraft.BuildOptionCarpybench  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Carpenters Workbench", nil, function() Hydrocraft.onBuildCarpybench(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Carpybench")
tooltip.description = "<RGB:1,1,1>Carpenters Workbench"
tooltip:setTexture("hcBuildingCarpBench_01_0")
end

Hydrocraft.onBuildCarpybench = function(player)
local carpybench = ISDoubleTileFurniture:new("Carpybench", "hcBuildingCarpBench_02_0", "hcBuildingCarpBench_01_0", "hcBuildingCarpBench_12_0", "hcBuildingCarpBench_11_0");
carpybench.isContainer = true;
carpybench.canBeAlwaysPlaced = true;
carpybench.modData["need:Hydrocraft.HCCarpenterbench"] = "1";
carpybench.player = player
carpybench.completionSound = "BuildWoodenStructureLarge";
getCell():setDrag(carpybench, player);
end


Hydrocraft.buildOptionSimpleStation = function(player, HcSubMenu, id, name, sprite)
	local _name = getText(name);
	local option = HcSubMenu:addOption((getText("Place")..": " .. _name), nil, function() Hydrocraft.onBuildSimpleStation(player, id, _name, sprite) end);
	local tooltip = Hydrocraft.toolTipcheck(option);
	local playerInv = getSpecificPlayer(player):getInventory();
	tooltip:setName(_name)
	if playerInv:getItemCount(id) > 0 then
		tooltip.description = "<RGB:0,1,0> " .. _name
	else
		tooltip.description = "<RGB:1,0,0> " .. _name
	end
	tooltip:setTexture(sprite)
end

Hydrocraft.onBuildSimpleStation = function(player, id, name, sprite)
local station = ISSimpleFurniture:new(name, sprite, sprite)
station.name = name;
station.isContainer = true
station.canBeAlwaysPlaced = true
station.modData["need:"..id] = "1"
station.player = player
station.completionSound = "BuildWoodenStructureLarge";
getCell():setDrag(station, player)
end

-- *********************** Obstacles ********************

Hydrocraft.BuildOptionWallBrickWin  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Brick wall with window", nil, function() Hydrocraft.onBuildWallBrickWin(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Brick wall with window")
tooltip.description = "<RGB:1,1,1>Mason Trowel<LINE> Mortar: 1 <LINE>Red Bricks:18  <LINE>Grey Bricks:15 <LINE>Stones: 20"
tooltip:setTexture("walls_exterior_house_02_73")
end

Hydrocraft.onBuildWallBrickWin = function(player)
local wall = ISWoodenWall:new("walls_exterior_house_02_72","walls_exterior_house_02_73", nil);
wall.player = player
wall.name = "Brick Wall with Window"
wall.canBarricade = true
wall.hoppable = true

wall.modData["need:Hydrocraft.HCGreybrick"] = "15";
wall.modData["need:Hydrocraft.HCRedbrick"] = "18";
wall.modData["need:Base.Stone"] = "20";
wall.modData["need:Hydrocraft.HCMortar"] = "1";


wall.firstItem = "Hydrocraft.HCMasontrowel";
wall.health = 700;
getCell():setDrag(wall, player);
end


Hydrocraft.BuildOptionWallBrick  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Brick wall", nil, function() Hydrocraft.onBuildWallBrick(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Brick wall")
tooltip.description = "<RGB:1,1,1>Mason Trowel<LINE> Mortar: 1 <LINE>Red Bricks:22  <LINE>Grey Bricks:18 <LINE>Stones: 20"
tooltip:setTexture("walls_exterior_house_02_65")
end

Hydrocraft.onBuildWallBrick = function(player)
local wall = ISWoodenWall:new("walls_exterior_house_02_64","walls_exterior_house_02_65", nil);
wall.player = player
wall.name = "Brick Wall"
wall.canBarricade = false
wall.hoppable = false

wall.modData["need:Hydrocraft.HCGreybrick"] = "18";
wall.modData["need:Hydrocraft.HCRedbrick"] = "22";
wall.modData["need:Base.Stone"] = "20";
wall.modData["need:Hydrocraft.HCMortar"] = "1";

wall.firstItem = "Hydrocraft.HCMasontrowel";
wall.health = 700;
getCell():setDrag(wall, player);
end


Hydrocraft.BuildOptionMetalStairs  = function(player, HcSubMenu)
local option
local tooltip
sprite = {}
sprite.upToLeft01 = "fixtures_stairs_01_3"
sprite.upToLeft02 = "fixtures_stairs_01_4"
sprite.upToLeft03 = "fixtures_stairs_01_5"
sprite.upToRight01 = "fixtures_stairs_01_11"
sprite.upToRight02 = "fixtures_stairs_01_12"
sprite.upToRight03 = "fixtures_stairs_01_13"
sprite.pillar = "fixtures_stairs_01_14"
sprite.pillarNorth = "fixtures_stairs_01_14"
	
option = HcSubMenu:addOption("Build Steel Stairs", nil, function() Hydrocraft.onBuildMetalStairs(sprite,player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Build Steel Stairs")
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Blow Torch <LINE>Steelpole: 2 <LINE> Steelrod:6 <LINE> Steelsheet: 5"
tooltip:setTexture(sprite.upToLeft01)
end

Hydrocraft.onBuildMetalStairs = function(sprite,player)

local stairs = ISWoodenStairs:new(sprite.upToLeft01, sprite.upToLeft02, sprite.upToLeft03, sprite.upToRight01, sprite.upToRight02, sprite.upToRight03, sprite.pillar, sprite.pillarNorth)
stairs.isThumpable = false
stairs.player = player
stairs.name = "Steel Stairs"
stairs.modData["need:Hydrocraft.HCSteelpole"] = "2"
stairs.modData["need:Hydrocraft.HCSteelrod"] = "6"
stairs.modData["need:Hydrocraft.HCSteelsheet"] = "5"

stairs.firstItem = "BlowTorch";
stairs.secondItem = "WeldingMask";
stairs.craftingBank = "BlowTorch";
stairs.modData["use:Base.BlowTorch"] = torchUse;
stairs.modData["xp:MetalWelding"] = 20;
stairs.noNeedHammer = true;
stairs.health = 120;
getCell():setDrag(stairs, player);
end


Hydrocraft.BuildOptionGlassRoof  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Glass roof", nil, function() Hydrocraft.onBuildGlassRoof(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Glass roof")
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Blow Torch <LINE> Steel Rod: 2 <LINE> Glass Pane: 1"
tooltip:setTexture("roofs_02_55")
end

Hydrocraft.onBuildGlassRoof = function(player)
local floor = ISWoodenFloor:new("roofs_02_55","roofs_02_55");
floor.player = player
floor.name = "Glass roof"

floor.modData["need:Hydrocraft.HCSteelrod"] = "2"
floor.modData["need:Hydrocraft.HCGlasspane"] = "1"

floor.firstItem = "BlowTorch";
floor.secondItem = "WeldingMask";
floor.craftingBank = "BlowTorch";
floor.modData["use:Base.BlowTorch"] = torchUse;
floor.modData["xp:MetalWelding"] = 10;
floor.noNeedHammer = true;
floor.health = 10;
getCell():setDrag(floor, player);
end


Hydrocraft.BuildOptionGlassWall  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Glass Wall", nil, function() Hydrocraft.onBuildGlassWall(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Glass roof")
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Blow Torch <LINE> Steel Rod: 3 <LINE> Large Glass Pane: 1"
tooltip:setTexture("walls_commercial_01_97")
end

Hydrocraft.onBuildGlassWall = function(player)
local wall = ISWoodenWall:new("walls_commercial_01_96","walls_commercial_01_97", nil);
wall.player = player
wall.name = "Glass Wall"
wall.canBarricade = false
wall.hoppable = false

wall.modData["need:Hydrocraft.HCSteelrod"] = "3"
wall.modData["need:Hydrocraft.HCGlasspanelarge"] = "1"

wall.firstItem = "BlowTorch";
wall.secondItem = "WeldingMask";
wall.craftingBank = "BlowTorch";
wall.modData["use:Base.BlowTorch"] = torchUse;
wall.modData["xp:MetalWelding"] = 10;
wall.noNeedHammer = true;
wall.health = 10;
getCell():setDrag(wall, player);
end



Hydrocraft.toolTipcheck = function(option)

	local _tooltip = ISToolTip:new()
	_tooltip:initialise()
	_tooltip:setVisible(false)
	option.toolTip = _tooltip

	return _tooltip
end

local function func_Init()
	Events.OnFillWorldObjectContextMenu.Add(Hydrocraft.doBuildMenus)
end

Events.OnGameStart.Add(func_Init)




