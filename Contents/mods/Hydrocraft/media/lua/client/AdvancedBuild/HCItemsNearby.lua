-- ***********************************************************
-- **                    Hasis Furniture Finder                  **
-- ***********************************************************
HCItemsNearby = {}

function HCNearHerbatable(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCHerbtable') 
end 

function HCNearTarkiln(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCTarkiln') 
end 

function HCNearGrindstone(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCGrindstone') 
end 

function HCNearKiln(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCKiln') 
end 

function HCNearSmelter(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCSmelter') 
end 

function HCNearCarpybench(player)
return HCItemsNearby.isFurnitureNearby ('Hydrocraft.HCCarpenterbench') 
end 


function HCItemsNearby.isFurnitureNearby (fullID) 
	local x=math.floor(getPlayer():getX())          
	local y=math.floor(getPlayer():getY())
	local z=math.floor(getPlayer():getZ())
	local cell = nil
	local objstack = nil
	local objname = nil

	for x = x-1,x+1 do
		for y = y-1,y+1 do
			cell = getCell():getGridSquare(x,y,z)
			objstack = cell:getObjects()
			if objstack:size() > 1 then
				for i = 0, objstack:size()-1 do
  					modData = objstack:get(i):getModData()
  					if modData["need:"..fullID] ~= nil then 
  						--print (objstack:get(i):getName())
  						return true
  					end
  				end 
			end 
		end 
	end 

return false
end

