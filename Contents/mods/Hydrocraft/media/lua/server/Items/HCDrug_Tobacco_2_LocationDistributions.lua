---@diagnostic disable: undefined-global
------------------------------------------------------------ 
-- Adds relative distributions to the  different locations
-- created 2021-12-27 by fetisch
------------------------------------------------------------

require "Items/ProceduralDistributions";

require "HCDistributionFunctions";

-- insertItemListsInProcDistribution( "MedicalStorageTools",    		{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),   HCsmoketrash(1)   } );

-- Remove all tobacco related recipes and distributions if sandbox option is unchecked/false
local function OnLoadSpawnTobacco()
    
    local SPAWN_TOBACCO = true
    if (SandboxVars.Hydrocraft.SpawnTobacco ~= nil) then
        SPAWN_TOBACCO = SandboxVars.Hydrocraft.SpawnTobacco
    end

    if (SPAWN_TOBACCO) then
        insertItemListsInProcDistribution( "StoreCounterTobacco",    		{ HCsmokepack(9),   HCsmokecarton(9),   HCsmokesingle(9),                     } );
        insertItemListsInProcDistribution( "StoreCounterTobacco",    		{ HCsmokepack(5),   HCsmokecarton(5),   HCsmokesingle(5),                     } );
        insertItemListsInProcDistribution( "StoreCounterTobacco",    		{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "BarCounterMisc",    			{ HCsmokepack(9),   HCsmokecarton(9),   HCsmokesingle(9),                     } );
        insertItemListsInProcDistribution( "BarCounterMisc",    			{ HCsmokepack(5),   HCsmokecarton(5),   HCsmokesingle(5),                     } );
        insertItemListsInProcDistribution( "BarCounterMisc",    			{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "Locker",    					{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "CrateCamping", 					{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "OfficeDesk", 					{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "PoliceLockers", 				{ HCsmokepack(1),   HCsmokecarton(1),   HCsmokesingle(1),                     } );
        insertItemListsInProcDistribution( "GigamartDryGoods", 				{ HCsmokepack(3),   HCsmokecarton(3),   HCsmokesingle(3),                     } );
    else
        local tobacco_recipes = {
            "Hydrocraft.Open Cigarette Carton",
            "Hydrocraft.Open Cigarette Pack",
            "Hydrocraft.Pack Cigarettes",
            "Hydrocraft.Pack Into Carton",
            "Hydrocraft.Dry Leaves",
            "Hydrocraft.Grind Tobacco",
            "Hydrocraft.Roll Cigar",
            "Hydrocraft.Put Tobacco in Pipe",
        }

        for k,v in pairs (tobacco_recipes) do
            local recipe = getScriptManager():getRecipe(v)
            
            Recipe.OnTest.AlwaysFalse = function() return false end
            
            recipe:setIsHidden(true)
            recipe:setLuaTest('Recipe.OnTest.AlwaysFalse')
        end
        --print("********************* SandboxVars.Hydrocraft.SpawnTobacco is disabled! No HC tobacco items should spawn!")
    end
end

Events.OnLoad.Add(OnLoadSpawnTobacco)