
-- Checks given square for at least 1 item with a timetracker definition
local function checkForLife(player, square)
	local items = square:getWorldObjects()
	for i=0, items:size()-1 do
		if(items:get(i) and items:get(i):getItem()) then
			local item = items:get(i):getItem()
			local type = item:getType()
			-- Send cmd and exit loop as soon as we find any items with time tracker defs on this square
			if ItemTimeTrackerMod[ type ] ~= nil then
				local args = { x = square:getX(), y = square:getY(), z = square:getZ() }
				sendClientCommand(player, 'Timetracker', 'updateLife', args)
				return
			end
		end
	end
end

function ItemCheck()

	--disables the check if the game is running faster than speed 1
	--reports of FPS drops, any interaction with an item will drop the speed anyway.
	if UIManager.getSpeedControls():getCurrentGameSpeed() > 1 then
		return
	end

	local player = getPlayer()
	local px = math.floor( player:getX() + 0.5 )--round to nearest int
	local py = math.floor( player:getY() + 0.5 )
	local pz = player:getZ()
	local radius = 2
	local cell = player:getCell()
	for x = px-radius, px + radius do
		for y = py-radius, py + radius do
			local sq = cell:getGridSquare(x, y, pz)
			if(sq ~= nil) then
				checkForLife(player, sq)
			end
		end
	end
end

Events.EveryOneMinute.Add(ItemCheck)
