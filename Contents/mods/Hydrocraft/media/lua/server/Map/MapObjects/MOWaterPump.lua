--***********************************************************
--**                    THE TRYNAEAT STONE                    **
--***********************************************************

if isClient() then return end

require "WaterPump/BuildingObjects/WaterPump"

local function noise(message) SWaterPumpSystem.instance:noise(message) end

local PRIORITY = 7

-- -- -- -- --

local function LoadObject(isoObject)
	local sq = isoObject:getSquare()
	if not instanceof(isoObject, "IsoThumpable") then
        return
    end
	SWaterPumpSystem.instance:loadIsoObject(isoObject)
end

local function LoadWaterPump(isoObject)
    LoadObject(isoObject)
end

MapObjects.OnLoadWithSprite("hcBuildingWaterPump_01_0", LoadWaterPump, PRIORITY)
