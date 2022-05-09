
local function loadItem(item)
	local type = item:getType()
	if ItemTimeTrackerMod[ type ] ~= nil then
		local entry = ItemTimeTrackerMod[ type ]
		item:getModData().Life = entry.Life
		item:getModData().TurnInto = entry.TurnInto
		item:getModData().StartTime = getGameTime():getWorldAgeHours()

		print("loadItem ",item:getType(),item:getModData().Life,item:getModData().TurnInto,item:getModData().StartTime)
		return true
	end
	return false
end

local function WorldItemReplace(item,square)
 
	local delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
	print("WorldItemReplace",item:getType(),"  Life:", item:getModData().Life,"  GameTime:", getGameTime():getWorldAgeHours(),"  StartTime:",item:getModData().StartTime,"  Delta:", delta)
			
	if delta < 0 then
		local oldDelta = delta
		item:getModData().StartTime = getGameTime():getWorldAgeHours()
		delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
		print("Error: negative delta (" .. oldDelta .. "), delta reset to: " .. delta)
	end
							
	if(item:getModData().Life < delta) then
		local wi = item:getWorldItem()
		square:transmitRemoveItemFromSquare( wi )
		wi:removeFromSquare()
		if item:getModData().TurnInto~="" or item:getModData().TurnInto~="out" then
			local newType = item:getModData().TurnInto
			local temp = InventoryItemFactory.CreateItem( newType )
			if (temp) then 
				loadItem(temp)
				temp = square:AddWorldInventoryItem(temp, 0.5, 0.5, 0, true)
			else
				print("Error: item creation failed, no such item as: " .. newType)
			end
		end
	end
end

local function WorldItemHandle(item,square)

	if(item:getModData().Life == nil) then
		loadItem(item)
	else
		print("life = ", item:getModData().Life)
		WorldItemReplace(item,square)
	end

end

function ItemCheck()

	--disables the check if the game is running faster than speed 1
	--reports of FPS drops, any interaction with an item will drop the speed anyway.
	if UIManager.getSpeedControls():getCurrentGameSpeed() > 1 then
		return
	end

	local player = getPlayer()
	local px = math.floor( player:getX() + 0.5 )--rround to nearest int
	local py = math.floor( player:getY() + 0.5 )
	local pz = player:getZ()
	local radius = 2
	local cell = player:getCell()
	for x = px-radius, px + radius do
		for y = py-radius, py + radius do
			local sq = cell:getGridSquare(x, y, pz)
			if(sq ~= nil) then
				local items = sq:getWorldObjects()
				for j=0, items:size()-1 do
					if(items:get(j) and items:get(j):getItem()) then
						WorldItemHandle(items:get(j):getItem(), sq)
					end
				end
			end
		end
	end
end

Events.EveryOneMinute.Add(ItemCheck)
