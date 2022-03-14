------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-23 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "BathroomCounter",    	{ HCbatterysmallerjunk(1), HCbatterysmaller(1), HCbatterylarge(1), HCbatterylargejunk(1), HCbatteryhuge(1),  HCbatteryhugejunk(1) } );

-- HCbatterysmallerjunk is included in HCbatterysmaller
-- HCbatterylargejunk is included in HCbatterylarge
-- HCbatteryhugejunk is included in HCbatteryhuge

insertItemListsInProcDistribution( "StoreShelfElectronics", 	{                        HCbatterysmaller(10),  HCbatterylarge(10),                     HCbatteryhuge(10),                     	} );
insertItemListsInProcDistribution( "ElectronicStoreMisc",   	{                        HCbatterysmaller(5),   HCbatterylarge(5),                      HCbatteryhuge(5),                     	} );
insertItemListsInProcDistribution( "ElectronicStoreMisc",       {                        HCbatterysmaller(5),   HCbatterylarge(5),                     											} );
insertItemListsInProcDistribution( "ElectronicStoreMisc",       {                        HCbatterysmaller(5),   HCbatterylarge(5),                     											} );
insertItemListsInProcDistribution( "ElectronicStoreLights",     {                        HCbatterysmaller(0.3),                       														} );
insertItemListsInProcDistribution( "CrateBatteries",        	{                        HCbatterysmaller(50),  HCbatterylarge(40),                     HCbatteryhuge(30),                     	} );
insertItemListsInProcDistribution( "CrateBatteries",        	{                        HCbatterysmaller(40),  HCbatterylarge(30),                     HCbatteryhuge(20),                     	} );
insertItemListsInProcDistribution( "CrateBatteries",        	{                        HCbatterysmaller(30),  HCbatterylarge(20),                     HCbatteryhuge(10),                     	} );
insertItemListsInProcDistribution( "CrateBatteries",        	{                        HCbatterysmaller(20),  HCbatterylarge(10),                     HCbatteryhuge(5),                     	} );
insertItemListsInProcDistribution( "CrateElectronics",        	{                        HCbatterysmaller(2),   HCbatterylarge(1),                      HCbatteryhuge(0.5),                     	} );
insertItemListsInProcDistribution( "CrateElectronics",        	{                        HCbatterysmaller(2),   HCbatterylarge(1),                      HCbatteryhuge(0.5),                     	} );
insertItemListsInProcDistribution( "CrateTools",       		 	{                        HCbatterysmaller(1),   HCbatterylarge(1),                      HCbatteryhuge(1),                     	} );
insertItemListsInProcDistribution( "GarageTools",        		{                        HCbatterysmaller(1),   HCbatterylarge(1),                      HCbatteryhuge(1),                     	} );
insertItemListsInProcDistribution( "EngineerTools",        		{                        HCbatterysmaller(5),   HCbatterylarge(5),                      HCbatteryhuge(5),                    		} );
-- insertItemListsInProcDistribution( "ToolStoreTools",     		{                        HCbatterysmaller(1),  HCbatterylarge(1),                      HCbatteryhuge(1),                     	} ); now ToolStoreMisc
-- insertItemListsInProcDistribution( "GigamartTools",      	  	{                        HCbatterysmaller(15), HCbatterylarge(15),                     HCbatteryhuge(15),                    	} ); now GigamartHouseElectronics
insertItemListsInProcDistribution( "ToolStoreMisc",        		{                        HCbatterysmaller(1),   HCbatterylarge(1),                      HCbatteryhuge(1),                    		} );
insertItemListsInProcDistribution( "GigamartHouseElectronics",  {                        HCbatterysmaller(5),  HCbatterylarge(5),                     HCbatteryhuge(12),                     	} );
insertItemListsInProcDistribution( "GigamartHouseElectronics",  {                        HCbatterysmaller(2),  HCbatterylarge(2),                     HCbatteryhuge(6),                     	} );
insertItemListsInProcDistribution( "GigamartHouseElectronics",  {                        HCbatterysmaller(1),  HCbatterylarge(1),                      HCbatteryhuge(3),                     	} );
insertItemListsInProcDistribution( "CrateElectronics",      	{                        HCbatterysmaller(1),   HCbatterylarge(1),                      HCbatteryhuge(1),                     	} );
insertItemListsInProcDistribution( "CrateMetalwork",        	{                        HCbatterysmaller(1),   HCbatterylarge(1),                      HCbatteryhuge(0.5),                   	} );
insertItemListsInProcDistribution( "OfficeDesk",        		{                        HCbatterysmaller(1),   HCbatterylarge(0.5),                                        					} );
insertItemListsInProcDistribution( "PoliceDesk",        		{                        HCbatterysmaller(1),   HCbatterylarge(0.5),                                        					} );
insertItemListsInProcDistribution( "ClassroomDesk",        		{                        HCbatterysmaller(1),                                           										} );
insertItemListsInProcDistribution( "KitchenRandom",        		{                        HCbatterysmaller(1),                                          										} );
insertItemListsInProcDistribution( "OtherGeneric",        		{                        HCbatterysmaller(2),  HCbatterylarge(1),                      HCbatteryhuge(0.5),                     	} );
insertItemListsInProcDistribution( "OtherGeneric",        		{                        HCbatterysmaller(2),  HCbatterylarge(1),                      HCbatteryhuge(0.5),                     	} );
insertItemListsInProcDistribution( "RadioFactoryComponents",   	{                        HCbatterysmaller(1),  HCbatterylarge(0.3),                                        						} );
insertItemListsInProcDistribution( "ArmyStorageElectronics",  	{                        HCbatterysmaller(2),  HCbatterylarge(2),                      HCbatteryhuge(2),                     		} );
insertItemListsInProcDistribution( "CrateRandomJunk",        	{ HCbatterysmallerjunk(5),                                      HCbatterylargejunk(5),                  HCbatteryhugejunk(5)		} );
insertItemListsInProcDistribution( "CrateRandomJunk",        	{ HCbatterysmallerjunk(5),                                      HCbatterylargejunk(5),                  HCbatteryhugejunk(5)		} );


