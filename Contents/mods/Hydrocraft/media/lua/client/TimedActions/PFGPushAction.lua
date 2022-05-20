require "TimedActions/ISBaseTimedAction"

PFGPushAction = ISBaseTimedAction:derive("PFGPushAction")

function PFGPushAction.isValid(args)
	
	for i,v in ipairs(PFGMenu.typesTable) do
		if args["character"]:getInventory():contains(tostring(v)) then
			return false
		end
	end
	return true
end

function PFGPushAction:waitToStart()
	return false
end

function PFGPushAction:update()

end

function PFGPushAction:start()
	
end

function PFGPushAction:stop()
	ISBaseTimedAction.stop(self);
end

function PFGPushAction:perform()
	
	local inventoryItem = self.item:getItem()
	self.item:getSquare():transmitRemoveItemFromSquare(self.item)
	self.item:removeFromWorld()
	self.item:removeFromSquare()
	self.item:setSquare(nil)
	inventoryItem:setWorldItem(nil)
	inventoryItem:setJobDelta(0.0)
	self.inventory:setDrawDirty(true)
	self.inventory:AddItem(inventoryItem)
	ISInventoryPaneContextMenu.equipWeapon(inventoryItem,false,true,self.character:getPlayerNum())

	ISBaseTimedAction.perform(self)
end

function PFGPushAction:new( item, player)

	local o = {}
	setmetatable( o, self)
	self.__index = self
	o.maxTime = 50
	o.character = player
	o.inventory = player:getInventory()
	o.item = item
	o.stopOnWalk = false
	o.stopOnRun = false
	
	return o
end