
require "NDRecipeActions.lua"

function loadItem(item)
    
    if(ItemTimeTrackerMod[item:getType()] ~= nil) then
        itemFound = true;
        item:getModData().Life = ItemTimeTrackerMod[item:getType()]["Life"];
        item:getModData().TurnInto = ItemTimeTrackerMod[item:getType()]["TurnInto"];
        item:getModData().StartTime = getGameTime():getWorldAgeHours();
        
        print("loadItem ",item:getType(),item:getModData().Life,item:getModData().TurnInto,item:getModData().StartTime)
        return true;
    else
        return false;
    end
end

function replaceItem(container,item)
	if item:getModData().Life~=nil and item:getModData().StartTime~=nil then
		local delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
        --print("replaceItem",item:getType(),item:getModData().Life,getGameTime():getWorldAgeHours(),item:getModData().StartTime,delta)
		if delta<0 then
			--FIx server time error bug
			item:getModData().StartTime = getGameTime():getWorldAgeHours();
			delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
		end
							
		if(item:getModData().Life < delta) then
								
			if item:getModData().TurnInto~="" then
				local temp = container:AddItem(item:getModData().TurnInto);							
				if (temp) then loadItem(temp)					
					dataCheck(item,temp)							
					container:addItemOnServer(temp);  
					--print("item:getModData().TurnInto",item:getModData().TurnInto) 
				end      
			end
								
			container:DoRemoveItem(item);
			container:removeItemOnServer(item);
			--print("replaceItem",item:getType(),item:getModData().TurnInto,item:getModData().Life,getGameTime():getWorldAgeHours(),item:getModData().StartTime,delta)
		end
	end
end

function dataCheck(item,temp)
	--Перенос инвентаря контейнера
	if (item:getCategory() == "Container") and (temp:getCategory() == "Container") then
		temp:getInventory():setItems(item:getInventory():getItems())
		--Сохранение имен контейнеров - translation: 'Saving container names'
		--Голодные животные к имени получают метку "голоден" - translation: Hungry animals get the "hungry" tag next to their name. 
		if string.find(item:getModData().TurnInto,"hungry") then
			temp:setName("hungry "..item:getName());
		else
			temp:setName(item:getName());
		end
	elseif (item:getCategory() == "Literature") and (temp:getCategory() == "Literature") then
		--Перенос содержимого блокнота - translation: 'Transferring Notebook Contents '
		recipe_saveOldPages(item,temp,getPlayer())
		--I have no idea what this is for, or if it is still necessary.
	end
end

function ContainerHandle(container)
    local items = container:getItems();
    if(items ~= nil) then
        for i=0,items:size()-1 do
            if(items:get(i) ~= nil) then
                if (items:get(i):getCategory() == "Container") then
					ContainerHandle(items:get(i):getItemContainer());
					replaceItem(container,items:get(i))
                else
                    if(items:get(i):getModData().Life == nil) then
                        loadItem(items:get(i));
                    else
						replaceItem(container,items:get(i))
                    end
                end
            end
        end
    end
end

function WorldItemReplace(item,square)
 
    local delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
    print("WorldItemReplace",item:getType(),"  Live:"..item:getModData().Life,"  GameTime:"..getGameTime():getWorldAgeHours(),"  StartTime:"..item:getModData().StartTime,"  Delta:"..delta)
			
	if delta<0 then
		--FIx server time error bug
		item:getModData().StartTime = getGameTime():getWorldAgeHours();
		delta = (getGameTime():getWorldAgeHours() - item:getModData().StartTime)
	end
							
    if(item:getModData().Life < delta) then
        
        local WI = item:getWorldItem();
        square:transmitRemoveItemFromSquare(WI);
        WI:removeFromSquare();
        if item:getModData().TurnInto~="" or item:getModData().TurnInto~="out" then
            local temp = instanceItem(item:getModData().TurnInto);
			if (temp) then 
				loadItem(temp) 
				dataCheck(item,temp)
			end
            temp = square:AddWorldInventoryItem(temp, 0.5, 0.5, 0, true);   
            --print("item:getModData().TurnInto",item:getModData().TurnInto)         
        end
                
    end
end
function WorldItemHandle(item,square)

    if(item:getModData().Life == nil) then
        loadItem(item);
    else
        
        if (item:getCategory() == "Container") then
			ContainerHandle(item:getItemContainer()) ;
        end

		WorldItemReplace(item,square)
    end

end

function ItemCheck()
  
    ContainerHandle(getPlayer():getInventory());--Весит NULL - translation: Weighs NULL
    
    local cell = getWorld():getCell();
    for x=(cell:getMinX()+10), (cell:getMaxX()-10) do
        for y=(cell:getMinY()+10), (cell:getMaxY()-10) do
            for z=(cell:getMinZ()), (cell:getMaxZ()) do
            
                local sq = cell:getGridSquare(x,y,z);
                if(sq ~= nil) then
                    local items = sq:getObjects();
                    for j=0, items:size()-1 do
                        if(items:get(j):getContainer() ~= nil) then
                           ContainerHandle(items:get(j):getContainer());                             
                        end
                    end
                    local items = sq:getWorldObjects();
                    for j=0, items:size()-1 do
                        if(items:get(j) and items:get(j):getItem()) then
                            WorldItemHandle(items:get(j):getItem(),sq);
                        end
                    end
                end
                
            end
        end
    end
    
end

Events.EveryDays.Add(ItemCheck);

--Updated 02/02/2022 by Hugo Qwerty.  The old version was calling ItemCheck every 300 ticks, which was causing frequent lag spikes.  I've amended the code to run just
--once a day (at midnight), so animals etc will only change status once a day - which I think is enough, every 10 minutes or every hour would seem
--excessive, I think.  I've also reformatted all the code, removed redundant code, and added translations to the original Russian comments.