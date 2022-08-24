require "ISCraftingUI"
HcISCraftingUI = ISCraftingUI:derive("HcISCraftingUI");
HcISCraftingUI.hasNewRecipes = false;

--Key is a recipe LuaOnTest! All recipe with that LuaOnTest will have an extra description
local eligibleCategories = {["HCNearKiln"] = "Hydrocraft.HCKiln", 
							["HCNearCarpybench"] = "Hydrocraft.HCCarpenterbench", 
							["HCNearSmelter"] = "Hydrocraft.HCSmelter", 
							["HCNearGrindstone"] = "Hydrocraft.HCGrindstone", 
							["HCNearTarkiln"] = "Hydrocraft.HCTarkiln", 
							["HCNearHerbatable"]= "Hydrocraft.HCHerbtable", }


local original_refresh = ISCraftingUI.refreshIngredientPanel
function ISCraftingUI:refreshIngredientPanel()
	original_refresh(self)
	
	--Display recipe modification
	local recipeListbox = self:getRecipeListBox()
    if not recipeListbox.items or #recipeListbox.items == 0 or not recipeListbox.items[recipeListbox.selected] then return end
		local selectedItem = recipeListbox.items[recipeListbox.selected].item;
		if eligibleCategories[selectedItem.category] ~= nil then 
			local fullType = eligibleCategories[selectedItem.category]
			local isAvailable = selectedItem.typesAvailable[fullType] ~= nil
			local data = {}
				data.selectedItem = selectedItem
				data.texture = self.TreeExpanded
				data.multipleHeader = true
				data.available = isAvailable
			self.ingredientPanel:addItem("Near: ", data)
			local targetStation = getScriptManager():FindItem(fullType)
			local stationData = {}
				stationData.selectedItem = selectedItem
				stationData.name = targetStation:getDisplayName()
				stationData.texture = targetStation:getNormalTexture()
				stationData.fullType = fullType
				stationData.count = 1
				stationData.recipe = selectedItem.recipe
				stationData.multiple = true
			self.ingredientPanel:addItem(stationData.name, stationData)
			self.ingredientPanel.doDrawItem = ISCraftingUI.drawNonEvolvedIngredient
	end
end

--Push extra item as "Near" in craft 
local original_getAvailable = ISCraftingUI.getAvailableItemsType
function ISCraftingUI:getAvailableItemsType()
	local result = original_getAvailable(self)
	
	local recipeListbox = self:getRecipeListBox()
    if not recipeListbox.items or #recipeListbox.items == 0 or not recipeListbox.items[recipeListbox.selected] then return end
	local selectedItem = recipeListbox.items[recipeListbox.selected].item;
	local luaTest = selectedItem.recipe:getLuaTest();
	if luaTest ~= nil and eligibleCategories[luaTest] ~= nil then 
		local isAvailable = HCItemsNearby.isFurnitureNearby(eligibleCategories[luaTest])
		if isAvailable then
			local fullType = eligibleCategories[luaTest]
			result[fullType] = 1
		else end
	end
	return result
end


--Cure those crafting lags!
local original_refresh = ISCraftingUI.refresh
function ISCraftingUI:refresh()
	if HcISCraftingUI.hasNewRecipes then
		original_refresh(self)
		HcISCraftingUI.hasNewRecipes = false
	end
end