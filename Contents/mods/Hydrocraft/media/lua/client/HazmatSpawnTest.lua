
local function SpawnItemOnFloor(x, y, z, itemName) 
	local sq = getCell():getGridSquare(x, y, z)
	if(sq ~= nil) then
		local items = sq:getObjects();
		local spawned = false;
		for i=0, items:size()-1, 1 do
			if(items:get(i) == itemName) then
				spawned = true
			end
		end
	
		if(not spawned) then
			sq:AddWorldInventoryItem(itemName, 0.5, 0.5, 0)
			return true
		end
	end
	return false
end

local function SpawnItem(x, y, z, itemName, containerType) 
	local sq = getCell():getGridSquare(x, y, z)
	if(sq ~= nil) then
		local items = sq:getObjects();
		
		local foundContainer = false;
		
		for i=0, items:size()-1, 1 do
			if(not foundContainer) then
				local container = items:get(i):getContainer()
				if(container ~= nil) then
				
					if(containerType == container:getType()) then
						foundContainer = true

						local weight = container:getContentsWeight()
						local capacity = container:getCapacity()
						local space = capacity - weight
						local item = InventoryItemFactory.CreateItem(itemName)
						local itemWeight = item:getUnequippedWeight()
						if(not container:contains(itemName) and itemWeight <= space) then
							local isClient = isClient()
							if isClient == true then
								container:addItemOnServer(item)
							else
								container:addItem(item)
							end
							return true
						end

					end
				end
			end
		end
	end
	return false
end

local function spawnHazmat()
	local HAZMAT = "Base.HazmatSuit"
	local hour = getGameTime():getHour()
	--print("Hour: " .. hour)
	if(hour % 6 == 0) then --0, 6, 12, 18

		--Riverside school, for testing purposes
		--SpawnItemOnFloor(6422, 5459, 0, HAZMAT)
		--SpawnItem(6422, 5458, 0, HAZMAT, "locker")
	
		--Secret Army Base
		--spawns them on the floor if spawning in a locker fails, e.g. if locker is full or destroyed
		local spawned = false
		spawned = SpawnItem(5552, 12504, 0, HAZMAT, "locker")
		if(not spawned) then
			SpawnItemOnFloor(5552, 12504, 0, HAZMAT)
		end
		
		--adjacent locker, removed as only need to spawn 1.
		--spawned = SpawnItem(5552, 12503, 0, HAZMAT, "locker")
		--if(not spawned) then
		--	SpawnItemOnFloor(5552, 12503, 0, HAZMAT)
		--end		
		
		
		--fire station lockers
		--Rosewood fire station
		--if(ZombRand(100) == 0) then SpawnItem(8157, 11738, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8157, 11739, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8157, 11740, 0, HAZMAT, "locker") end
		
		--if(ZombRand(100) == 0) then SpawnItem(8125, 11725, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8126, 11725, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8128, 11725, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8129, 11725, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8131, 11725, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(8132, 11725, 1, HAZMAT, "locker") end

		--Firestation: https://map.six.ph/#0.86502,0.18538,153
		--if(ZombRand(100) == 0) then SpawnItem(13935, 3043, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13935, 3045, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13935, 3046, 0, HAZMAT, "locker") end
		
		--Firestation: https://map.six.ph/#0.90710,0.15535,127
		--if(ZombRand(100) == 0) then SpawnItem(13695, 1771, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13696, 1771, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13697, 1771, 0, HAZMAT, "locker") end
		--upstairs
		--if(ZombRand(100) == 0) then SpawnItem(13716, 1764, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13717, 1764, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13718, 1764, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13720, 1764, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13721, 1764, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(13722, 1764, 1, HAZMAT, "locker") end
		
		--Firestation: https://map.six.ph/#0.85258,0.12758,183
		--if(ZombRand(100) == 0) then SpawnItem(12350, 1776, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12351, 1776, 0, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12352, 1776, 0, HAZMAT, "locker") end
		--upstairs
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1742, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1743, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1744, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1746, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1747, 1, HAZMAT, "locker") end
		--if(ZombRand(100) == 0) then SpawnItem(12346, 1748, 1, HAZMAT, "locker") end
	
	end
	
end

Events.EveryHours.Add(spawnHazmat)