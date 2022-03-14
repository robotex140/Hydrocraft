---------------------------------------------------------
--- created 2021-12-26 by lorgalis
--- updated 2021-12-27 by lorgalis
--- @todo HCElectrolyzer has only one recipe with 
--- missing ingredients > obsidianpowder
--- @todo typo in HCCentifuge -> HCCentrifuge
---------------------------------------------------------
function HCcentrifuge(m)
        retVal =
        {
                "Hydrocraft.HCCentifuge",       m*1,
                "Hydrocraft.HCElectrolyzer",    m*1,
        };
        return retVal
end
