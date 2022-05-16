--- Create by Trynaeat
--- Based on Zomboid RainCollectorBarrel

if isClient() then return end

require "Map/SGlobalObject"

SWaterPumpGlobalObject = SGlobalObject:derive("SWaterPumpGlobalObject")

function SWaterPumpGlobalObject:new(luaSystem, globalObject)
	local o = SGlobalObject.new(self, luaSystem, globalObject)
	return o
end

function SWaterPumpGlobalObject:initNew()
	self.taintedWater = false
	self.waterAmount = 0
	self.waterMax = WaterPump.waterMax
end

function SWaterPumpGlobalObject:stateFromIsoObject(isoObject)
	self.waterAmount = isoObject:getWaterAmount()
	self.waterMax = isoObject:getModData().waterMax
	self.taintedWater = isoObject:isTaintedWater()
	isoObject:getModData().waterMax = self.waterMax
	self:changeSprite()
	isoObject:transmitModData()
end

function SWaterPumpGlobalObject:stateToIsoObject(isoObject)
	-- Sanity check
	if not self.waterAmount then
		self.waterAmount = WaterPump.waterMax
	end
	if not self.waterMax then
		self.waterMax = WaterPump.waterMax
	end

	isoObject:setTaintedWater(self.taintedWater)
	isoObject:setWaterAmount(self.waterAmount) -- FIXME? OnWaterAmountChanged happens here
	isoObject:getModData().waterMax = self.waterMax
	self:changeSprite()
	isoObject:transmitModData()
end

function SWaterPumpGlobalObject:changeSprite()
	local isoObject = self:getIsoObject()
	if not isoObject then return end
	local spriteName = "hcBuildingWaterPump_01_0"
	if spriteName and (not isoObject:getSprite() or spriteName ~= isoObject:getSprite():getName()) then
		self:noise('sprite changed to '..spriteName..' at '..self.x..','..self.y..','..self.z)
		isoObject:setSprite(spriteName)
		isoObject:transmitUpdatedSpriteToClients()
	end
end
