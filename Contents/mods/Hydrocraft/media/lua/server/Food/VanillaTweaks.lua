
Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}

--function copied from vanilla, added line to give players a jar lid in addition to the jar

-- set back the age of the food and give the jar back
function Recipe.OnCreate.OpenCannedFood(items, result, player)
	local jar = items:get(0);
	local aged = jar:getAge() / jar:getOffAgeMax();

	result:setAge(result:getOffAgeMax() * aged);

	local inv = player:getInventory()
	inv:AddItem("Base.EmptyJar")
	inv:AddItem("Base.JarLid")

end
