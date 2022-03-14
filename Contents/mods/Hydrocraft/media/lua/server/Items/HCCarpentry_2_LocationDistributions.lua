------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "CrateTools",    			{ ibc(1), biglog(1), processedlog(1) } );
insertItemListsInProcDistribution( "CrateTools",    			{ ibc(1), biglog(0.5), processedlog(1) } );
insertItemListsInProcDistribution( "CrateFarming",    			{ ibc(1),              processedlog(1) } );
insertItemListsInProcDistribution( "GarageTools",    			{ ibc(1), biglog(0.5), processedlog(1) } );
insertItemListsInProcDistribution( "ToolStoreFarming",    		{ ibc(1),              processedlog(1) } );
insertItemListsInProcDistribution( "CrateMetalwork",    		{ ibc(1),              processedlog(1) } );
insertItemListsInProcDistribution( "CrateLumber",    			{         biglog(3),   processedlog(1) } );
insertItemListsInProcDistribution( "CrateLumber",    			{         biglog(2),   processedlog(1) } );
insertItemListsInProcDistribution( "CrateLumber",    			{         biglog(1),                 } );
insertItemListsInProcDistribution( "ToolStoreCarpentry",   		{         biglog(2),                 } );


