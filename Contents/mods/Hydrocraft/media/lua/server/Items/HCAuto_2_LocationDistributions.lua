------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- 2021-12-22 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "CarSupplyTools",        {                              car(1),      carjunk(1),      bicyle(1), } );
insertItemListsInProcDistribution( "CarSupplyTools",           {                              car(1),                                      } );
insertItemListsInProcDistribution( "GardenStoreMisc",          {                                           carjunk(1),                     } );
insertItemListsInProcDistribution( "GarageTools",              {                              car(1),      carjunk(0.1),      bicyle(0.1), } );
insertItemListsInProcDistribution( "GardenStoreTools",         {                                           carjunk(0.1),      bicyle(1),   } );
insertItemListsInProcDistribution( "MechanicShelfTools",       {                              car(1),      carjunk(0.1),      bicyle(1),   } );
insertItemListsInProcDistribution( "GarageMechanics",          {                              car(1),      carjunk(0.1),      bicyle(1),   } );
insertItemListsInProcDistribution( "CrateMechanics",           {                              car(1),      carjunk(0.1),      bicyle(1),   } );
insertItemListsInProcDistribution( "PoliceDesk",               {                                           carjunk(3),                     } );
insertItemListsInProcDistribution( "MechanicShelfMisc",        {                              car(1),      carjunk(0.1),      bicyle(1),   } );

