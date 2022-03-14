---------------------------------------------------------
--- 2021-12-26 by lorgalis
---------------------------------------------------------
function bottles(m)
        retVal =
        {
                "Hydrocraft.HCGlassbottlemethylamin",       		m*2,
                "Hydrocraft.HCGlassbottlephenyl",         			m*2,
				"Hydrocraft.HCGlassbottlesulfuricacid",    			m*1,
				"Hydrocraft.HCGlassbottleethanol",    				m*1,
				"Hydrocraft.HCGlassbottleammonia",    				m*1,
				"Hydrocraft.HCGlassbottleselfmadeether",    		m*0,
				"Hydrocraft.HCGlassbottleh2o2",    					m*1,
				"Hydrocraft.HCGlassbottlepotassiumpermanganate",    m*1,
        };
        return retVal
end

function bottelsempty(m)
        retVal =
        {
                "Hydrocraft.HCGlassbottleempty",         				m*1,
                "Hydrocraft.HCGlassbottlemethylaminempty",  			m*1,
                "Hydrocraft.HCGlassbottlephenylempty",      			m*1,
				"Hydrocraft.HCGlassbottlesulfuricacidempty",      		m*1,
				"Hydrocraft.HCGlassbottleethanolempty",      			m*1,
				"Hydrocraft.HCGlassbottleammoniaempty",    				m*1,
				"Hydrocraft.HCGlassbottleselfmadeetherempty",    		m*0,
				"Hydrocraft.HCGlassbottleh2o2empty",    				m*1,
				"Hydrocraft.HCGlassbottlepotassiumpermanganateempty",  	m*1,
        };
        return retVal
end
