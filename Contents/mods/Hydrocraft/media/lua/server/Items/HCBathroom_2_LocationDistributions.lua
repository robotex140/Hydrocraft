------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- 2021-12-22 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "BathroomCounter",        { bathjunk(1), bathhair(1), bathtools(1), bathmen(1), bathwomen(1),  bathbaby(1), bathtooth(1),bathunassign(1), } );
insertItemListsInProcDistribution( "BathroomCounter",           { bathjunk(1), bathhair(1), bathtools(1), bathmen(1), bathwomen(1),  bathbaby(1), bathtooth(1),bathunassign(1),  } );
insertItemListsInProcDistribution( "StoreShelfMedical",         {                                                                    bathbaby(1),              bathunassign(0.5),  } );
insertItemListsInProcDistribution( "MedicalStorageTools",       {                                                                                              bathunassign(5), } );
insertItemListsInProcDistribution( "BathroomCabinet",           { bathjunk(1), bathhair(1), bathtools(1), bathmen(1), bathwomen(1),  bathbaby(1), bathtooth(1),bathunassign(1),  } );
insertItemListsInProcDistribution( "BathroomCounterNoMeds",     { bathjunk(1), bathhair(1), bathtools(1), bathmen(1), bathwomen(1),  bathbaby(1), bathtooth(1),bathunassign(1),  } );
insertItemListsInProcDistribution( "SalonShelfHaircare",        {              bathhair(1), bathtools(1)                                                                         } );
insertItemListsInProcDistribution( "CrateSalonSupplies",        {              bathhair(1), bathtools(1)                                                                         } );
insertItemListsInProcDistribution( "PharmacyCosmetics",         {              bathhair(1), bathtools(1), bathmen(1), bathwomen(1),                                              } );
insertItemListsInProcDistribution( "SalonShelfHaircare",        {              bathhair(1), bathtools(1)                                                                         } );
insertItemListsInProcDistribution( "SalonShelfTowels",          {                           bathtools(1),                                                       bathunassign(1), } );
insertItemListsInProcDistribution( "SalonCounter",              {              bathhair(1), bathtools(1),                                                        bathunassign(1), } );