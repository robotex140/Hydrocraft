--Hydrocraft Cooking handling



function HCCutMeatCubes(items, result, player)

local item
local NumberOfCubes
for i=0, items:size()-1 do
	item = items:get(i);
	if item:getCategory()=="Food" then
		print (item:isFresh());
		--if item:isFresh() == true then
		 	NumberOfCubes=math.floor(item:getBaseHungChange()*-20); -- 100 * cube_hunger_change(5)
		 	

		 	print (item:getBaseHungChange());
		 	print (NumberOfCubes);
		 	for j=1, NumberOfCubes do
				player:getInventory():AddItem("Hydrocraft.HCMeatCubes");
			end 
		--end 
	end 
end 
end 

