------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-30 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCfoodbar(1),   HCfoodbarbeerpack(1),    HCfoodbarbeer (1)   } );
insertItemListsInProcDistribution( "BarShelfLiquor",    		{ HCfoodbar(1),   HCfoodbarbeerpack(0.2),    HCfoodbarbeer (1)      } );
insertItemListsInProcDistribution( "BarCounterLiquor",    		{ HCfoodbar(1),   HCfoodbarbeerpack(0.2),    HCfoodbarbeer (1)      } );
insertItemListsInProcDistribution( "StoreShelfBeer",    		{                 HCfoodbarbeerpack(1),      HCfoodbarbeer (3)      } );
insertItemListsInProcDistribution( "StoreShelfDrinks",    		{ HCfoodbar(1),   HCfoodbarbeerpack(0.2),    HCfoodbarbeer (0.2)    } );
insertItemListsInProcDistribution( "StoreShelfWhiskey",    		{ HCfoodbar(1),   HCfoodbarbeerpack(0.2),    HCfoodbarbeer (0.2)    } );
insertItemListsInProcDistribution( "FridgeBeer",    			{                 HCfoodbarbeerpack(1),      HCfoodbarbeer (3)      } );
insertItemListsInProcDistribution( "FridgeBottles",    			{ HCfoodbar(1),   HCfoodbarbeerpack(0.2),    HCfoodbarbeer (0.2)    } );
insertItemListsInProcDistribution( "BreweryBottles",    		{                 HCfoodbarbeerpack(1),      HCfoodbarbeer (3)      } );
insertItemListsInProcDistribution( "WhiskeyBottlingFull",    	{ HCfoodbar(1),                                                     } );




