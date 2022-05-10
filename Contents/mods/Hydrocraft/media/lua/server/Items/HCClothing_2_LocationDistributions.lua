------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HChazmat(1), HCgasmask(1), HCprotection(1)} );
insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCgasmask(2), HCprotection(2)} );
insertItemListsInProcDistribution( "CrateMetalwork",    			{              HCgasmask(5), HCprotection(1)} );
insertItemListsInProcDistribution( "BathroomCounter",    			{              HCgasmask(1), HCprotection(1)} );
insertItemListsInProcDistribution( "CampingStoreGear",    			{              HCgasmask(1), HCprotection(1)} );
insertItemListsInProcDistribution( "ToolStoreTools",    			{                            HCprotection(1)} );
insertItemListsInProcDistribution( "CrateFarming",    				{                            HCprotection(1)} );
insertItemListsInProcDistribution( "CampingStoreClothes",    		{                            HCprotection(1)} );
insertItemListsInProcDistribution( "HospitalLockers",    			{                            HCprotection(1)} );
insertItemListsInProcDistribution( "GardenStoreMisc",    			{                            HCprotection(1)} );
insertItemListsInProcDistribution( "GigamartHousewares",    		{                            HCprotection(1)} );
insertItemListsInProcDistribution( "FactoryLockers",    			{              HCgasmask(1),   HCprotection(1)} );
insertItemListsInProcDistribution( "GardenStoreMisc",    			{              HCgasmask(0.3), HCprotection(0.5)} );
insertItemListsInProcDistribution( "CrateTools",    				{ HCgasmask(2), HCprotection(2)} );




