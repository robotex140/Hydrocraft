------------------------------------------------------------ 
--- Adds relative distributions to the  different locations
--- 2021-11-17 by lorgalis
------------------------------------------------------------
require "Items/ProceduralDistributions";
require "HCDistributionFunctions";
require "Items/HCLoot_1_RelativeDistributions";

createProcDistributionContainer("storageunit","crate",         "HCCrateLootBoxes");
createProcDistributionContainer("storageunit","metal_shelves", "HCCrateLootShelves");
insertItemListsInProcDistribution( "HCCrateLootBoxes", {           lootboxes(10),  } );
insertItemListsInProcDistribution( "HCCrateLootShelves", {         lootboxes(1),   } );
