
function hcdismantlemicro(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.ElectronicsScrap");
    inv:AddItem("Base.SheetMetal");
end

function hcgetscrap(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.ElectronicsScrap");
    inv:AddItem("Base.Wire");
end

function hcgetdynamo(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCDynamo");
end


function hcjunkScrapParts(items, result, player) 
local amount = ZombRand(6);
player:getInventory():AddItems("Base.ScrapMetal",amount);
end


function hcjunksearchsmall(items, result, player)

local skill = player:getPerkLevel(Perks.PlantScavenging);
local luck = ZombRand(10) + skill;
local ItemNr=0;
local count =0;
junkFinds = {};

junk = {'Base.ElectronicsScrap','Base.Newspaper','Hydrocraft.HCBatterysmalldead','Hydrocraft.HCBatteryempty','Hydrocraft.HCBatterymediumdead','Hydrocraft.HCBatterylargedead','Hydrocraft.HCDeodorantspray','Hydrocraft.HCRazorblade','Hydrocraft.HCBookcover','Hydrocraft.HCWirehanger','Hydrocraft.HCWoodhanger','Hydrocraft.HCBathtoweldirty','Hydrocraft.HCSafetypin','Hydrocraft.HCSewingpin','Hydrocraft.HCFilmcanister','Hydrocraft.HCThumbtack','Hydrocraft.HCBinderclip','Hydrocraft.HCDustpan','Base.JarLid','Hydrocraft.HCPaintcan','Hydrocraft.HCGummybearstrash','Hydrocraft.HCCandycorntrash','Hydrocraft.HCEnergydrinktrash','Hydrocraft.HCCrisps6trash','Hydrocraft.HCCrisps5trash','Hydrocraft.HCPoptrash','Hydrocraft.HCCannedsardinesempty','Hydrocraft.HCCannedtomatoempty','Hydrocraft.HCCannedpumpkinempty','Hydrocraft.HCCannedpearempty','Hydrocraft.HCCannedappleempty','Hydrocraft.HCTrailmixtrash','Hydrocraft.HCChocolatewhitetrash','Hydrocraft.HCChocolatedarktrash','Hydrocraft.HCMintcandytrash','Hydrocraft.HCMustardempty','Hydrocraft.HCKetchupempty','Hydrocraft.HCYoghurtempty','Hydrocraft.HCIcecreamempty','Hydrocraft.HCCerealtrash','Hydrocraft.HCOatsempty','Hydrocraft.HCScotchtapeempty','Hydrocraft.HCLicenceplate','Hydrocraft.HCLicenceplate','Hydrocraft.HCEyedropperbottle','Hydrocraft.HCGlassbottlesulfuricacidempty','Hydrocraft.HCGlassbottlephenylempty','Hydrocraft.HCGlassbottlemethylaminempty','Hydrocraft.HCGlassbottleh2o2empty','Hydrocraft.HCGlassbottleammoniaempty','Hydrocraft.HCGlassbottleethanolempty','Hydrocraft.HCPlastcfork','Hydrocraft.HCNapkindirty','Hydrocraft.HCPlasticstraw','Hydrocraft.HCBeercan','Hydrocraft.HCBabyfoodjar','Hydrocraft.HCRamencheesetrash','Hydrocraft.HCRamenshrimptrash','Hydrocraft.HCRamenchickentrash','Hydrocraft.HCCanbangedupopenempty','Hydrocraft.HCCannedcheesesauceopenempty','Hydrocraft.HCCannedchickenbreastopenempty','Hydrocraft.HCCannedfruitcocktailopenempty','Hydrocraft.HCCannedgovermentbeefopenempty','Hydrocraft.HCCannedgovermentbreadopenempty','Hydrocraft.HCCannedgovermentchickenopenempty','Hydrocraft.HCCannedgovermentporkopenempty','Hydrocraft.HCCannedpiefillingappleopenempty','Hydrocraft.HCCannedpiefillingcherryopenempty','Hydrocraft.HCCannedpiefillingblueberryopenempty','Hydrocraft.HCCannedravioliopenempty','Hydrocraft.HCCannedspaghettiringsopenempty','Hydrocraft.HCWhippedcreamcanempty','Hydrocraft.HCPuddingcupempty','Hydrocraft.HCCookiesbrowniebagtrash','Hydrocraft.HCCookiesmintbagtrash','Hydrocraft.HCCookieschocolatechipbagtrash','Hydrocraft.HCEvaporatedmilkopenempty'}
good = {'Base.Bullets44Box','Base.Bullets9mmBox','Base.ShotgunShellsBox','Hydrocraft.HCColoredwire','Hydrocraft.HCColander','Base.LightBulb','Hydrocraft.HCSyringeempty','Base.Coldpack','Base.RubberBand','Base.Screws','Base.CordlessPhone','Base.KitchenKnife','Hydrocraft.HCHairdryer','farming.GardeningSprayEmpty','Hydrocraft.HCTampon','Base.Headphones','Hydrocraft.HCClothespin','Hydrocraft.HCBungeecord','Hydrocraft.HCWeldinghose','Hydrocraft.HCRubberhose','Base.CDplayer','Base.Needle','Hydrocraft.HCBoxphoto','Hydrocraft.HCBoxgarden','Hydrocraft.HCBoxpet','Hydrocraft.HCBoxelectronic','Hydrocraft.HCBoxlab','Hydrocraft.HCMysteryseedspacket','Hydrocraft.HCCircuitboarduseless','Hydrocraft.HCElectronicparts01','Hydrocraft.HCColoredwire','Base.Book','Hydrocraft.HCFlourempty','Hydrocraft.HCRiceempty','Hydrocraft.HCSugarempty','Hydrocraft.HCVinegarempty','Hydrocraft.HCGlueempty','Hydrocraft.HCValve','Hydrocraft.HCXmasgift'}

if  player:getTraits():contains('Lucky') then 
    luck = luck + 3;
    player:getInventory():AddItems("Base.ScrapMetal",ZombRand(5));
else
    player:getInventory():AddItems("Base.ScrapMetal",ZombRand(3));
end

if luck <= 12 then -- found junk
    junkFinds = junk;
else 
    junkFinds = good;
end

for _ in pairs(junkFinds) do count = count + 1 end
ItemNr = ZombRand(count)+1;
player:getInventory():AddItem(junkFinds[ItemNr]);

end
	
function hcjunksearchmedium(items, result, player)
    local metal = ZombRand(91);
    
    if metal == 90 then
	    player:getInventory():AddItem("Base.EngineParts");
    elseif metal == 89 then
	    player:getInventory():AddItem("Base.ModernCarMuffler1");
    elseif metal == 88 then
	    player:getInventory():AddItem("Base.ModernCarMuffler2");
    elseif metal == 87 then
	    player:getInventory():AddItem("Base.ModernCarMuffler3");
    elseif metal == 86 then
	    player:getInventory():AddItem("Base.NormalCarMuffler1");
    elseif metal == 85 then
	    player:getInventory():AddItem("Base.NormalCarMuffler2");
    elseif metal == 84 then
	    player:getInventory():AddItem("Base.NormalCarMuffler3");
    elseif metal == 83 then
	    player:getInventory():AddItem("Base.OldCarMuffler1");
    elseif metal == 82 then
	    player:getInventory():AddItem("Base.OldCarMuffler2");
    elseif metal == 81 then	
	    player:getInventory():AddItem("Base.OldCarMuffler3");
    elseif metal == 80 then
	    player:getInventory():AddItem("Base.GloveBox1");
    elseif metal == 79 then
	    player:getInventory():AddItem("Base.GloveBox2");
    elseif metal == 78 then
	    player:getInventory():AddItem("Base.GloveBox3");
    elseif metal == 77 then	
	    player:getInventory():AddItem("Base.CarBattery1");
    elseif metal == 76 then
	    player:getInventory():AddItem("Base.CarBattery2");
    elseif metal == 75 then	
	    player:getInventory():AddItem("Base.CarBattery3");
    elseif metal == 74 then
	    player:getInventory():AddItem("Base.BigGasTank1");
    elseif metal == 73 then
	    player:getInventory():AddItem("Base.BigGasTank2");
    elseif metal == 72 then
	    player:getInventory():AddItem("Base.BigGasTank3");
    elseif metal == 71 then	
	    player:getInventory():AddItem("Base.NormalGasTank1");
    elseif metal == 70 then
	    player:getInventory():AddItem("Base.NormalGasTank2");
    elseif metal == 69 then
	    player:getInventory():AddItem("Base.NormalGasTank3");
    elseif metal == 68 then
	    player:getInventory():AddItem("Base.SmallGasTank1");
    elseif metal == 67 then
	    player:getInventory():AddItem("Base.SmallGasTank2");		
    elseif metal == 66 then
	    player:getInventory():AddItem("Base.SmallGasTank3");
    elseif metal == 65 then		
	    player:getInventory():AddItem("Base.ModernSuspension1");
    elseif metal == 64 then
	    player:getInventory():AddItem("Base.ModernSuspension2");
    elseif metal == 63 then
	    player:getInventory():AddItem("Base.ModernSuspension3");
    elseif metal == 62 then
	    player:getInventory():AddItem("Base.NormalSuspension1");
    elseif metal == 61 then
	    player:getInventory():AddItem("Base.NormalSuspension2");
    elseif metal == 60 then
	    player:getInventory():AddItem("Base.NormalSuspension3");
    elseif metal == 59 then	
	    player:getInventory():AddItem("Base.ModernBrake1");
    elseif metal == 58 then
	    player:getInventory():AddItem("Base.ModernBrake2");
    elseif metal == 57 then	
	    player:getInventory():AddItem("Base.ModernBrake3");
    elseif metal == 56 then
	    player:getInventory():AddItem("Base.NormalBrake1");
    elseif metal == 55 then
	    player:getInventory():AddItem("Base.NormalBrake2");
    elseif metal == 54 then
	    player:getInventory():AddItem("Base.NormalBrake3");
    elseif metal == 53 then		
	    player:getInventory():AddItem("Base.OldBrake1");
    elseif metal == 52 then
	    player:getInventory():AddItem("Base.OldBrake2");
    elseif metal == 51 then
	    player:getInventory():AddItem("Base.OldBrake3");
    elseif metal == 50 then
	    player:getInventory():AddItem("Base.CarBatteryCharger");
    elseif metal == 49 then	
		player:getInventory():AddItem("Base.OldTire1");
    elseif metal == 48 then	
		player:getInventory():AddItem("Base.OldTire2");
    elseif metal == 47 then	
		player:getInventory():AddItem("Base.OldTire3");
    elseif metal == 46 then	
		player:getInventory():AddItem("Base.NormalTire1");
    elseif metal == 45 then	
		player:getInventory():AddItem("Base.NormalTire2");
    elseif metal == 44 then
		player:getInventory():AddItem("Base.NormalTire3");
    elseif metal == 43 then		
		player:getInventory():AddItem("Base.ModernTire1");
    elseif metal == 42 then	
		player:getInventory():AddItem("Base.ModernTire2");
    elseif metal == 41 then	
		player:getInventory():AddItem("Base.ModernTire3");		
    elseif metal == 40 then	
		player:getInventory():AddItem("Hydrocraft.HCDrillcordless");
    elseif metal == 39 then		
		player:getInventory():AddItem("Hydrocraft.HCComputerPSU");
    elseif metal == 38 then		
	    player:getInventory():AddItem("Hydrocraft.HCLever");
    elseif metal == 37 then		
	    player:getInventory():AddItem("Hydrocraft.HCBicyclewheel");
    elseif metal == 36 then	
	    player:getInventory():AddItem("Hydrocraft.HCWiper");
    elseif metal == 35 then
	    player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 34 then	
	    player:getInventory():AddItem("Hydrocraft.HCXmasgift");
    elseif metal == 33 then
	    player:getInventory():AddItem("Hydrocraft.HCRadiator");
    elseif metal == 32 then
	    player:getInventory():AddItem("Hydrocraft.HCOilfilter");
    elseif metal == 31 then
	    player:getInventory():AddItem("Hydrocraft.HCRustyshards");
    elseif metal == 30 then
	    player:getInventory():AddItem("Hydrocraft.HCFanbelt");
    elseif metal == 29 then
	    player:getInventory():AddItem("Hydrocraft.HCDrumbreak");
    elseif metal == 28 then
	    player:getInventory():AddItem("Hydrocraft.HCClutch");
    elseif metal == 27 then
	    player:getInventory():AddItem("Hydrocraft.HCCamshaft");
    elseif metal == 26 then
	    player:getInventory():AddItem("Hydrocraft.HCBreakpads");
    elseif metal == 25 then
	    player:getInventory():AddItem("Hydrocraft.HCAirfilter");
    elseif metal == 24 then	
	    player:getInventory():AddItem("Hydrocraft.HCXmasgift");
    elseif metal == 23 then
        player:getInventory():AddItem("Hydrocraft.HCChain");
    elseif metal == 22 then
        player:getInventory():AddItem("Hydrocraft.HCDynamo");
    elseif metal == 21 then
        player:getInventory():AddItem("Hydrocraft.HCChickenwire");
    elseif metal == 20 then
        player:getInventory():AddItem("Base.Pipe");
    elseif metal == 19 then
        player:getInventory():AddItem("Hydrocraft.HCBubblewrap");
    elseif metal == 18 then
        player:getInventory():AddItem("Base.Speaker");
    elseif metal == 17 then
        player:getInventory():AddItem("Base.Kettle");
    elseif metal == 16 then
        player:getInventory():AddItem("Hydrocraft.HCMetalbox");
    elseif metal == 15 then
        player:getInventory():AddItem("Hydrocraft.UmbrellaClosed");
    elseif metal == 14 then
        player:getInventory():AddItem("Hydrocraft.HCCooler");
    elseif metal == 13 then
        player:getInventory():AddItem("Hydrocraft.HCMag");
    elseif metal == 12 then
        player:getInventory():AddItem("Base.Pot");
    elseif metal == 11 then
        player:getInventory():AddItem("Base.BakingPan");
    elseif metal == 10 then
        player:getInventory():AddItem("Hydrocraft.HCPowercord");
    elseif metal == 9 then
        player:getInventory():AddItem('Hydrocraft.HCPlasticbin');
    elseif metal == 8 then
        player:getInventory():AddItem("Hydrocraft.HCJuicer2");
    elseif metal == 7 then
        player:getInventory():AddItem("Hydrocraft.HCToaster");
    elseif metal == 6 then
        player:getInventory():AddItem("Hydrocraft.HCBlenderdead");
    elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCRicecookerdead");
    elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCXmaslights");
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCPlasticbin");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCPlasticbin2");
    elseif metal == 1 then
        player:getInventory():AddItem("Hydrocraft.HCRaccoonfemale");
    elseif metal == 0 then
        player:getInventory():AddItem("Hydrocraft.HCRaccoonmale");
    end
end


function hcjunksearchlarge(items, result, player)
    local metal = ZombRand(58);
    
    if metal == 57 then
	    player:getInventory():AddItem("Base.SportCarSeat1");
    elseif metal == 56 then	
	    player:getInventory():AddItem("Base.SportCarSeat2");
    elseif metal == 55 then	
	    player:getInventory():AddItem("Base.SportCarSeat3");
    elseif metal == 54 then	
	    player:getInventory():AddItem("Base.BigCarSeat1");
    elseif metal == 53 then	
	    player:getInventory():AddItem("Base.BigCarSeat2");
    elseif metal == 52 then	
	    player:getInventory():AddItem("Base.BigCarSeat3");
    elseif metal == 51 then		
	    player:getInventory():AddItem("Base.NormalCarSeat1");
    elseif metal == 50 then	
	    player:getInventory():AddItem("Base.NormalCarSeat2");
    elseif metal == 49 then	
	    player:getInventory():AddItem("Base.NormalCarSeat3");
    elseif metal == 48 then		
	    player:getInventory():AddItem("Base.TrunkDoor1");
    elseif metal == 47 then	
	    player:getInventory():AddItem("Base.TrunkDoor2");
    elseif metal == 46 then	
	    player:getInventory():AddItem("Base.TrunkDoor3");
    elseif metal == 45 then		
	    player:getInventory():AddItem("Base.EngineDoor1");
    elseif metal == 44 then	
	    player:getInventory():AddItem("Base.EngineDoor2");
    elseif metal == 43 then	
	    player:getInventory():AddItem("Base.EngineDoor3");
    elseif metal == 42 then		
	    player:getInventory():AddItem("Base.RearCarDoorDouble1");
    elseif metal == 41 then	
	    player:getInventory():AddItem("Base.RearCarDoorDouble2");
    elseif metal == 40 then	
	    player:getInventory():AddItem("Base.RearCarDoorDouble3");
    elseif metal == 39 then	
	    player:getInventory():AddItem("Base.RearCarDoor1");
    elseif metal == 38 then	
	    player:getInventory():AddItem("Base.RearCarDoor2");
    elseif metal == 37 then	
	    player:getInventory():AddItem("Base.RearCarDoor3");
    elseif metal == 36 then	
	    player:getInventory():AddItem("Base.FrontCarDoor1");
    elseif metal == 35 then	
	    player:getInventory():AddItem("Base.FrontCarDoor2");
    elseif metal == 34 then		
	    player:getInventory():AddItem("Base.FrontCarDoor3");
    elseif metal == 33 then	
	    player:getInventory():AddItem("Base.BigTrunk1");
    elseif metal == 32 then	
	    player:getInventory():AddItem("Base.BigTrunk2");
    elseif metal == 31 then	
	    player:getInventory():AddItem("Base.BigTrunk3");
    elseif metal == 30 then	
	    player:getInventory():AddItem("Base.NormalTrunk1");
    elseif metal == 29 then	
	    player:getInventory():AddItem("Base.NormalTrunk2");
    elseif metal == 28 then	
	    player:getInventory():AddItem("Base.NormalTrunk3");
    elseif metal == 27 then	
	    player:getInventory():AddItem("Base.SmallTrunk1");
    elseif metal == 26 then	
	    player:getInventory():AddItem("Base.SmallTrunk2");
    elseif metal == 25 then	
	    player:getInventory():AddItem("Base.SmallTrunk3");
    elseif metal == 24 then		
	    player:getInventory():AddItem("Hydrocraft.HCComputer");
    elseif metal == 23 then	
        player:getInventory():AddItem("Hydrocraft.HCBarrelblueempty");
    elseif metal == 22 then	
        player:getInventory():AddItem("Hydrocraft.HCSteelbeam");
    elseif metal == 21 then
        player:getInventory():AddItem("Hydrocraft.HCToywagon");
    elseif metal == 20 then
        player:getInventory():AddItem("Hydrocraft.HCJunkmicro");
    elseif metal == 19 then
        player:getInventory():AddItem("Hydrocraft.HCSteelpipe");
    elseif metal == 18 then
        player:getInventory():AddItem("Hydrocraft.HCLargesheetmetal");
    elseif metal == 17 then
        player:getInventory():AddItem("Hydrocraft.HCBarrelmetalempty");
    elseif metal == 16 then
        player:getInventory():AddItem("Hydrocraft.HCJunkbicycle");
    elseif metal == 15 then
        player:getInventory():AddItem("Hydrocraft.HCSteelsheet");
    elseif metal == 14 then
        player:getInventory():AddItem("Hydrocraft.HCSteelsheetlarge");
    elseif metal == 13 then
        player:getInventory():AddItem("Hydrocraft.HCJunkmicro");
    elseif metal == 12 then
        player:getInventory():AddItem("Hydrocraft.HCFishtank");
    elseif metal == 11 then
        player:getInventory():AddItem("Hydrocraft.HCVacuum");
    elseif metal == 10 then
        player:getInventory():AddItem("Hydrocraft.HCVac");
    elseif metal == 9 then
        player:getInventory():AddItem("Hydrocraft.HCShopvac");
    elseif metal == 8 then
        player:getInventory():AddItem("Hydrocraft.HCPrinter");
    elseif metal == 7 then
        player:getInventory():AddItem("Hydrocraft.HCComputermonitor");
    elseif metal == 6 then
        player:getInventory():AddItem("Hydrocraft.HCFaxmachine");
    elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCScaner");
    elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCShoppingcart");
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCToywagon");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCIcechest");
    elseif metal == 1 then
		local tank = InventoryItemFactory.CreateItem("Base.PropaneTank")
		tank:setUsedDelta(0.0)
        player:getInventory():AddItem(tank);
    elseif metal == 0 then
        player:getInventory():AddItem("Base.EmptyPetrolCan");
    end
end

function hcjunksearchmagnet(items, result, player)
    local metal = ZombRand(10);
    
    if metal == 9 then
	    player:getInventory():AddItem("Hydrocraft.HCWaterheater");
	elseif metal == 8 then
	    player:getInventory():AddItem("Hydrocraft.HCBedsprings");
	elseif metal == 7 then
	    player:getInventory():AddItem("Hydrocraft.HCRadiator2");
	elseif metal == 6 then	
	    player:getInventory():AddItem("Hydrocraft.HCJunkdryer");
	elseif metal == 5 then
        player:getInventory():AddItem("Hydrocraft.HCJunktv");
	elseif metal == 4 then
        player:getInventory():AddItem("Hydrocraft.HCJunkfridge");	
    elseif metal == 3 then
        player:getInventory():AddItem("Hydrocraft.HCJunktredmill");
    elseif metal == 2 then
        player:getInventory():AddItem("Hydrocraft.HCJunkwash");
    elseif metal == 1 then
        player:getInventory():AddItem("Hydrocraft.HCJunkbicycle");
    elseif metal == 0 then
        player:getInventory():AddItem("Hydrocraft.HCBedsprings");
    end
    
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCBatteryhugedead");

end

-- Randomize findings for scavange.
function hcmetalsearch(items, result, player)

trash = {'Hydrocraft.HCJunkbicycle','Hydrocraft.HCHedgetrimmer','Hydrocraft.HCBottleopener','Hydrocraft.HCWirehanger','Base.ElectronicsScrap ','Hydrocraft.HCWhippedcreamcanempty','Hydrocraft.HCPop6trash','Hydrocraft.HCCannedspaghettiringsopenempty','Hydrocraft.HCCannedspaghettiringsopenempty','Hydrocraft.HCCannedmacncheeseopenempty','Hydrocraft.HCCannedgovermentporkopenempty','Hydrocraft.HCCannedfruitcocktailopenempty','Hydrocraft.HCCannedchickenbreastopenempty','Hydrocraft.HCCannedcheesesauceopenempty','Hydrocraft.HCCanbangedupopenempty','Hydrocraft.HCRustyshards','Hydrocraft.HCInkroller','Base.VideoGame','Base.JarLid','Hydrocraft.HCTincan','Hydrocraft.HCRustyshards','Hydrocraft.HCBatterysmalldead','Hydrocraft.HCBatterymediumdead','Hydrocraft.HCBatterylargedead','Base.Extinguisher','Base.Paperclip'}
good = {'Hydrocraft.HCFile','Hydrocraft.HCClothespin','Base.Nails','Base.Screws','Base.BarbedWire','Base.Wire','Base.Needle','Base.Bullets9mm','Base.ShotgunShells','Base.223Bullets','Base.308Bullets','Base.Screwdriver','Base.Hammer','Base.Saw','Base.Hinge','Base.Doorknob','Base.Pipe','Base.SheetMetal','farming.GardeningSprayEmpty','farming.WateredCan','Base.Shovel2','Base.Tweezers','Hydrocraft.HCWrench','Base.Tongs','Hydrocraft.HCPliers','Hydrocraft.HCJackknife','Base.Toolbox','Base.Rake','Hydrocraft.HCMedicalbox','Hydrocraft.HCSurvivalaxe','Hydrocraft.HCSteelpipe','Hydrocraft.HCCopperpipe','Hydrocraft.HCChickenwire','Base.Padlock','Hydrocraft.HCDrillhead','Base.PickAxe','Base.WeldingMask ','Base.BlowTorch ','Hydrocraft.HCBoxcutter','Hydrocraft.HCCalculator ','Hydrocraft.HCBatterysmall','Hydrocraft.HCBatterymedium ','Hydrocraft.HCBatterylarge ','Hydrocraft.HCBatteryhuge ','Base.Battery','Hydrocraft.HCMeatcleaver','Hydrocraft.HCMeteorite','Hydrocraft.HCIronore ','Base.CDplayer','Base.Lighter ','Hydrocraft.HCPitchfork ','Hydrocraft.HCPipebender','Hydrocraft.HCGlasscutter','Hydrocraft.HCChiselhead','Hydrocraft.HCSawcircularblade','Hydrocraft.HCSawcircularblade','Base.Jack','Base.Wrench','Base.LugWrench','Base.TirePump'}
nice = {'Hydrocraft.HCManometer','Hydrocraft.HCIroningot','Hydrocraft.HCMagnetite','Hydrocraft.HCValve','Hydrocraft.HCAuger','Hydrocraft.HCShears','Base.EngineParts','Hydrocraft.HCMagnetite','Hydrocraft.HCChain','Hydrocraft.HCDogwhistle'}
jackpot = {'Hydrocraft.HCConanSword','Hydrocraft.HCSpikedmacesteel','Hydrocraft.HCSpearsteel'}

local skill = player:getPerkLevel(Perks.PlantScavenging);
local count = 0;
local ItemNr = 0;
local luck = ZombRand(20) + skill;

if  player:getTraits():contains('Lucky') then 
luck = luck + 5;
end

if luck >= 14 then -- found nothing.

if luck <= 15  then
print ("I found trash");
for _ in pairs(trash) do count = count + 1 end
ItemNr = ZombRand(count)+1;

player:getInventory():AddItem(trash[ItemNr]);


elseif luck <= 27  then
print ("I found something usefull");
for _ in pairs(good) do count = count + 1 end
ItemNr = ZombRand(count)+1;
player:getInventory():AddItem(good[ItemNr]);

else
print ("I was very lucky");
for _ in pairs(nice) do count = count + 1 end
ItemNr = ZombRand(count)+1;
player:getInventory():AddItem(nice[ItemNr]);
end -- finding anything


-- chance to find a high end weapon
count = 0;
if luck >= 30 then
    luck = ZombRand(5);
    if  player:getTraits():contains('Lucky') then 
        luck = luck + 1;
    end
    if luck >= 5 then
        for _ in pairs(jackpot) do count = count + 1 end
        ItemNr = ZombRand(count)+1;
        print (jackpot[ItemNr]);
        player:getInventory():AddItem(jackpot[ItemNr]);
    end
end -- superlucky




end -- you will find something
end -- end of metal search