--***********************************************************
--**                    Random BLABLABLA                   **
--***********************************************************


if isClient() then return end

require "Map/SGlobalObjectSystem"

HCTimingSystem = SGlobalObjectSystem:derive("HCTimingSystem")

function HCTimingSystem:new()
	local o = SGlobalObjectSystem.new(self, "hctiming")

	o.hoursElapsed = o.hoursElapsed or 0

	local gameTime = GameTime:getInstance()
	local sec = math.floor(gameTime:getTimeOfDay() * 3600)
	o.previousHour = math.floor(sec / 3600)

	return o
end

function HCTimingSystem:initSystem()
	SGlobalObjectSystem.initSystem(self)

	-- Specify GlobalObjectSystem fields 
	self.system:setModDataKeys({'hoursElapsed'})
	
	-- Specific GlobalObject fields 
	self.system:setObjectModDataKeys({'objectName', 'spriteName', 'nextStatusHrs', 'nextTimedObjName', 'health'})

end


function HCTimingSystem:HCTenMinutes()
	print ('HC Timing - 10 mins are over')
	local sec = math.floor(getGameTime():getTimeOfDay() * 3600)
	local currentHour = math.floor(sec / 3600)
	local day = getGameTime():getDay()
	-- an hour has passed
	if currentHour ~= self.previousHour then
		self.hoursElapsed = self.hoursElapsed + 1
		self.previousHour = currentHour

	end
end


--SGlobalObjectSystem.RegisterSystemClass(HCTimingSystem)

local function HCTenMinutes()
	HCTimingSystem.instance:HCTenMinutes()
end

--Events.EveryTenMinutes.Add(HCTenMinutes)

