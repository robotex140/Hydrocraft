------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- 2021-12-22 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

insertItemListsInProcDistribution( "ButcherFreezer",           {                              butcherduck(1),      butcherchicken(1),      butcheranimals(1), } );
insertItemListsInProcDistribution( "ChineseKitchenFreezer",    {                              butcherduck(3),      } );
insertItemListsInProcDistribution( "ChineseKitchenFridge",     {                              butcherduck(2),      } );
insertItemListsInProcDistribution( "ButcherChicken",           {                                                   butcherchicken(1),                         } );
insertItemListsInProcDistribution( "DinerKitchenFreezer",      {                              butcherduck(0.1),    butcherchicken(0.1),                       } );
insertItemListsInProcDistribution( "StoreKitchenButcher",      {                              butcherduck(1),      butcherchicken(1),      butcheranimals(1), } );
insertItemListsInProcDistribution( "WesternKitchenButcher",    {                                                                           butcheranimals(1), } );
insertItemListsInProcDistribution( "ButcherFreezer",           {                              butcherduck(1),      butcherchicken(1),      butcheranimals(1), } );
insertItemListsInProcDistribution( "FridgeOther",              {                              butcherduck(0.05),    butcherchicken(0.05),                     } );