------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCcentrifuge(1) } );
insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCcentrifuge(5) } );
insertItemListsInProcDistribution( "MedicalClinicTools",    		{ HCcentrifuge(2) } );
insertItemListsInProcDistribution( "SafehouseMedical",    			{ HCcentrifuge(1) } );
insertItemListsInProcDistribution( "StoreShelfMedical",    			{ HCcentrifuge(1) } );
insertItemListsInProcDistribution( "MedicalClinicTools",    		{ HCcentrifuge(1) } );


