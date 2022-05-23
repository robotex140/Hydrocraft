--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Map/CGlobalObjectSystem"

CWaterPumpSystem = CGlobalObjectSystem:derive("CWaterPumpSystem")

function CWaterPumpSystem:new()
	local o = CGlobalObjectSystem.new(self, "waterpump")
	return o
end

function CWaterPumpSystem:isValidIsoObject(isoObject)
	return instanceof(isoObject, "IsoThumpable") and isoObject:getName() == "Water Pump"
end

function CWaterPumpSystem:newLuaObject(globalObject)
	return CWaterPumpGlobalObject:new(self, globalObject)
end

CGlobalObjectSystem.RegisterSystemClass(CWaterPumpSystem)
