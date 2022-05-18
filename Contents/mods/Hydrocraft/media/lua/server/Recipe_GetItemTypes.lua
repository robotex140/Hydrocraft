
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
