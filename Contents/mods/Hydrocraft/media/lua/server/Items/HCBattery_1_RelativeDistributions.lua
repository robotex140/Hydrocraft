---------------------------------------------------------
--- Batteries that could be found 
--- created 2021-12-13 by lorgalis
--- updates 2021-12-23 by fetisch - add HCBattery9volt
---------------------------------------------------------

function HCbatterysmallerjunk(m)
        retVal =
        {
                "Hydrocraft.HCBatterysmalldead",     m*2,
                "Hydrocraft.HCBatterydead",          m*1,
                "Hydrocraft.HCBatterymediumdead",    m*1,
				"Hydrocraft.HCBattery9voltdead",     m*2,				

        };
        return retVal
end


function HCbatterysmaller(m)
        retVal =
        {
                "Hydrocraft.HCBatterymedium",        m*2,
                "Hydrocraft.HCBatterypackmedium",    m*0.4,
                "Hydrocraft.HCBatterysixpack",       m*0.5,
                "Hydrocraft.HCBatterysmall",         m*2,
                "Hydrocraft.HCBatterysmallpack",     m*0.6,
				"Hydrocraft.HCBattery9volt",         m*2,

        };
        return retVal
end

function HCbatterylarge(m)
        retVal =
        {
                "Hydrocraft.HCBatterylarge",         m*2,
                "Hydrocraft.HCBatterylargedead",     m*0.2,
                "Hydrocraft.HCBatterypacklarge",     m*0.5,

        };
        return retVal
end

function HCbatterylargejunk(m)
        retVal =
        {
                "Hydrocraft.HCBatterylargedead",     m*1,

        };
        return retVal
end


function HCbatteryhuge(m)
        retVal =
        {
                "Hydrocraft.HCBatteryhuge",          m*2,
                "Hydrocraft.HCBatteryhugedead",      m*0.2,
        };
        return retVal
end

function HCbatteryhugejunk(m)
        retVal =
        {
                "Hydrocraft.HCBatteryhugedead",      m*1,
        };
        return retVal
end




