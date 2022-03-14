---------------------------------------------------------
--- 2021-12-26 by lorgalis
---------------------------------------------------------
function ibc(m)
        retVal =
        {
                "Hydrocraft.HCIBC",             m*1,
        };
        return retVal
end

function biglog(m)
        retVal =
        {
                "Hydrocraft.HCWoodenpallet",    m*1,
                "Hydrocraft.HCLogbox",          m*1,
                "Hydrocraft.HCLumberbox",       m*1,
                "Hydrocraft.HCLumberstack",     m*0.5,
        };
        return retVal
end
function processedlog(m)
        retVal =
        {
                "Hydrocraft.HCSawdust",         m*3,
                "Hydrocraft.HCWoodbeam",        m*1,
                "Hydrocraft.HCWoodblock",       m*1,
                "Hydrocraft.HCWoodsheet",       m*1,
                "Hydrocraft.HCWoodenring",      m*1,
        };
        return retVal
end