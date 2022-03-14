------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

SuburbsDistributions = SuburbsDistributions or {}

-- insertItemListsInSuburbsDistributions("officedrawers",          {                                                                               office(1), } );
-- insertItemListsInSuburbsDistributions("metal_shelves",          {           animal(0.5), children(0.2)          ,electronics(1), language(0.5), office(0.5), other(0.5), religious(0.5), school(0.5),  } );


insertItemListsInProcDistribution( "OfficeDesk",                {                                                                               office(1), } );
insertItemListsInProcDistribution( "GigamartToys",              {                        children(1), comics(1), } );
insertItemListsInProcDistribution( "Locker",                    { adult(1),                           comics(10),                                                                                   sport(1), } );
insertItemListsInProcDistribution( "ClassroomDesk",             {                                     comics(1),                                                                         school(3), } );
insertItemListsInProcDistribution( "SchoolLockers",             {                                     comics(1),                                                                         school(3), } );
insertItemListsInProcDistribution( "ElectronicStoreMagazines",  {                                                electronics(5), } );
insertItemListsInProcDistribution( "CrateMagazines",            { adult(2),                                                                                                                         sport(5),  } );
insertItemListsInProcDistribution( "MagazineRackMixed",         { adult(1),                                                                                                                         sport(7),  } );
insertItemListsInProcDistribution( "LivingRoomShelf",           {           animal(2),    children(1),            electronics(1), language(1),  office(1),   other(2),  religious(2),    school(1),  } );
insertItemListsInProcDistribution( "BedroomSideTable",          {                                                                                                       religious(1),  } );
insertItemListsInProcDistribution( "BreakRoomShelves",          {                                                                                                                                   sport(5),  } );
insertItemListsInProcDistribution( "CratePetSupplies",          {           animal(5),                                                                                                              sport(5),  } );
insertItemListsInProcDistribution( "FireStorageTools",          { adult(1),                           comics(2),                                                                                    sport(5), } );
insertItemListsInProcDistribution( "ToolStoreFarming",          { adult(1),                           comics(2),                                                                                    sport(1), } );
insertItemListsInProcDistribution( "GardenStoreMisc",           { adult(1),                           comics(2),                                                                                    sport(1), } );
insertItemListsInProcDistribution( "GarageMechanics",           { adult(1),                           comics(2),                                                                                    sport(1), } );
insertItemListsInProcDistribution( "StoreShelfMechanics",       { adult(1),                           comics(2), electronics(1),                                                                    sport(1), } );