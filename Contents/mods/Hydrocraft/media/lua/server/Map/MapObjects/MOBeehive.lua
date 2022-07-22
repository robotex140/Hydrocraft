--***********************************************************
--**                    THE TRYNAEAT STONE                    **
--***********************************************************

if isClient() then return end

require "Beehive/BuildingObjects/Beehive"

local function noise(message) SBeehiveSystem.instance:noise(message) end

local PRIORITY = 6

-- -- -- -- --

local function LoadObject(isoObject)
	local sq = isoObject:getSquare()
	if not instanceof(isoObject, "IsoThumpable") then
        return
    end
	SBeehiveSystem.instance:loadIsoObject(isoObject)
end

local function LoadBeehive(isoObject)
    LoadObject(isoObject)
end

MapObjects.OnLoadWithSprite("hcBuildingBeehive_00_0", LoadBeehive, PRIORITY)
MapObjects.OnLoadWithSprite("hcBuildingBeehive_01_0", LoadBeehive, PRIORITY)
MapObjects.OnLoadWithSprite("hcBuildingBeehive_02_0", LoadBeehive, PRIORITY)
