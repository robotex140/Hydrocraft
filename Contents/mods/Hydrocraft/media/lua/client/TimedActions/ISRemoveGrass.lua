--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRemoveGrass = ISBaseTimedAction:derive("ISRemoveGrass")

function ISRemoveGrass:isValid()
    for i=0,self.square:getObjects():size()-1 do
        local object = self.square:getObjects():get(i);
        if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
            return true
        end
    end
    return false
end

function ISRemoveGrass:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function ISRemoveGrass:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())

    self.character:setMetabolicTarget(Metabolics.DiggingSpade);
end

function ISRemoveGrass:start()
--	getSoundManager():PlayWorldSound("bushes", self.square, 0.2, 20, 1.0, 3, true)
	self:setActionAnim("RemoveGrass")
	self:setOverrideHandModels(nil, nil)
    self.square:playSound("RemovePlant");
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 5)
end

function ISRemoveGrass:stop()
    ISBaseTimedAction.stop(self)
end

function ISRemoveGrass:perform()
	local sq = self.square
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
	sendClientCommand(self.character, 'object', 'removeGrass', args)

	ISBaseTimedAction.perform(self)
	--if(ZombRand(4) == 0) then
	self.character:getInventory():AddItem("Hydrocraft.HCGrass")
	--end
end

function ISRemoveGrass:new(character, square)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.square = square
	o.stopOnWalk = true
	o.stopOnRun = true
	o.maxTime = 50
	o.spriteFrame = 0
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o
end
