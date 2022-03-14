------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCflags(1),  HCflagsAmerican(1),   HCflagsAnarchist(1)  } );
insertItemListsInProcDistribution( "GigamartToys",    			{ HCflags(1),                                                   } );
insertItemListsInProcDistribution( "CrateToys",    				{ HCflags(1),                                                   } );
insertItemListsInProcDistribution( "GunStoreCounter", 			{ HCflags(1),                                                   } );
insertItemListsInProcDistribution( "GarageTools", 				{ HCflags(0.3),                                                 } );
insertItemListsInProcDistribution( "LivingRoomShelf", 			{ HCflags(0.3),                                                 } );
insertItemListsInProcDistribution( "Locker", 					{ HCflags(0.1),                                                 } );

insertItemListsInProcDistribution( "ArmyStorageOutfit",    		{                HCflagsAmerican(7),     HCflagsAnarchist(0.3)  } );
insertItemListsInProcDistribution( "PoliceDesk",    			{                HCflagsAmerican(1),     HCflagsAnarchist(0.3)  } );
insertItemListsInProcDistribution( "PoliceLockers",    			{                HCflagsAmerican(1),     HCflagsAnarchist(0.3)  } );
insertItemListsInProcDistribution( "FireDeptLockers",    		{                HCflagsAmerican(1),     HCflagsAnarchist(0.3)  } );
insertItemListsInProcDistribution( "PrisonGuardLockers",    	{                HCflagsAmerican(0.3),   HCflagsAnarchist(1)    } );
insertItemListsInProcDistribution( "SecurityLockers",    		{                HCflagsAmerican(1),     HCflagsAnarchist(1)    } );
insertItemListsInProcDistribution( "FactoryLockers",    		{                HCflagsAmerican(0.1),   HCflagsAnarchist(5)    } );


