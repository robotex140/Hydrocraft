--- Create by Trynaeat
--- Based on Zomboid RainCollectorBarrel

if isClient() then return end

require "Map/SGlobalObjectSystem"

SWaterPumpSystem = SGlobalObjectSystem:derive("SWaterPumpSystem")

function SWaterPumpSystem:new()
	local o = SGlobalObjectSystem.new(self, "waterpump")
	return o
end

function SWaterPumpSystem:initSystem()
	SGlobalObjectSystem.initSystem(self)

	-- Specify GlobalObjectSystem fields that should be saved.
	self.system:setModDataKeys({})
	
	-- Specify GlobalObject fields that should be saved.
	self.system:setObjectModDataKeys({'taintedWater', 'waterAmount', 'waterMax'})

	self:convertOldModData()
end

function SWaterPumpSystem:newLuaObject(globalObject)
	return SWaterPumpGlobalObject:new(self, globalObject)
end

function SWaterPumpSystem:isValidIsoObject(isoObject)
	return instanceof(isoObject, "IsoThumpable") and isoObject:getName() == "Water Pump"
end

function SWaterPumpSystem:convertOldModData()
	-- If the gos_xxx.bin file existed, don't touch GameTime modData in case mods are using it.
	if self.system:loadedWorldVersion() ~= -1 then return end
end

-- Add 100 water to the pump
function SWaterPumpSystem:refill()
    for i=1,self:getLuaObjectCount() do
        local luaObject = self:getLuaObjectByIndex(i)
        if luaObject.waterAmount < luaObject.waterMax then
            luaObject.waterAmount = math.min(luaObject.waterMax, luaObject.waterAmount + 100)
            local isoObject = luaObject:getIsoObject()
            if isoObject then -- object might have been destroyed
                self:noise('added water to Water Pump at '..luaObject.x..","..luaObject.y..","..luaObject.z..' waterAmount='..luaObject.waterAmount)
                isoObject:setWaterAmount(luaObject.waterAmount)
				isoObject:transmitModData()
            end
        end
    end
end

SGlobalObjectSystem.RegisterSystemClass(SWaterPumpSystem)

-- -- -- -- --

local noise = function(msg)
	SWaterPumpSystem.instance:noise(msg)
end

-- every 10 minutes refill 100 water
local function EveryTenMinutes()
	SWaterPumpSystem.instance:refill()
end

local function OnWaterAmountChange(object, prevAmount)
	if not object then return end
	local luaObject = SWaterPumpSystem.instance:getLuaObjectAt(object:getX(), object:getY(), object:getZ())
	if luaObject then
		noise('waterAmount changed to '..object:getWaterAmount()..' at '..luaObject.x..','..luaObject.y..','..luaObject.z)
		luaObject.waterAmount = object:getWaterAmount()
	end
end


-- every 10 minutes we check if it's raining, to fill our water barrel
Events.EveryTenMinutes.Add(EveryTenMinutes)

Events.OnWaterAmountChange.Add(OnWaterAmountChange)

