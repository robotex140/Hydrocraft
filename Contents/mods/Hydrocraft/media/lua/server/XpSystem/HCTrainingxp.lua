
--Archery Target
function HCTrainArcheryTarget_Trainingxp1(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 1);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCTrainArcheryTarget_Trainingxp2(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 2);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)	
end

function HCTrainArcheryTarget_Trainingxp3(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 3);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp4(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 4);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp5(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 5);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp6(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 6);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end

function HCTrainArcheryTarget_Trainingxp8(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Aiming, 8);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.01)		
end


--Punching Bag
function HCTrainPunchingBag_Trainingxp(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Nimble, 10);
	pl:getXp():AddXP(Perks.Lightfoot, 10);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end

function HCTrainPunchingBag_Trainingxp2(items, result, player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Nimble, pl:getPerkLevel(Perks.Nimble)*200);
	pl:getXp():AddXP(Perks.Lightfoot, pl:getPerkLevel(Perks.Lightfoot)*200);
end

--Weights
function HCTrainWeights_Trainingxp(player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Strength, 70);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end


function HCTrainWeights_Trainingxp2(player)
	local pl = getPlayer();
	pl:getXp():AddXP(Perks.Strength, pl:getPerkLevel(Perks.Strength)*200);
end


--Tredmill
function HCTrainTredmill_Trainingxp(player)
	local pl = getPlayer();
    pl:getXp():AddXP(Perks.Sprinting, 15);
    pl:getXp():AddXP(Perks.Fitness, 80);
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end

function HCTrainTredmill_Trainingxp2(player)
	local pl = getPlayer();
    pl:getXp():AddXP(Perks.Sprinting, pl:getPerkLevel(Perks.Sprinting)*30);
    pl:getXp():AddXP(Perks.Fitness, pl:getPerkLevel(Perks.Fitness)*200);   
	-- player:getStats():setHunger(player:getStats():getHunger()+0.05)		
end

