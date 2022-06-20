require "Fishing/BuildingObjects/FishingNet"

local vanillaCheckTrap = fishingNet.checkTrap

--replace the vanilla function, which calls the vanilla function then maybe gives the player a Shrimp.
fishingNet.checkTrap = function(player, trap, hours)
	vanillaCheckTrap(player, trap, hours)
	if hours >= 8 then
		local fishing = player:getPerkLevel(Perks.Fishing)
		local r = ZombRand(10)
		if r < fishing then
			player:getInventory():AddItem("Base.Shrimp")
		end	
	end
end

--[[
--vanilla function
fishingNet.checkTrap = function(player, trap, hours)
    -- the fishnet can broke !
    local fishCaught = false;
    if hours > 15 and ZombRand(5) == 0 then
--        getSoundManager():PlayWorldSound("getFish", false, player:getSquare(), 1, 20, 1, false)
        player:playSound("CheckFishingNet");
        trap:getSquare():transmitRemoveItemFromSquare(trap);
        player:getInventory():AddItem("Base.BrokenFishingNet");
        return;
    end
    if hours > 20 then
        hours = 20;
    end
    for i=1,hours do
        if ZombRand(4) == 0 then
            player:getInventory():AddItem("Base.BaitFish");
            fishCaught = true;
        end
    end
    if fishCaught then
        fishCaught = false;
        player:getXp():AddXP(Perks.Fishing, 1);
    end
    fishingNet.doTimestamp(trap);
end
]]--