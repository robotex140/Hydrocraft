if isClient() then return end

local Commands = {}
Commands.wantNoise = getDebug()

local noise = function(...)
	if (Commands.wantNoise) then print('TimetrackerCommand: ', ...) end
end

local function loadItem(item)
    local type = item:getType()
    local entry = ItemTimeTrackerMod[ type ]
    item:getModData().Life = entry.Life
    item:getModData().TurnInto = entry.TurnInto
    item:getModData().StartTime = getGameTime():getWorldAgeHours()

    noise("loadItem ",item:getType(),item:getModData().Life,item:getModData().TurnInto,item:getModData().StartTime)
end

local function worldItemReplace(item,square)
 
	local delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
	noise("WorldItemReplace",item:getType(),"  Life:", item:getModData().Life,"  GameTime:", getGameTime():getWorldAgeHours(),"  StartTime:",item:getModData().StartTime,"  Delta:", delta)
			
	if delta < 0 then
		local oldDelta = delta
		item:getModData().StartTime = getGameTime():getWorldAgeHours()
		delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
		noise("Error: negative delta (" .. oldDelta .. "), delta reset to: " .. delta)
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
				noise("Error: item creation failed, no such item as: " .. newType)
			end
		end
	end
end

local function updateItem(item, square)
    local type = item:getType()
    if ItemTimeTrackerMod[ type ] == nil then return; end
    if(item:getModData().Life == nil) then
		loadItem(item)
	else
        worldItemReplace(item, square)
    end
end

function Commands.updateLife(player, args)
    local cell = player:getCell()
    local sq = cell:getGridSquare(args.x, args.y, args.z)
    if(sq ~= nil) then
        local items = sq:getWorldObjects()
        for i=0, items:size()-1 do
            if (items:get(i) and items:get(i):getItem()) then
                updateItem(items:get(i):getItem(), sq)
            end
        end
    end
end

local function OnClientCommand(module, command, player, args)
    if module ~= 'Timetracker' then return end
	noise('Timetracker OnClientCommand received command '..command)
    if Commands[command] then
        Commands[command](player, args)
    end
end

Events.OnClientCommand.Add(OnClientCommand)
