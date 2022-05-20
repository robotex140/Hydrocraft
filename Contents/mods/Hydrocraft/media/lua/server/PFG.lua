PFGMenu ={};

PFGMenu.typesTable = {"HCHanddolly","HCPallettruck","HCPushcart","HCWheelbarrow","HCWoodenwheelbarrow","HCToywagon","HCWagoncovered", "HCWagoncoveredhorsefemale", "HCWagoncoveredhorsemale","HCWagoncoveredoxen","HCWagonhorsefemale", "HCWagonhorsemale", "HCWagonoxen"}

PFGMenu.addWorldContext = function(player, context, worldobjects, test)	
	local pzPlayer = getSpecificPlayer(player)
	local items = PFGMenu.getItems(worldobjects[1]:getSquare())
	local carts = {}
	local cartCount = 0
	local closestCart = nil
	local closestCartDistance = 1000
	for i,v in ipairs(items) do
		if instanceof(v, "IsoWorldInventoryObject") then
			 if instanceof (v:getItem(),"InventoryContainer") then
				local type = v:getItem():getItemContainer():getType()
				for ti,tv in ipairs(PFGMenu.typesTable) do
					if tv == type then 
						table.insert(carts,v)
						cartCount = cartCount + 1
					end
				end
			end
		end
	end
	if cartCount > 0 then
		for i,v in ipairs(carts)do
			local distance = PFGMenu.getDistance2D(v:getWorldPosX(),v:getWorldPosY(),pzPlayer:getSquare():getX(),pzPlayer:getSquare():getY())
			if distance < closestCartDistance then 
				closestCart = v
				closestCartDistance = distance
			end
		end
		local label = "Grab " .. closestCart:getItem():getDisplayName()
		local selectOption = context:addOption(label,worldobjects,PFGMenu.equipCart,player,closestCart)
	end
end
--PFGMenu.addInventoryContext = function(player,context,inventoryObjects)
--	local pzPlayer = getSpecificPlayer(player)
--	local items = inventoryObjects
--	local selectOption = context:addOption("Push Cart",worldobjects,PFGMenu.equipCart,player,closestCart)
--end
PFGMenu.equipCart = function(worldobjects,player,item)
	local pzPlayer = getSpecificPlayer(player)
	local inv = pzPlayer:getInventory()
	ISTimedActionQueue.add(ISWalkToTimedAction:new(pzPlayer, item:getSquare()))
	ISTimedActionQueue.add(PFGPushAction:new(item,pzPlayer))
end

PFGMenu.getItems = function(square)
	local items ={}
	local squares ={}
	table.insert(squares,square)
	table.insert(squares,square:getN())
	table.insert(squares,square:getS())
	table.insert(squares,square:getE())
	table.insert(squares,square:getW())
	for si,s in ipairs(squares) do
		for ii,i in ipairs(s:getLuaTileObjectList()) do
			table.insert(items,i)
		end
	end
	return items
end

PFGMenu.getDistance2D = function(_x1, _y1, _x2, _y2)
	return math.sqrt(math.abs(_x2 - _x1)^2 + math.abs(_y2 - _y1)^2);
end
Events.OnFillWorldObjectContextMenu.Add(PFGMenu.addWorldContext)
--Events.OnPreFillInventoryObjectContextMenu.Add(PFGMenu.addInventoryContext)