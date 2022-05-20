require "Items/SuburbsDistributions"
require "Items/ItemPicker"
HCSprites = {}

SuburbsDistributions = SuburbsDistributions or {}

--Ensures exisance of graphics.
HCSprites.getSprites = function()
        getTexture("media/textures/Object_HCStonepillar.png");
--Umbrella
        getTexture("Item_UmbrellaClosed.png");

        print("Textures and Sprites Loaded.");
end

local function insertTable(t1, t2)
        local n = #t1
        for i=1,#t2 do 
                t1[n+i] = t2[i]
        end
end

local crate_items = {
        "Hydrocraft.HCDogwhistle", 1,
        "Hydrocraft.HCAuger", 0.5,
        "Hydrocraft.HCBatterysmall", 1.5,
        "Hydrocraft.HCBatterymedium", 1.5,
        "Hydrocraft.HCBatterylarge", 1.5,
        "Hydrocraft.HCForklift", 0.2,
        "Hydrocraft.HCStepladder", 0.2,
        "Hydrocraft.HCScissorlift", 0.2,
        "Hydrocraft.HCBicycle", 0.8,
        "Hydrocraft.HCWeldinghose", 1.3,
        "Hydrocraft.HCWeldingtank", 1.3,
        "Hydrocraft.HCXbowbolt", 1.8,
        "Hydrocraft.HCArrow", 1.8,
        "Hydrocraft.HCSteelpipebox", 1.0,
        "Hydrocraft.HCCopperpipebox", 1.0,
        "Hydrocraft.HCPVCpipebox", 1.0,
        "Hydrocraft.HCStonepilebox", 1.0,
        "Hydrocraft.HCRedbrickbox", 1.0,
        "Hydrocraft.HCGreybrickbox", 1.0,
        "Hydrocraft.HCGreyclaybag", 1.5,
        "Hydrocraft.HCRedclaybag", 1.5,
        "Hydrocraft.HCCampingpack", 1.5,
        "Hydrocraft.HCCanteen", 1,
        "Hydrocraft.HCJackknife", 1.5,
        "Hydrocraft.HCRubberbandbox", 1,
        "Hydrocraft.HCBugnet", 1.5,
        "Hydrocraft.HCMagnifyglass", 1.5,
        "Hydrocraft.HCJar", 2,
        "Hydrocraft.HCMREbox", 0.5,
        "Hydrocraft.HCCooler", 0.5,
        "Hydrocraft.HCIcechest", 0.5,
        "Hydrocraft.HCIBC", 1.5,
        "Hydrocraft.HCChickenwire", 1.5,
        "Hydrocraft.HCWiresteel", 1.1,
        "Hydrocraft.HCMysteryseedspacket", 2,
        "Hydrocraft.HCPowercord", 1.0,
        "Hydrocraft.HCDetector", 1.1,
        "Hydrocraft.HCFramesquare", 1,
        "Hydrocraft.HCPortableminingmachine", 0.3,
        "Hydrocraft.HCDrillcordless", 1.1,
        "Hydrocraft.HCDrillhead", 1.1,
        "Hydrocraft.HCGrinderhead", 1.1,
        "Hydrocraft.HCChiselhead", 0.03,
}
insertTable(SuburbsDistributions["all"]["crate"].items, crate_items)

------------------------------------
-- Zombie Inventory Spawning --
------------------------------------

local zombie_items = {
        -- Money --
        "Hydrocraft.HCPenny", 1,
        "Hydrocraft.HCNickel", 1,
        "Hydrocraft.HCDime", 1,
        "Hydrocraft.HCQuarter", 1,
        "Hydrocraft.HCHalfdollar", 1,
        "Hydrocraft.HCDollar", 1,


        -- Weapons/Tools --
        "Base.Lighter", 1,
        "Base.Matches", 1,
        "Hydrocraft.HCSurvivalaxe", 0.06,
        "Base.Hammer", 0.3,
        "Base.Saw", 0.3,
        "Hydrocraft.HCPliers", 0.05,
        "Base.TinOpener", 0.1,
        "Hydrocraft.HCJackknife", 0.05,
        "Hydrocraft.HCBinoculars", 0.05,
        "Hydrocraft.HCMeasuringtape", 0.05,
        -- "Hydrocraft.HCCompass", 0.1,
        "Hydrocraft.HCCamera", 0.05,
        "Base.Torch", 0.1,
        "Hydrocraft.HCFlashlightoff", 0.5,
        "Hydrocraft.HCManometer", 0.04,
        "Hydrocraft.HCTrashsmall", 0.2,
        "Hydrocraft.HCFile", 0.05,
        "Hydrocraft.HCCalculator", 0.1,

        "Hydrocraft.HCMagAA12", 0.05,
        "Hydrocraft.HCAA12", 0.06,
        "Hydrocraft.HCUziSilencer", 0.05,
        "Hydrocraft.HCUzi", 0.06,
        "Hydrocraft.HCMagUZI", 0.05,
        "Hydrocraft.HCShotgunSilencer", 0.05,


        -- Clothes --
        "Hydrocraft.HCWorkgloves", 0.2,
        "Hydrocraft.HCDentures", 0.2,
        "Hydrocraft.HCEyepatch", 0.2,
        "Hydrocraft.HCHearingaid", 0.2,
        "Hydrocraft.HCGlasseye", 0.2,
        "Hydrocraft.HCProstheticleg", 0.2,

        -- Food --
        "Hydrocraft.HCTrailmix", 0.1,
        "Hydrocraft.HCEnergybar", 0.1,
        "Hydrocraft.HCGum", 0.2,
        "Hydrocraft.HCGum2", 0.2,
        "Hydrocraft.HCGum3", 0.2,
        "Hydrocraft.HCMysteryseedspacket", 0.1,
        "Hydrocraft.HCMRE", 0.2,

        -- Other --
        "Hydrocraft.HCHousefly", 0.2,
        "Hydrocraft.HCMaggot", 0.2,
        "Base.Cockroach", 0.25,
        "Base.Worm", 0.25,
        "Base.Book", 0.2,

        "Base.WaterBottleEmpty", 0.3,
        "Base.BandageDirty", 0.2,
        "Base.Headphones", 0.2,
}
--setDistributionRolls( "all", "inventoryfemale", 3 )
--setDistributionRolls( "all", "inventorymale", 3 )

--insertItemListsInDistribution( "all", "inventorymale", { zombie_items } );
--insertItemListsInDistribution( "all", "inventoryfemale", { zombie_items } );
-------------------------------
-- Fridge Inventory Spawning --
-------------------------------


----------------------------------
-- Trash Bin Inventory Spawning --
----------------------------------

local bin_items = {
        "Hydrocraft.HCPaperbag", 0.1,
        "Hydrocraft.HCPaperlunchbag", 0.1,
        "Hydrocraft.HCTincan", 5,
        "Hydrocraft.HCCardboardbox", 5,
        "Hydrocraft.HCCardboardboxstack", 0.1,
        "Hydrocraft.HCJar", 0.1,
        "Hydrocraft.HCGum", 0.5,
        "Hydrocraft.HCGum2", 0.5,
        "Hydrocraft.HCGum3", 0.5,
        "Hydrocraft.HCBubblewrap", 0.1,
        "Hydrocraft.HCBatterysmalldead", 0.03,
        "Hydrocraft.HCBatterymediumdead", 0.03,
        "Hydrocraft.HCBattery9voltdead", 0.03,
        "Hydrocraft.HCCork", 0.1,
        "Hydrocraft.HCTrashsmall", 8,
        "Hydrocraft.HCTrashmedium", 4,
        "Hydrocraft.HCTrashlarge", 3,
        "Hydrocraft.HCPillbox", 0.2,
        "Base.SheetMetal", 0.1,
        "Hydrocraft.HCEmptyjuiceboxpinklemonaid", 0.1,
        "Hydrocraft.HCEmptyjuiceboxcherry", 0.1,
        "Hydrocraft.HCEmptyjuiceboxorange", 0.1,
        "Hydrocraft.HCEmptyjuiceboxlemonaid", 0.1,
        "Hydrocraft.HCEmptyjuiceboxapple", 0.1,
        "Hydrocraft.HCEmptyjuiceboxbluerazzberry", 0.1,
        "Hydrocraft.HCEmptyjuiceboxgrape", 0.1,
        "Hydrocraft.HCElectronicpartsbroken", 0.1,
        "Hydrocraft.HCChemicalbottleempty", 0.1,
        "Hydrocraft.HCPlasticcanempty", 0.1,
        "Hydrocraft.HCAmmoniacanempty", 0.1,
        -- "Hydrocraft.HCDetergentempty", 0.1,
        "Hydrocraft.HCPlasticcanempty", 0.1,
        "Hydrocraft.HCPoisonempty", 0.1,
        "Hydrocraft.HCSulfuricacidcanempty", 0.1,
        "Hydrocraft.HCTrashbottle", 0.1,
        "Hydrocraft.HCUHTmilkempty", 0.1,
        "Hydrocraft.HCLabelempty", 0.1,
        "Hydrocraft.HCGlassbottleempty", 0.1,
        "Hydrocraft.HCPaintcan", 0.1,
        "Hydrocraft.HCCrispstrash", 0.1,
        "Hydrocraft.HCCrisps2trash", 0.1,
        "Hydrocraft.HCCrisps3trash", 0.1,
        "Hydrocraft.HCCrisps4trash", 0.1,
        "Hydrocraft.HCCrisps5trash", 0.1,
        "Hydrocraft.HCCrisps6trash", 0.1,
        "Hydrocraft.HCCrisps7trash", 0.1,
        "Hydrocraft.HCCrisps8trash", 0.1,
        "Hydrocraft.HCCrisps9trash", 0.1,
        "Hydrocraft.HCEnergydrinktrash", 0.1,
        "Hydrocraft.HCEnergydrink2trash", 0.1,
        "Hydrocraft.HCCandycorntrash", 0.1,
        "Hydrocraft.HCCandymnmtrash", 0.1,
        "Hydrocraft.HCCandyrainbowtrash", 0.1,
        "Hydrocraft.HCGummybearstrash", 0.1,
        "Hydrocraft.HCGummywormstrash", 0.1,
        "Hydrocraft.HCJellybeanstrash", 0.1,
        "Hydrocraft.HCTaffytrash", 0.1,
        "Hydrocraft.HCGumtrash", 0.1,
        "Hydrocraft.HCGum2trash", 0.1,
        "Hydrocraft.HCGum3trash", 0.1,
        "Hydrocraft.HCGumsticktrash", 0.1,
        "Hydrocraft.HCCannedcornedbeefempty", 0.1,
        "Hydrocraft.HCCannedcornempty", 0.1,
        "Hydrocraft.HCCannedmushroomsoupempty", 0.1,
        "Hydrocraft.HCCannedpeasempty", 0.1,
        "Hydrocraft.HCCannedpotatoempty", 0.1,
        "Hydrocraft.HCCannedsardinesempty", 0.1,
        "Hydrocraft.HCCannedtomatoempty", 0.1,
        "Hydrocraft.HCCannedcarrotsempty", 0.1,
        "Hydrocraft.HCBeansempty", 0.1,
        "Hydrocraft.HCTinnedsoupempty", 0.1,
        "Hydrocraft.HCTunatinempty", 0.1,
        "Hydrocraft.HCDogfoodempty", 0.1,
        "Hydrocraft.HCCannedbologneseempty", 0.1,
        "Hydrocraft.HCCannedchiliempty", 0.1,
        "Hydrocraft.HCCannedsoupclassicempty", 0.1,
        "Hydrocraft.HCCannedappleempty", 0.1,
        "Hydrocraft.HCCannedpearempty", 0.1,
        "Hydrocraft.HCCannedpeachempty", 0.1,
        "Hydrocraft.HCCannedgreenbeansempty", 0.1,
        "Hydrocraft.HCCannedmushroomsempty", 0.1,
        "Hydrocraft.HCCannedpumpkinempty", 0.1,
        "Hydrocraft.HCCannedspamempty", 0.1,
        "Hydrocraft.HCCannedcranberriesempty", 0.1,
        "Hydrocraft.HCCannedpineappleempty", 0.1,
        "Hydrocraft.HCCannedrefriedbeansempty", 0.1,
        "Hydrocraft.HCPoptrash", 0.1,
        "Hydrocraft.HCChocolatetrash", 0.1,
        "Hydrocraft.HCChocolatedarktrash", 0.1,
        "Hydrocraft.HCChocolatewhitetrash", 0.1,
        "Hydrocraft.HCTrailmixtrash", 0.1,
        "Hydrocraft.HCPeanutbutterjarempty", 0.1,
        "Hydrocraft.HCScotchtapeempty", 0.1,
        "Hydrocraft.HCWoodglueempty", 0.1,
        "Hydrocraft.HCGlueempty", 0.5,
        "Hydrocraft.HCVinegarempty", 0.1,
        "Hydrocraft.HCSugarempty", 0.1,
        "Hydrocraft.HCRiceempty", 0.1,
        "Hydrocraft.HCFlourempty", 0.1,
        "Hydrocraft.HCOatsempty", 0.1,
        "Hydrocraft.HCCerealtrash", 0.1,
        "Hydrocraft.HCIcecreamempty", 0.1,
        "Hydrocraft.HCYoghurtempty", 0.1,
        "Hydrocraft.HCMilkempty", 0.1,
        "Hydrocraft.HCKetchupempty", 0.1,
        "Hydrocraft.HCMustardempty", 0.1,
        "Hydrocraft.HCTVDinnerpackage", 0.1,
        "Hydrocraft.HCMintcandytrash", 0.1,
        "Hydrocraft.HCShieldtrashcanlid", 0.1,
        "Hydrocraft.HCEyedropperbottle", 0.1,
        "Hydrocraft.HCNapkindirty", 0.5,
        "Hydrocraft.HCPlasticstraw", 0.1,
        "Hydrocraft.HCGlassjug", 0.1,
        "Hydrocraft.HCGlassshards", 0.1,
        "Hydrocraft.HCRustyshards", 0.1,
        "Hydrocraft.HCBeercan", 0.1,
--         "Hydrocraft.HCBabyfoodjar", 0.01,
        "Hydrocraft.HCCanbangedupopenempty", 0.1,
        "Hydrocraft.HCCannedcheesesauceopenempty", 0.1,
        "Hydrocraft.HCCannedchickenbreastopenempty", 0.1,
        "Hydrocraft.HCCannedfruitcocktailopenempty", 0.1,
        "Hydrocraft.HCCannedgovermentbeefopenempty", 0.1,
        "Hydrocraft.HCCannedgovermentbreadopenempty", 0.1,
        "Hydrocraft.HCCannedgovermentchickenopenempty", 0.1,
        "Hydrocraft.HCCannedgovermentporkopenempty", 0.1,
        "Hydrocraft.HCCannedmacncheeseopenempty", 0.1,
        "Hydrocraft.HCCannedpiefillingappleopenempty", 0.1,
        "Hydrocraft.HCCannedpiefillingcherryopenempty", 0.1,
        "Hydrocraft.HCCannedpiefillingblueberryopenempty", 0.1,
        "Hydrocraft.HCCannedravioliopenempty", 0.1,
        "Hydrocraft.HCCannedspaghettiringsopenempty", 0.1,
        "Hydrocraft.HCRamenchickentrash", 0.1,
        "Hydrocraft.HCRamenbeeftrash", 0.1,
        "Hydrocraft.HCRamenshrimptrash", 0.1,
        "Hydrocraft.HCRamencheesetrash", 0.1,
        "Hydrocraft.HCWhippedcreamcanempty", 0.1,
        "Hydrocraft.HCPuddingcupempty", 0.1,
        "Hydrocraft.HCCookieschocolatechipbagtrash", 0.1,
        "Hydrocraft.HCCookiesmintbagtrash", 0.1,
        "Hydrocraft.HCCookiesbrowniebagtrash", 0.1,
        "Hydrocraft.HCMilkjugempty", 0.1,
        "Hydrocraft.HCMilkjugchocolateempty", 0.1,
        "Hydrocraft.HCEvaporatedmilkopenempty", 0.1,
        "Hydrocraft.HCCereal2trash", 0.1,
        "Hydrocraft.HCCereal3trash", 0.1,
}
insertItemListsInDistribution( "all", "bin", { bin_items } );


---------------------------------
-- Post Box Inventory Spawning --
---------------------------------

local post_box_items = {
        "Hydrocraft.HCSealedletter", 5,
        --"Hydrocraft.HCSealedletter2", 5,
        --"Hydrocraft.HCSealedletter3", 5,
        --"Hydrocraft.HCSealedletter4", 5,
        --"Hydrocraft.HCSealedletter5", 5,
        --"Hydrocraft.HCSealedletter6", 5,
        --"Hydrocraft.HCSealedletter7", 5,
        "Hydrocraft.HCPostcard1", 1,
        "Hydrocraft.HCPostcard2", 1,
        "Hydrocraft.HCPostcard3", 1,
        "Hydrocraft.HCPostcard4", 1,
        "Hydrocraft.HCPostcard5", 1,
        "Hydrocraft.HCPostcard6", 1,
        "Hydrocraft.HCPostcard7", 1,
        "Hydrocraft.HCPostcard8", 1,
        "Hydrocraft.HCSportsmagazine", 1,
        "Hydrocraft.HCSportsmagazine2", 1,
}
insertItemListsInDistribution( "all", "postbox", { post_box_items } );

---------------------------------------
-- "All" Category Inventory Spawning --
---------------------------------------

-- Metal Shelves --
local all_items = {
        "Hydrocraft.HCHotgluestickbox", 0.1,
        "Hydrocraft.HCHotgluestick", 0.1,
        "Hydrocraft.HCHotgluegun", 0.1,
        "Hydrocraft.UmbrellaClosed", 2,
        "Hydrocraft.HCWorkgloves", 0.1,
        "Hydrocraft.HCPliers", 0.1,
        "Hydrocraft.HCFunnel", 0.1,
        "Hydrocraft.HCWrench", 0.1,
        "Hydrocraft.HCAuger", 0.1,
        "Hydrocraft.HCSteelpipe", 0.1,
        "Hydrocraft.HCCopperpipe", 0.1,
        "Hydrocraft.HCBinoculars", 0.1,
        "Hydrocraft.HCAirfreshener", 0.01,
        "Hydrocraft.HCGardenhose", 0.04,
        "Hydrocraft.HCWeldinghose", 0.1,
        "Hydrocraft.HCWeldingtank", 0.1,
        "Base.BlowTorch", 0.1,
        "Hydrocraft.HCCane", 0.1,
        "Hydrocraft.HCCanteen", 0.1,
        "Hydrocraft.HCFuelcanister", 0.1,
        "Hydrocraft.HCNailgunammo", 0.1,
        "Hydrocraft.HCNailgunammobox", 0.1,
         "Hydrocraft.HCNailgun", 0.01,
        "Hydrocraft.HCShopvac", 0.1,
        "Hydrocraft.HCToolbox", 0.1,
         "Hydrocraft.HCWoodentoolbox", 0.01,
        "Hydrocraft.HCCardboardbox", 0.05,
         "Hydrocraft.HCCardboardboxstack", 0.01,
        "Hydrocraft.HCWoodencrate", 0.5,
        "Hydrocraft.HCRubberbandbox", 0.1,
        "Hydrocraft.HCMeasuringtape", 0.1,
        "Hydrocraft.HCGreyclaybag", 0.1,
        "Hydrocraft.HCRedclaybag", 0.1,
        "Hydrocraft.HCBungeecord", 0.1,
        "Hydrocraft.HCAluminiumbat", 0.1,
        "Hydrocraft.HCJar", 0.1,
        "Hydrocraft.HCMetalbox", 0.1,
        "Hydrocraft.HCFlashlightoff", 0.1,
        "Hydrocraft.HCFlashlightbulbred", 0.1,
        "Hydrocraft.HCRopethick", 0.1,
        "Hydrocraft.HCHardhat", 0.1,
        "Hydrocraft.HCChisel", 0.1,
        "Hydrocraft.HCDogwhistle", 0.3,
        "Hydrocraft.HCMasontrowel", 0.1,
        "Hydrocraft.HCBubblewrap", 0.1,
        "Hydrocraft.HCBoxcutter", 0.1,
        "Hydrocraft.HCDustpan", 0.1,
        "Hydrocraft.HCPlasticbin2", 0.1,
        "Hydrocraft.HCSafetyglasses", 0.1,
        "Hydrocraft.HCBatterysmall", 0.1,
        "Hydrocraft.HCBatterymedium", 0.1,
        "Hydrocraft.HCBatterylarge", 0.1,
        "Hydrocraft.HCBattery9volt", 0.1,
        "Hydrocraft.HCChickenwire", 0.1,
        "Hydrocraft.HCWiresteel", 0.1,
        "Hydrocraft.HCMysteryseedspacket", 0.1,
        "Hydrocraft.HCIBC", 0.1,
        "Hydrocraft.HCPowercord", 0.1,
        "Hydrocraft.HCDetector", 0.1,
        "Base.SheetMetal", 0.1,
        "Hydrocraft.HCFramesquare", 0.1,
        "Hydrocraft.HCPortableminingmachine", 0.1,
        "Hydrocraft.HCDrillcordless", 0.1,
        "Hydrocraft.HCDrillhead", 0.1,
        "Hydrocraft.HCGrinderhead", 0.1,
         "Hydrocraft.HCChiselhead", 0.01,
        "Hydrocraft.HCElectrictape", 0.1,
        "Hydrocraft.HCMaskingtape", 0.1,
        "Hydrocraft.HCPackingtape", 0.1,
        "Hydrocraft.HCSuperglue", 0.1,
        "Hydrocraft.HCRubbercement", 0.1,
        "Hydrocraft.HCSolder", 0.1,
        "Hydrocraft.HCSoldergun", 0.1,
        "Hydrocraft.HCValve", 0.1,
        "Hydrocraft.HCBoltbox", 0.1,
        "Hydrocraft.HCNutbox", 0.1,
        "Hydrocraft.HCResistorbox", 0.1,
        "Hydrocraft.HCSawmetal", 0.1,
        "Hydrocraft.HCGlasscutter", 0.1,
        "Hydrocraft.HCPipebender", 0.1,
        "Hydrocraft.HCTerminalstrip", 0.1,
        "Hydrocraft.HCElectronicpartsbroken", 0.1,
        "Hydrocraft.HCElectronicparts04", 0.1,
        "Hydrocraft.HCElectronicparts03", 0.1,
        "Hydrocraft.HCElectronicparts02", 0.1,
        "Hydrocraft.HCElectronicparts01", 0.1,
        "Hydrocraft.HCElectricmultitooloff", 0.1,
        "Hydrocraft.HCElectricmultitoolsaw", 0.1,
        "Hydrocraft.HCElectricmultitooldrillhead", 0.1,
        "Hydrocraft.HCColoredwire", 0.1,
        "Hydrocraft.HCChemicalbottlesodiumhydroxide", 0.5,
        "Hydrocraft.HCMagazineelectronics01", 0.1,
        "Hydrocraft.HCMagazineelectronics02", 0.1,
        "Hydrocraft.HCMagazineelectronics03", 0.1,
        "Hydrocraft.HCSolidfuelbox", 0.03,
        "Hydrocraft.HCWireconcertina", 0.1,
        "Base.Tongs", 0.1,
        "Hydrocraft.HCFlorescentlightbox", 0.1,
        "Hydrocraft.HCFlorescentlightbulb", 0.1,
        "Hydrocraft.HCFile", 0.1,
}
insertItemListsInDistribution( "all", "metal_shelves", { all_items } );

-- Add items for Vending Snack Machine
local vendingsnack_items = {
        "Hydrocraft.HCChocolatewhite", 1,
        "Hydrocraft.HCChocolatedark", 1,
        "Hydrocraft.HCTrailmix", 1,
        "Hydrocraft.HCEnergybar", 1,
        "Hydrocraft.HCGum", 1,
        "Hydrocraft.HCGum2", 1,
        "Hydrocraft.HCGum3", 1,
        "Hydrocraft.HCCandycorn", 1,
        "Hydrocraft.HCCandymnm", 1,
        "Hydrocraft.HCCandyrainbow", 1,
        "Hydrocraft.HCGummybears", 1,
        "Hydrocraft.HCGummyworms", 1,
        "Hydrocraft.HCJellybeans", 1,
        "Hydrocraft.HCTaffy", 1,
        "Hydrocraft.HCPumpkinseedsnack", 1,
        "Hydrocraft.HCSunflowerseedsnack", 1,
        "Hydrocraft.HCCrisps5", 1,
        "Hydrocraft.HCCrisps6", 1,
        "Hydrocraft.HCCrisps7", 1,
        "Hydrocraft.HCCrisps8", 1,
        "Hydrocraft.HCCrisps9", 1,
        "Hydrocraft.HCCookieschocolatechipbag", 1,
        "Hydrocraft.HCCookiesmintbag", 1,
        "Hydrocraft.HCCookiesbrowniebag", 1,
}
insertItemListsInDistribution( "all", "vendingsnack", { vendingsnack_items } );
-- Add items for Vending Pop Machine
local vendingpop_items = {
        "Hydrocraft.HCPop4", 1,
        "Hydrocraft.HCPop5", 1,
        "Hydrocraft.HCSodacherry", 1,
        "Hydrocraft.HCSodacola", 1,
        "Hydrocraft.HCSodacream", 1,
        "Hydrocraft.HCSodadrpepper", 1,
        "Hydrocraft.HCSodagingerale", 1,
        "Hydrocraft.HCSodagrape", 1,
        "Hydrocraft.HCSodagrapefruit", 1,
        "Hydrocraft.HCSodalemonlime", 1,
        "Hydrocraft.HCSodapineapple", 1,
        "Hydrocraft.HCSodarootbeer", 1,
        "Hydrocraft.HCEnergydrink", 1,
        "Hydrocraft.HCEnergydrink2", 1,
        "Hydrocraft.HCWaterbottleapplejuice", 1,
        "Hydrocraft.HCWaterbottlegrapejuice", 1,
        "Hydrocraft.HCWaterbottleorangejuice", 1,
}
insertItemListsInDistribution( "all", "vendingpop", { vendingpop_items } );


-- Add items for Corn
local corn_items = {
        "Hydrocraft.HCRabbitmale", 1,
        "Hydrocraft.HCRabbitfemale", 1,
}
-- insertItemListsInDistribution( "all", "corn", { corn_items } );
-- -- Add items for Blackberry Bush
-- insertItemListsInDistribution( "all", "fruitbusha", { corn_items } );
-- -- Add items for Blueberry Bush
-- insertItemListsInDistribution( "all", "fruitbushb", { corn_items } );


-- Add items for Camping Pack
SuburbsDistributions["HCCampingpack"] = {
        rolls = 2,
        items = {
                "Base.Lighter", 1,
                "Base.Matches", 1,
                "Base.FirstAidKit", 1,
                "Hydrocraft.HCBinoculars", 1,
                -- "Hydrocraft.HCCompass", 1,
                -- "Hydrocraft.HCMap", 1,
                "Hydrocraft.HCCanteen", 0.2,
                "Hydrocraft.HCMagnesiumstriker", 0.5,
                "Hydrocraft.HCPurifyingtabletsbox", 0.3,
                "Hydrocraft.HCJackknife", 0.2,
                "Hydrocraft.HCEnergybar", 1,
                "Hydrocraft.HCTrailmix", 1,
                "Hydrocraft.HCMRE", 1,
                "camping.CampingTentKit", 1,
        },
        fillRand = 5,
};

-- Add items for Climbing Pack
SuburbsDistributions["HCClimbingpack"] = {
        rolls = 2,
        items = {
                "Base.Rope", 1,
                "Hydrocraft.HCRopethin", 1,
                "Hydrocraft.HCRopethick", 1,
        },
        fillRand = 5,
};

-- Add items for Prepper Bag
SuburbsDistributions["HCPrepperbag"] = {
        rolls = 2,
        items = {
                "Hydrocraft.HCAdultmagazine", 1,
                "Hydrocraft.HCMysteryseedspacket", 1,
                -- "Hydrocraft.HCGPS", 1,
                "Hydrocraft.HCSurvivalaxe", 1,
                "Base.Machete", 1,
                "Hydrocraft.HCMREbox", 1,
                "Hydrocraft.HCDetector", 1,
        },
        fillRand = 5,
};

-- Add items for Paper Lunch Bag
SuburbsDistributions["HCPaperlunchbag"] = {
        rolls = 1,
        items = {
                "Base.Apple", 1,
                "Base.Banana", 1,
                "Base.Orange", 1,
                "Base.Crisps", 1,
                "Hydrocraft.HCJuiceboxapple", 1,
                "Hydrocraft.HCPeanutjellysandwich", 1,
        },
        fillRand = 0,
};

-- Add items for Lunch Box
SuburbsDistributions["HCLunchbox"] = {
        rolls = 1,
        items = {
                "Base.Apple", 1,
                "Base.Banana", 1,
                "Base.Orange", 1,
                "Base.Crisps", 1,
                "Hydrocraft.HCJuiceboxapple", 1,
                "Hydrocraft.HCPeanutjellysandwich", 1,
        },
        fillRand = 0,
};

-- Add items for Briefcase
SuburbsDistributions["HCBriefcase"] = {
        rolls = 2,
        items = {
                "Base.Pen", 1,
                "Base.Pencil", 1,
                "Base.LetterOpener", 1,
                "Base.Scissors", 1,
                "Base.Eraser", 1,
                "Base.SheetPaper", 1,
                "Base.SheetPaper", 1,
                "Base.SheetPaper", 1,
                "Hydrocraft.HCPencilbox", 1,
                "Hydrocraft.HCPenbox", 1,
                "Hydrocraft.HCPostitpad", 1,
                "Hydrocraft.HCCalculator", 1,
                "Hydrocraft.HCRubberbandbox", 1,
                "Hydrocraft.HCBinderclip", 1,
                "Hydrocraft.HCClipboard", 1,
                "Hydrocraft.HCWhiteout", 1,
                "Hydrocraft.HCThumbtack", 1,
                "Hydrocraft.HCHighlighter", 1,
                "Hydrocraft.HCRuler", 1,
                "Hydrocraft.HCStapleremover", 1,
                "Hydrocraft.HCFolder", 1,
                "Hydrocraft.HCFolder2", 1,
                "Hydrocraft.HCManilaenvelope", 1,
                "Hydrocraft.HCManilaenvelope2", 1,
                "Hydrocraft.HCStamp", 1,
        },
        fillRand = 5,
};

-- Add items for Medical Bag
SuburbsDistributions["HCMedicalbag"] = {
        rolls = 1,
        items = {
                "Base.FirstAidKit", 50,
                "Hydrocraft.HCStethoscope", 50,
                "Hydrocraft.HCSphygmomanometer", 50,
                "Hydrocraft.HCHeadmirror", 50,
                "Hydrocraft.HCThermometer", 50,
                "Hydrocraft.HCTonguedepressor", 50,
                "Hydrocraft.HCBonesaw", 50,
                "Hydrocraft.HCGiglisaw", 50,
                "Hydrocraft.HCSyringeempty", 50,
                "Base.Scalpel", 50,
                "Hydrocraft.HCForeceps", 50,
                "Hydrocraft.HCCrutch", 10,
                "Hydrocraft.HCCrutchaluminium", 10,
                "Hydrocraft.HCGauze", 10,
                "Hydrocraft.HCInhaler", 10,
                "Hydrocraft.HCSpaceblanket", 10,
                "Hydrocraft.HCEyedropperbottleiodine", 10,
                "Hydrocraft.HCEyedropperbottleeardrops", 10,
                "Hydrocraft.HCEyedropperbottleyedrops", 10,
                "Hydrocraft.HCCoughsyrup", 10,
                "Hydrocraft.HCCaffeinebox", 10,
                "Hydrocraft.HCEphedrinebox", 10,
        },
        fillRand = 0,
};

-- Add items for Medical Box
SuburbsDistributions["HCMedicalbox"] = {
        rolls = 1,
        items = {
                "Base.FirstAidKit", 50,
                "Hydrocraft.HCStethoscope", 50,
                "Hydrocraft.HCHeadmirror", 50,
                "Hydrocraft.HCThermometer", 50,
                "Hydrocraft.HCTonguedepressor", 10,
                "Hydrocraft.HCSyringeempty", 50,
                "Base.Scalpel", 10,
                "Hydrocraft.HCGauze", 20,
                "Hydrocraft.HCInhaler", 5,
                "Hydrocraft.HCEyedropperbottleiodine", 10,
                "Hydrocraft.HCEyedropperbottleeardrops", 10,
                "Hydrocraft.HCEyedropperbottleyedrops", 10,
                "Hydrocraft.HCCoughsyrup", 10,
                "Hydrocraft.HCCaffeinebox", 10,
                "Hydrocraft.HCEphedrinebox", 10,
--                 "Hydrocraft.HCGlassbottlephenyl", 0.01,
--                 "Hydrocraft.HCGlassbottlemethylamin", 0.01,
        },
        fillRand = 0,
};

-- Add items for Golf Bag
SuburbsDistributions["HCGolfbag"] = {
        rolls = 1,
        items = {
                "Base.Golfclub", 50,
                "Base.GolfBall", 50,
        },
        fillRand = 0,
};

-- Add items for Cosmetic Case
SuburbsDistributions["HCCosmeticcase"] = {
        rolls = 1,
        items = {
                "Base.Lipstick", 50,
                "Base.MakeupEyeshadow", 50,
                "Base.MakeupFoundation", 50,
                "Base.Comb", 50,
                "Base.Hairspray", 50,
                "Base.Mirror", 50,
                "Base.Perfume", 10,
                "Base.CottonBalls", 10,
                "Base.Tissue", 10,
                "Hydrocraft.HCTissuebox", 10,
                "Hydrocraft.HCChapstick", 10,
                "Hydrocraft.HCQtip", 10,
                "Hydrocraft.HCQtipbox", 10,
                "Hydrocraft.HCHairgel", 10,
        },
        fillRand = 0,
};

-- Add items for Metal Tool Box
SuburbsDistributions["HCToolbox"] = {
        rolls = 1,
        items = {
                "Base.Hammer", 50,
                "Base.Saw", 50,
                "Base.Screwdriver", 50,
                "Base.NailsBox", 20,
                "Base.ScrewsBox", 20,
                "Base.DuctTape", 20,
                "Base.Glue", 20,
                "Base.Woodglue", 20,
                "Hydrocraft.HCMasontrowel", 10,
                "Hydrocraft.HCPliers", 10,
                "Hydrocraft.HCMeasuringtape", 10,
                "Hydrocraft.HCSafetyglasses", 10,
                "Hydrocraft.HCFramesquare", 10,
                "Hydrocraft.HCNailgun", 10,
                "Hydrocraft.HCNailgunammobox", 10,
                "Hydrocraft.HCWrench", 10,
                "Hydrocraft.HCFunnel", 10,
                "Hydrocraft.HCSuperglue", 10,
                "Hydrocraft.HCRubbercement", 10,
                "Hydrocraft.HCMaskingtape", 10,
                "Hydrocraft.HCElectrictape", 10,
                "Hydrocraft.HCDrillcordless", 10,
        },
        fillRand = 5,
};

-- Add items for Fishing Tackle Box
SuburbsDistributions["HCFishingbox"] = {
        rolls = 1,
        items = {
                "Base.FishingTackle", 50,
                "Base.FishingTackle2", 50,
                "Base.FishingRod", 50,
                "Base.FishingLine", 50,
                "Base.FishingNet", 10,
                "Base.Worm", 50,
        },
        fillRand = 0,
};

-- Add items for Shoe Box
SuburbsDistributions["HCShoebox"] = {
        rolls = 1,
        items = {
                "Base.Shoes", 50,
                "Hydrocraft.HCBoots", 50,
                "Hydrocraft.HCFlipflops", 50,
                "Hydrocraft.HCCleats", 50,
                "Hydrocraft.HCBootconstruction", 50,
        },
        fillRand = 0,
};

-- Add items for Mail Bag
SuburbsDistributions["HCMailbag"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCSealedletter", 50,
                --"Hydrocraft.HCSealedletter2", 50,
                --"Hydrocraft.HCSealedletter3", 50,
                --"Hydrocraft.HCSealedletter4", 50,
                --"Hydrocraft.HCSealedletter5", 50,
                --"Hydrocraft.HCSealedletter6", 50,
                --"Hydrocraft.HCSealedletter7", 50,
        },
        fillRand = 0,
};

-- Add items for Pizza Delivery Bag
SuburbsDistributions["HCPizzadeliverybag"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCBoringpizza", 50,
                "Hydrocraft.HCSimplepizza", 50,
                "Hydrocraft.HCTastypizza", 50,
        },
        fillRand = 0,
};

-- Add items for Medium Animal Cage
SuburbsDistributions["HCAnimalcage"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCRabbitmale", 20,
                "Hydrocraft.HCRabbitfemale", 20,
                "Hydrocraft.HCRabbitpoop", 30,
                "Hydrocraft.HCCatpoop", 30,
                "Hydrocraft.HCCatmale", 10,
                "Hydrocraft.HCCatfemale", 10,
                "Hydrocraft.HCCatblackmale", 10,
                "Hydrocraft.HCCatblackfemale", 10,
                "Hydrocraft.HCCatbluemale", 10,
                "Hydrocraft.HCCatbluefemale", 10,
                "Hydrocraft.HCCatbrownmale", 10,
                "Hydrocraft.HCCatbrownfemale", 10,
                "Hydrocraft.HCCatcreammale", 10,
                "Hydrocraft.HCCatcreamfemale", 10,
                "Hydrocraft.HCCatgingermale", 10,
                "Hydrocraft.HCCatgingerfemale", 10,
                "Hydrocraft.HCCatsilvermale", 10,
                "Hydrocraft.HCCatsilverfemale", 10,
                "Hydrocraft.HCCatwhitemale", 10,
                "Hydrocraft.HCCatwhitefemale", 10,
        },
        fillRand = 0,
};

-- Add items for Small Animal Cage
SuburbsDistributions["HCAnimalcagesmall"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCHamstermale", 10,
                "Hydrocraft.HCHamsterfemale", 10,
                "Hydrocraft.HCHamsterpoop", 50,
        },
        fillRand = 0,
};

-- Add items for Cigar Box
SuburbsDistributions["HCCigarbox"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCCigar", 50,
                "Hydrocraft.HCCigar", 50,
                "Hydrocraft.HCCigar", 50,
        },
        fillRand = 0,
};

-- Add items for Spiffos Order Bag
SuburbsDistributions["HCSpiffosorderbag"] = {
        rolls = 1,
        items = {
                "Hydrocraft.HCSpiffoburger", 50,
                "Hydrocraft.HCSpiffoscheesefries", 50,
                "Base.Burger", 50,
                "Base.Fries", 50,
                "Hydrocraft.HCNapkin", 10,
                "Hydrocraft.HCSpork", 10,
                "Base.Spiffo", 1,
        },
        fillRand = 0,
};

-- Add items for Fort Knox
SuburbsDistributions["fortknox"] = {
        all ={
                rolls = 3,
                items = {
                        "Hydrocraft.HCGoldingot", 50,
                        "Hydrocraft.HCGoldingot", 50,
                        "Hydrocraft.HCGoldingot", 50,
                }
        },
};

-- Add items for Pet Shop
SuburbsDistributions["petshop"] = {
        all ={
                rolls = 4,
                items = {
                        "Base.Dogfood", 1,
                        "Base.CatToy", 1,
                        "Base.DogChew", 1,
                        "Base.WaterDish", 1,
                        "Hydrocraft.HCCatlitter", 1,
                        "Hydrocraft.HCDogkibble", 1,
                        "Hydrocraft.HCCatfood", 1,
                        "Hydrocraft.HCRodentfood", 1,
                        "Hydrocraft.HCRodentfood2", 1,
                        "Hydrocraft.HCBirdfoodbox", 1,
                        "Hydrocraft.HCBirdfoodbag", 1,
                        "Hydrocraft.HCDogbowl", 1,
                        "Hydrocraft.HCFishfood", 1,
                        "Hydrocraft.HCFishfood2", 1,
                        "Hydrocraft.HCFishbowl", 1,
                        "Hydrocraft.HCFishtank", 1,
                        "Hydrocraft.HCBirdfeeder", 1,
                        "Hydrocraft.HCPetcone", 1,
                        "Hydrocraft.HCDogwhistle", 1,
                        "Hydrocraft.HCRubberball", 1,
                }
        },
};


Events.OnPreMapLoad.Add(HCSprites.getSprites);

