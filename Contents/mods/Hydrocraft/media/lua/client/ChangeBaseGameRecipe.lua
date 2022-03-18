function unboxLogOnGround()
    local recipes = getScriptManager():getAllRecipes()
    for i = 0, recipes:size() - 1 do
        local recipe = recipes:get(i)
        if recipe:getName() == "Unstack Logs" then
            recipe:setCanBeDoneFromFloor(true); 
        end
    end
end

Events.OnGameBoot.Add(unboxLogOnGround);