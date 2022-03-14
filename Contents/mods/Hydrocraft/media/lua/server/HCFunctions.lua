--************* HC Functions **************+
-- few functions being reused often




function hasItems (items, amount, player)

local itemsSize=items:size()-1;
local amountSize=amount:size()-1;


for i=0, itemsSize do
    print (items:get(i):getType())
if amountSize <= i then -- amout array is huge enough


--    if (items:get(i):getType() == "Cereal") then seeds= {'Hydrocraft.HCWheat','Hydrocraft.HCFlaxseeds'};
--    elseif (items:get(i):getType() == "Popcorn") then seeds={'Hydrocraft.HCCornseeds','Hydrocraft.HCCornredseeds','Hydrocraft.HCCornblueseeds'};
end 


end -- loop
end -- function




function containsItem (needle,haystack)
for i=0, haystack:size()-1 do
--print (haystack:get(i):getType())
if (haystack:get(i):getType()==needle) then return 1;
end 
end
end



