-- ***********************************************************
-- **                    Hasis Furniture Finder                  **
-- ***********************************************************


function HCNearHerbatable(player)
return isFurnitureNearby (player,'Herbalist Table') 
end 

function HCNearTarkiln(player)
return isFurnitureNearby (player,'Tarkiln') 
end 

function HCNearGrindstone(player)
return isFurnitureNearby (player,'Grindstone') 
end 

function HCNearKiln(player)
return isFurnitureNearby (player,'Kiln') 
end 

function HCNearCarpybench(player)
return isFurnitureNearby (player,'Carpybench') 
end 


function isFurnitureNearby (player,name) 
	local px=math.floor(getPlayer():getX())
	local py=math.floor(getPlayer():getY())
	local pz=math.floor(getPlayer():getZ())
	local cell = nil
	local objstack = nil
	local objname = nil

	for x = px-1,px+1 do
		for y = py-1,py+1 do
			cell = getCell():getGridSquare(x,y,pz)
			if(cell ~= nil) then
				objstack = cell:getObjects()
				if objstack:size() > 1 then
					for i = 0, objstack:size()-1 do
						objname = objstack:get(i):getName()
						if objname == name then
							--print (objname)
							return true
						end
					end
				end
			end
		end 
	end 

return false
end

