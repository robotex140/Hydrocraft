------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCsoaps(1), HCcleaning(1), HCmothball(1), HCvacs(1)} );
insertItemListsInProcDistribution( "KitchenRandom",    			{ HCsoaps(1),                  HCmothball(1),            } );
insertItemListsInProcDistribution( "BathroomCounter",    		{ HCsoaps(1),                  HCmothball(1), HCvacs(1)  } );
insertItemListsInProcDistribution( "BathroomCabinet",    		{ HCsoaps(1),                                 HCvacs(1)  } );
insertItemListsInProcDistribution( "CrateTools",    			{               HCcleaning(1),                HCvacs(2)  } );
insertItemListsInProcDistribution( "GarageTools",    			{ HCsoaps(0.5), HCcleaning(1),                HCvacs(0.5)} );
insertItemListsInProcDistribution( "CrateFarming",    			{ HCsoaps(0.5), HCcleaning(1),                           } );
insertItemListsInProcDistribution( "CrateMetalwork",    		{               HCcleaning(1),                           } );
insertItemListsInProcDistribution( "CrateElectronics",    		{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "ElectronicStoreMisc",  		{                                             HCvacs(2)  } );
insertItemListsInProcDistribution( "WardrobeWoman",    			{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "WardrobeWomanClassy", 	 	{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "WardrobeMan",    			{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "WardrobeManClassy",    		{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "SalonCounter",    			{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "CrateSalonSupplies",    	{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "SalonShelfHaircare",    	{                                             HCvacs(1)  } );
insertItemListsInProcDistribution( "GigamartHouseElectronics",  {                                             HCvacs(2)  } );
insertItemListsInProcDistribution( "GigamartHousewares",    	{ HCsoaps(1),   HCcleaning(1),                HCvacs(0.5)} );
insertItemListsInProcDistribution( "BedroomDresser",   			{                              HCmothball(9),            } );
insertItemListsInProcDistribution( "DresserGeneric",   			{                              HCmothball(9),            } );
insertItemListsInProcDistribution( "StripClubDressers",   		{                              HCmothball(9),            } );




