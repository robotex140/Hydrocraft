------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
-- @todo Distribution need to be optimized
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCcinema(1) } );
insertItemListsInProcDistribution( "TheatrePopcorn",    				{ HCcinema(0.1) } );
insertItemListsInProcDistribution( "TheatreSnacks",    					{ HCcinema(0.1) } );
insertItemListsInProcDistribution( "TheatreDrinks",    					{ HCcinema(0.1) } );
insertItemListsInProcDistribution( "RandomFiller",    					{ HCcinema(1) } );
insertItemListsInProcDistribution( "GigamartToys",    					{ HCcinema(0.1) } );
insertItemListsInProcDistribution( "CrateCameraFilm",    				{ HCcinema(3) } );


