--Fire Risks


function getBurned(items, result, player)

	--print (player:getDescriptor():getProfession())

	local bgt=player:getBodyDamage();
	local bodyParts = {bgt:getBodyPart(BodyPartType.Hand_R),bgt:getBodyPart(BodyPartType.Hand_L),bgt:getBodyPart(BodyPartType.ForeArm_L),bgt:getBodyPart(BodyPartType.ForeArm_R),bgt:getBodyPart(BodyPartType.Torso_Upper),bgt:getBodyPart(BodyPartType.Head)}
	local bodyProtection = {0,0,0,0,0,0}

	local bodyPart='';
	local inv = player:getInventory():getItems();
	local item ="";
	local itemType="";
	local burnPower=0;
	local count=0;


	--set protection
	for i = 0, inv:size() -1 do
		item=inv:get(i);
		itemType=item:getType();
		if item:isEquipped() then 

			if itemType == "HCFiresuit" then bodyProtection[1]=200;
				break
			end

			if itemType == "HCWorkgloves"				then bodyProtection[1]=15;bodyProtection[2]=15;
			elseif itemType == "HCGlovesHardLeather"	then bodyProtection[1]=20;bodyProtection[2]=20;
			elseif itemType == "Jacket_Fireman"			then bodyProtection[3]=10;bodyProtection[4]=10;bodyProtection[5]=bodyProtection[5]+10;
			elseif itemType == "HCBlacksmithapron"		then bodyProtection[5]=bodyProtection[5]+15;
			elseif itemType == "Hat_Fireman" 			then bodyProtection[6]=bodyProtection[6]+10;
			elseif itemType == "WeldingMask" 			then bodyProtection[6]=bodyProtection[6]+10;
			elseif itemType == "Glasses_SafetyGoggles" 	then bodyProtection[6]=bodyProtection[6]+5;
			end --chk clothing item

		end -- is equiped?
	end -- loop


	if HCNearKiln(player) 							then burnPower=10;
	elseif containsItem ("HCSmelter2",items) 		then burnPower=40;
	elseif containsItem ("HCBlastfurnace2",items) 	then burnPower=70;
	elseif containsItem ("HCFurnace2",items) 		then burnPower=100;
	end
	
	if(SandboxVars.Hydrocraft.BurnDamage ~= nil) then
		if(SandboxVars.Hydrocraft.BurnDamage == 2) then --50%
			burnPower = burnPower / 2
		elseif(SandboxVars.Hydrocraft.BurnDamage == 3) then --None
			burnPower = -100
		end
	end

	--print ("Burnpower before proffesion/trait/random: " .. burnPower);

	if player:getTraits():contains('Lucky') then
		burnPower = burnPower - ZombRand(10);
	else
		burnPower = burnPower + ZombRand(15); 
	end

	if player:getDescriptor():getProfession() == "fireofficer" then burnPower = burnPower - 30;end
	if player:getDescriptor():getProfession() == "metalworker" then burnPower = burnPower - 30;end

	--print ("Burnpower after proffesion/trait/random: " .. burnPower);
	if burnPower >= 100 then burnPower = 100;end
	--print ("Burnpower - start" .. burnPower);


	for count, bodyPart in ipairs(bodyParts) do

		burnPower=burnPower-bodyProtection[count] - ZombRand(10);
	--print("Protection:" .. bodyProtection[count]," Burnpower:  " .. burnPower)


		if (burnPower > 0) then
		bodyPart:AddDamage(burnPower);
		bodyPart:setBurned();
		player:getBodyDamage():SetBandaged(bodyPart:getIndex(), false, 0, false, nil);

		player:Say("Ouch, that burns!");
		player:getCurrentSquare():playSound("PZ_Fire", false);

		end

	end
end -- funtion


function KilnUse(items, result, player)

end

function SmeltUse(items, result, player)

end

function BFurnUse(items, result, player)

end

function IFurnUse(items, result, player)

end

function WandFire(items, result, player)
	--player:setOnFire(true);
end