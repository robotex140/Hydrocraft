
function HCAddLogToInfiniteLogpile(items, result, player)

	local pile = nil

	for i=0, items:size()-1 do
		local it = items:get(i)
		if it:getFullType() == "Hydrocraft.HCInfiniteLogpile" then
			pile = it
		end
	end

	if pile == nil then
		print("Error: pile is nil!")
		return
	end

	local weight = pile:getActualWeight()
	--print(weight)

	pile:setCustomWeight(true)
	pile:setWeight(weight + 9)
	pile:setActualWeight(weight + 9)
	
	--print(pile:getWeight())
	
end

function HCRemoveLogFromInfiniteLogpile(items, result, player)

	local pile = nil

	for i=0, items:size()-1 do
		local it = items:get(i)
		if it:getFullType() == "Hydrocraft.HCInfiniteLogpile" then
			pile = it
		end
	end

	if pile == nil then
		print("Error: pile is nil!")
		return
	end

	local weight = pile:getActualWeight()
	if weight <= 0 then

		local container = pile:getContainer()
		if container ~= nil then
			container:Remove( pile )
		end

		local wi = pile:getWorldItem()
		if wi ~= nil then
			wi:getSquare():removeWorldObject(pile:getWorldItem())
		end
	else
		pile:setCustomWeight(true)
		pile:setWeight(weight - 9)
		pile:setActualWeight(weight - 9)
		player:getSquare():AddWorldInventoryItem("Base.Log", ZombRandFloat(0.1,0.9), ZombRandFloat(0.1,0.9), 0)
	end
end


function HCAddLogToInfiniteLogpileOak(items, result, player)

	local pile = nil

	for i=0, items:size()-1 do
		local it = items:get(i)
		if it:getFullType() == "Hydrocraft.HCInfiniteLogpileOak" then
			pile = it
		end
	end

	if pile == nil then
		print("Error: pile is nil!")
		return
	end

	local weight = pile:getActualWeight()
	--print(weight)

	pile:setCustomWeight(true)
	pile:setWeight(weight + 5)
	pile:setActualWeight(weight + 5)
	
	--print(pile:getWeight())
	
end

function HCRemoveLogFromInfiniteLogpileOak(items, result, player)

	local pile = nil

	for i=0, items:size()-1 do
		local it = items:get(i)
		if it:getFullType() == "Hydrocraft.HCInfiniteLogpileOak" then
			pile = it
		end
	end

	if pile == nil then
		print("Error: pile is nil!")
		return
	end

	local weight = pile:getActualWeight()
	if weight <= 0 then

		local container = pile:getContainer()
		if container ~= nil then
			container:Remove( pile )
		end

		local wi = pile:getWorldItem()
		if wi ~= nil then
			wi:getSquare():removeWorldObject(pile:getWorldItem())
		end
	else
		pile:setCustomWeight(true)
		pile:setWeight(weight - 5)
		pile:setActualWeight(weight - 5)
		player:getSquare():AddWorldInventoryItem("Hydrocraft.HCOakLog", ZombRandFloat(0.1,0.9), ZombRandFloat(0.1,0.9), 0)
	end
end