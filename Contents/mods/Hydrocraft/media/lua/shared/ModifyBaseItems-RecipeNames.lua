
--[[

Important:

How this works, by adding a Recipe Name to a base food item it can be accessed within an OnCreate function using:
	local recipe = result:getModData()["Hydrocraft_RecipeName"]
	
This allows access to the recipe used, which containts info about the amount of each ingredient to be used, e.g. Milk;2.

This allows us to calculate the nutritionally correct values.

See Recipe.OnCreate.Hydrocraft.MagicFoodRecipe in /lua/server/Food/Functions.lua

]]--

local scriptItem = ScriptManager.instance:getItem("Base.CerealBowl")
if scriptItem then
	scriptItem:DoParam("Hydrocraft_RecipeName = Make Bowl of Cereal")
end















