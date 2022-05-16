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
	Hydrocraft.BuildOptionSteelStairs (player, HcSubMenu)
	Hydrocraft.BuildOptionGlassWall (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrick (player, HcSubMenu)
	Hydrocraft.BuildOptionWallBrickWin (player, HcSubMenu)
	Hydrocraft.BuildOptionIBCTower (player, HcSubMenu)
	Hydrocraft.BuildOptionKiln (player, HcSubMenu)
	Hydrocraft.BuildOptionHerbaltable (player, HcSubMenu)
	Hydrocraft.BuildOptionCellar (player, HcSubMenu)
	Hydrocraft.BuildOptionGrindstone (player, HcSubMenu)
	Hydrocraft.BuildOptionTarkiln (player, HcSubMenu)
	Hydrocraft.BuildOptionCarpybench (player, HcSubMenu)
	Hydrocraft.BuildOptionWaterPump(player, HcSubMenu)

	HcMenuOption = context:addOption("Ranching", worldobjects);
	HcSubMenu = ISContextMenu:getNew(context);


	context:addSubMenu(HcMenuOption, HcSubMenu);
	Hydrocraft.RanchingOptionBeehive(player, HcSubMenu)

end



Hydrocraft.RanchingOptionBeehive = function(player, HcSubMenu)
	local option
	local tooltip
	option = HcSubMenu:addOption('Beehive', nil, function() Hydrocraft.onBuildBeehive(player)  end);
	tooltip = Hydrocraft.toolTipcheck(option)
	tooltip:setName("Beehive")
	tooltip.description = "A Beehive for honey and wax"
	local inv = getSpecificPlayer(player):getInventory()
	local beehive_count = inv:getItemCount("Hydrocraft.HCBeehive3")
	local rgb = ""
	if beehive_count > 0 then rgb = "<RGB:1,1,1>"
	else rgb = "<RGB:1,0,0>" end
	tooltip.description = tooltip.description.."<LINE>"..rgb..string.format("%s: %i / 1", "Beehive", beehive_count)
	tooltip:setTexture("hcBuildingBeehive_00_0")
end


Hydrocraft.onBuildBeehive = function(player)
	local beehive = Beehive:new(player, "hcBuildingBeehive_00_0", Beehive.HoneyMax);
	beehive.modData["need:Hydrocraft.HCBeehive3"] = "1";
	-- beehive.modData["need:Base.Nails"] = "1";
	beehive.player = player
	beehive.skipBuildAction = true
	beehive.noNeedHammer = true;
	getCell():setDrag(beehive, player);
end



Hydrocraft.BuildOptionSteelStairs  = function(player, HcSubMenu)
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
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Propane Torch <LINE>Steelpole: 2 <LINE> Steel Rod:6 <LINE> Steelsheet: 5"
tooltip:setTexture(sprite.upToLeft01)
end


Hydrocraft.BuildOptionGlassRoof  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Glass roof", nil, function() Hydrocraft.onBuildGlassRoof(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Glass roof")
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Propane Torch <LINE> Steel Rod: 2 <LINE> Glass Pane: 1"
tooltip:setTexture("roofs_02_55")
end

Hydrocraft.BuildOptionGlassWall  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Glass Wall", nil, function() Hydrocraft.onBuildGlassWall(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Glass roof")
tooltip.description = "<RGB:1,1,1>Welding Mask <LINE>Propane Torch <LINE> Steel Rod: 3 <LINE> Large Glass Pane: 1"
tooltip:setTexture("walls_commercial_01_97")
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


Hydrocraft.BuildOptionWallBrickWin  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Brick wall with window", nil, function() Hydrocraft.onBuildWallBrickWin(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Brick wall with window")
tooltip.description = "<RGB:1,1,1>Mason Trowel<LINE> Mortar: 1 <LINE>Red Bricks:18  <LINE>Grey Bricks:15 <LINE>Stones: 20"
tooltip:setTexture("walls_exterior_house_02_73")
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



Hydrocraft.BuildOptionKiln  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Kiln", nil, function() Hydrocraft.onBuildKiln(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Just a Kiln")
tooltip.description = "<RGB:1,1,1>Kiln for Pottery"
tooltip:setTexture("hcBuildingKiln_01_0")
end

Hydrocraft.onBuildKiln = function(player)
local kiln = ISSimpleFurniture:new("Kiln", "hcBuildingKiln_01_0", "hcBuildingKiln_01_0");
kiln.isContainer = true;
kiln.canBeAlwaysPlaced = true;
kiln.modData["need:Hydrocraft.HCKiln"] = "1";
kiln.player = player
getCell():setDrag(kiln, player);
end


Hydrocraft.BuildOptionCarpybench  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Carpenters Workbench", nil, function() Hydrocraft.onBuildCarpybench(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Carpybench")
tooltip.description = "<RGB:1,1,1>Carpenter's Workbench"
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


Hydrocraft.BuildOptionHerbaltable  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Herbal Table", nil, function() Hydrocraft.onBuildHerbaltable(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Herbal Table")
tooltip.description = "<RGB:1,1,1>The Herbalist's Table"
tooltip:setTexture("hcBuildingHerbtable_01_0")
end



Hydrocraft.BuildOptionCellar  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Cellar", nil, function() Hydrocraft.onBuildCellar(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Cellar")
tooltip.description = "<RGB:1,1,1>A Huge Cellar Storage"
tooltip:setTexture("hcBuildingCellar_01_0")
end

Hydrocraft.onBuildCellar = function(player)
local cellar = ISSimpleFurniture:new("Cellar", "hcBuildingCellar_01_0", "hcBuildingCellar_01_0");
cellar.isContainer = true;
cellar.modData["need:Hydrocraft.HCCellar"] = "1";
cellar:setEastSprite("hcBuildingCellar_01_0");
cellar:setSouthSprite("hcBuildingCellar_01_0");
cellar:setNorthSprite ("hcBuildingCellar_01_0");
cellar.player = player
getCell():setDrag(cellar, player);
end


Hydrocraft.BuildOptionGrindstone  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Grindstone", nil, function() Hydrocraft.onBuildGrindstone(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Grindstone")
tooltip.description = "<RGB:1,1,1>The Grindstone"
tooltip:setTexture("hcBuildingGrindstone_01_0")
end


Hydrocraft.BuildOptionTarkiln  = function(player, HcSubMenu)
local option
local tooltip
option = HcSubMenu:addOption("Tar Kiln", nil, function() Hydrocraft.onBuildTarkiln(player) end);
tooltip = Hydrocraft.toolTipcheck(option)
tooltip:setName("Grindstone")
tooltip.description = "<RGB:1,1,1>The Tar Kiln"
tooltip:setTexture("hcBuildingTarkiln_01_0")
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


-- *********************** BuildingFunctions ********************


Hydrocraft.onBuildTarkiln = function(player)
local tarkiln = ISSimpleFurniture:new("Tarkiln", "hcBuildingTarkiln_01_0", "hcBuildingTarkiln_01_0");
tarkiln.isContainer = true;
tarkiln.canBeAlwaysPlaced = true;
tarkiln.modData["need:Hydrocraft.HCTarkiln"] = "1";
tarkiln:setEastSprite("hcBuildingTarkiln_01_0");
tarkiln:setSouthSprite("hcBuildingTarkiln_01_0");
tarkiln:setNorthSprite ("hcBuildingTarkiln_01_0");
tarkiln.player = player
getCell():setDrag(tarkiln, player);
end


Hydrocraft.onBuildGrindstone = function(player)
local grindstone = ISSimpleFurniture:new("Grindstone", "hcBuildingGrindstone_01_0", "hcBuildingGrindstone_01_0");
grindstone.isContainer = true;
grindstone.canBeAlwaysPlaced = true;
grindstone.modData["need:Hydrocraft.HCGrindstone"] = "1";
grindstone:setEastSprite("hcBuildingGrindstone_01_0");
grindstone:setSouthSprite("hcBuildingGrindstone_01_0");
grindstone:setNorthSprite ("hcBuildingGrindstone_01_0");
grindstone.player = player
getCell():setDrag(grindstone, player);
end


Hydrocraft.onBuildHerbaltable = function(player)
local herbtab = ISSimpleFurniture:new("Herbalist Table", "hcBuildingHerbtable_01_0", "hcBuildingHerbaltable_01_0");
herbtab.isContainer = true;
herbtab.canBeAlwaysPlaced = true;
herbtab.modData["need:Hydrocraft.HCHerbtable"] = "1";
herbtab:setEastSprite("hcBuildingHerbtable_01_0");
herbtab:setSouthSprite("hcBuildingHerbtable_01_0");
herbtab:setNorthSprite ("hcBuildingHerbtable_01_0");
herbtab.player = player
getCell():setDrag(herbtab, player);
end




Hydrocraft.onBuildIBCTower = function(player)
local barrel = RainCollectorBarrel:new(player, "hcBuildingIBCTower_01_0", 2000);
	barrel.modData["need:Hydrocraft.HCIBCtower"] = "1";
	barrel.player = player
	getCell():setDrag(barrel, player);
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

Hydrocraft.onBuildWaterPump = function(player)
	local pump = WaterPump:new(player, "hcBuildingWaterPump_01_0", WaterPump.waterMax);
	pump.modData["need:Hydrocraft.HCWaterpump"] = "1";
	pump.player = player
	getCell():setDrag(pump, player);
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




