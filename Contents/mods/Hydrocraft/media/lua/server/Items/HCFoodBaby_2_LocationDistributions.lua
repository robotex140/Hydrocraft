------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCbabyfood(1),   HCbabyfoodtrash(1)   } );
insertItemListsInProcDistribution( "GigamartDryGoods",    			{ HCbabyfood(1),    HCbabyfoodtrash(0.1)   } );
insertItemListsInProcDistribution( "KitchenBreakfast",    			{ HCbabyfood(1),    HCbabyfoodtrash(0.2)   } );
insertItemListsInProcDistribution( "BinBar",    					{                   HCbabyfoodtrash(1)     } );
insertItemListsInProcDistribution( "BinGeneric",    				{                   HCbabyfoodtrash(1)     } );
insertItemListsInProcDistribution( "CrateRandomJunk",    			{                   HCbabyfoodtrash(1)     } );
insertItemListsInProcDistribution( "JaysDiningCounter",    			{ HCbabyfood(0.1),                         } );
insertItemListsInProcDistribution( "KitchenDryFood",    			{ HCbabyfood(1),                           } );
insertItemListsInProcDistribution( "KitchenRandom",  	  			{ HCbabyfood(1),                           } );
insertItemListsInProcDistribution( "CrateCannedFood",    			{ HCbabyfood(2),                           } );
insertItemListsInProcDistribution( "KitchenDryFood",    			{ HCbabyfood(1),                           } );

insertItemListsInDistribution( "all", "bin", { HCbabyfoodtrash(1) } );


