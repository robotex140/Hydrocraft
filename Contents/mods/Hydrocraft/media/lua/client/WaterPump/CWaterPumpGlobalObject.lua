require "Map/CGlobalObject"

CWaterPumpGlobalObject = CGlobalObject:derive("CWaterPumpGlobalObject")

function CWaterPumpGlobalObject:new(luaSystem, globalObject)
	local o = CGlobalObject.new(self, luaSystem, globalObject)
	return o
end

function CWaterPumpGlobalObject:getObject()
	return self:getIsoObject()
end
