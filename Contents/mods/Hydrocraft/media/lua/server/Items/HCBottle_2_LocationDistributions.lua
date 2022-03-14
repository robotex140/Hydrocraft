------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "HCMedicalbox",    		{ bottles(1), bottelsempty(1) } );
-- insertItemListsInProcDistribution( "HCMedicalbox",    			{ bottles(10), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "MedicalStorageTools",    	{ bottles(1), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "BinGeneric",    			{             bottelsempty(2)   } );
insertItemListsInProcDistribution( "CrateRandomJunk",    		{             bottelsempty(2)   } );
insertItemListsInProcDistribution( "ArmyStorageMedical",    	{ bottles(1), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "StoreShelfMedical",   	 	{ bottles(2), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "SafehouseMedical",   	 	{ bottles(1), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "MedicalClinicDrugs",   	 	{ bottles(5), bottelsempty(0.1) } );
insertItemListsInProcDistribution( "MedicalStorageDrugs",    	{ bottles(5), bottelsempty(0.1) } );



