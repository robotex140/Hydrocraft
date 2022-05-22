
--These will exist, but just in case
Recipe = Recipe or {}
Recipe.GetItemTypes = Recipe.GetItemTypes or {}

function Recipe.GetItemTypes.Potato(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Potato"))
end

function Recipe.GetItemTypes.RoastingPanFull(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("RoastingPanFull"))
end

function Recipe.GetItemTypes.PaperBagFull(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("PaperBagFull"))
end

function Recipe.GetItemTypes.ServeInPaperBag(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("ServeInPaperBag"))
end

function Recipe.GetItemTypes.Box12(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box12"))
end

function Recipe.GetItemTypes.Box100(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Box100"))
end

--Note: Recipe.GetItemTypes.Milk exists in Vanilla PZ
function Recipe.GetItemTypes.Cereal(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Cereal"))
end

function Recipe.GetItemTypes.NylonBag(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("NylonBag"))
end