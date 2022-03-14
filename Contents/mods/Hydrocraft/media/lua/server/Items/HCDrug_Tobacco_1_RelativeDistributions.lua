---------------------------------------------------------
--- 2021-12-27 by lorgalis
---------------------------------------------------------
function HCsmokepack(m)
        retVal =
        {
                "Hydrocraft.HCCigarbox",                 m*0.1,
                "Hydrocraft.HCCigarettepacklights",      m*1,
                "Hydrocraft.HCCigarettepackmenthol",     m*1,
                "Hydrocraft.HCCigarettepack",            m*5,
        };
        return retVal
end

function HCsmokecarton(m)
        retVal =
        {
                "Hydrocraft.HCCigarettecarton",          m*0.1,
                "Hydrocraft.HCCigarettecartonlights",    m*1,
                "Hydrocraft.HCCigarettecartonmenthol",   m*1,
        };
        return retVal
end

function HCsmokesingle(m)
        retVal =
        {
                "Hydrocraft.HCCigar",                    m*0.1,
                "Hydrocraft.HCCigaretteslights",         m*1,
                "Hydrocraft.HCCigarettesmenthol",        m*1,
                "Base.Cigarettes",                       m*10,
        };
        return retVal
end


function HCsmoketrash(m)
        retVal =
        {
                "Hydrocraft.HCCigarettebutt",          m*1,
        };
        return retVal
end


