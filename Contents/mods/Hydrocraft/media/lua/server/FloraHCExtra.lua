
--Randomize findings for Gathering Flora.
function HCFloraGather(items, result, player)

if not player:isOutside() then player:Say("There are no flora indoors.");
return;
end

player:getStats():setFatigue(player:getStats():getFatigue()+0.01);


local skill = player:getPerkLevel(Perks.PlantScavenging);
local luck = ZombRand(16) + skill;
local ItemNr=0;
local count =0;
gatherFinds = {};


if  player:getTraits():contains('Lucky') then luck = luck + 3;
end

-- winter less luck + other items
if (getGameTime():getMonth() + 1) > 10 or (getGameTime():getMonth() + 1) < 3 then 
	if ZombRand(10) < 8  then luck=0;end -- winter unluck
	low = {'Hydrocraft.HCAcorn','Hydrocraft.HCFern','Hydrocraft.HCFiddleheadfern','Hydrocraft.HCYewbough','Hydrocraft.HCSprucebough','Hydrocraft.HCElmbough','Hydrocraft.HCAlderbough','Hydrocraft.HCWillowbranch','Base.TreeBranch','Base.Twigs','Hydrocraft.HCFirbough','Hydrocraft.HCPinebough','Hydrocraft.HCMapleleaf','Hydrocraft.HCHickoryleaves','Hydrocraft.HCOakleaves','Hydrocraft.HCWillowbark','Hydrocraft.HCBirchbark','Hydrocraft.HCBark','Hydrocraft.HCGrass'}
	medium = {'Base.Log','Hydrocraft.HCLobstershroom','Hydrocraft.HCYellowmorelshroom','Hydrocraft.HCWitchshatshroom','Base.MushroomGeneric7','Base.MushroomGeneric6','Base.MushroomGeneric5','Base.MushroomGeneric4','Base.MushroomGeneric3','Base.MushroomGeneric2','Base.MushroomGeneric1','Base.Rosehips','Hydrocraft.HCMulberryleaf','Hydrocraft.HCJutestems','Hydrocraft.HCAcorn'}
	good = {'Hydrocraft.HCOakLog','Hydrocraft.HCCandleberry','Hydrocraft.HCFlax'}

else
	-- no winter normal luck + all items
	low = {'Hydrocraft.HCAcorn','Hydrocraft.HCFlax','Base.BerryGeneric1','Base.BerryGeneric2','Base.BerryGeneric3','Base.BerryGeneric4','Hydrocraft.HCThistle','Base.Violets','Hydrocraft.HCClover','Hydrocraft.HCFern','Hydrocraft.HCFiddleheadfern','Hydrocraft.HCYewbough','Hydrocraft.HCSprucebough','Hydrocraft.HCElmbough','Hydrocraft.HCAlderbough','Hydrocraft.HCWillowbranch','Base.TreeBranch','Base.Twigs','Hydrocraft.HCFirbough','Hydrocraft.HCPinebough','Hydrocraft.HCMapleleaf','Hydrocraft.HCHickoryleaves','Hydrocraft.HCOakleaves','Hydrocraft.HCClover','Hydrocraft.HCWillowbark','Hydrocraft.HCBirchbark','Hydrocraft.HCBark','Hydrocraft.HCStraw','Hydrocraft.HCGrass','Hydrocraft.HCNettles'}
	medium = {'Hydrocraft.HCBleedingheart','Hydrocraft.HCCrabapple','Hydrocraft.HCSeaberry','Hydrocraft.HCBlackcurrant','Hydrocraft.HCRedcurrant','Hydrocraft.HCCrampbarkberry','Hydrocraft.HCGooseberry','Hydrocraft.HCHuckleberry','Hydrocraft.HCCranberry','Hydrocraft.HCArrowwoodberry','Hydrocraft.HCRaspberry','Hydrocraft.HCSumacberry','Hydrocraft.HCCrowberry','Hydrocraft.HCBlackthornberry','Hydrocraft.HCHawthornfruit','farming.Cabbage','farming.Potato','Base.Corn','Hydrocraft.HCTetterwort','Hydrocraft.HCMazus','Hydrocraft.HCCamellia','Hydrocraft.HCMorningglory','Hydrocraft.HCStrelitzia','Hydrocraft.HCColumbine','Hydrocraft.HCCinquefoils','Hydrocraft.HCChrysanthemum','Base.Log','Hydrocraft.HCSunflower','Hydrocraft.HCRhododendron','Hydrocraft.HCCalily','Hydrocraft.HCMagnolia','Hydrocraft.HCCarnation','Hydrocraft.HCBluedaisy','Hydrocraft.HCBlewitshroom','Hydrocraft.HCAnemome','Hydrocraft.HCDaffodil','Hydrocraft.HCTulip','Hydrocraft.HCPansy','Hydrocraft.HCDaisy','Hydrocraft.HCIris','Hydrocraft.HCWolfsbane','Hydrocraft.HCMandrake','Hydrocraft.HCBelladonna','Hydrocraft.HCLobstershroom','Hydrocraft.HCYellowmorelshroom','Hydrocraft.HCWitchshatshroom','Base.MushroomGeneric7','Base.MushroomGeneric6','Base.MushroomGeneric5','Base.MushroomGeneric4','Base.MushroomGeneric3','Base.MushroomGeneric2','Base.MushroomGeneric1','Base.Rosehips','Hydrocraft.HCValerian','Hydrocraft.HCCamomile','Hydrocraft.HCLavender','Hydrocraft.HCSpeedwell','Hydrocraft.HCDogwood','Hydrocraft.HCChantrelle','Hydrocraft.HCChicory','Hydrocraft.HCMulberry','Hydrocraft.HCMulberryleaf','Hydrocraft.HCKvann','Hydrocraft.HCHolly','Hydrocraft.HCJutestems','Hydrocraft.HCAcorn','Hydrocraft.HCThistle','Base.Violets','Hydrocraft.HCFlaxflower','Hydrocraft.HCFlax'}
	good = {'Base.Lemon','Base.Apple','Hydrocraft.HCRaspberry','Hydrocraft.HCOakLog','Hydrocraft.HCCamellia','Hydrocraft.HCCandleberry','Hydrocraft.HCRosebud','Hydrocraft.HCLavender'}
end


if luck <= 8 then player:Say("I found nothing!");
    return;
end

if luck < 15 then gatherFinds = low;
elseif luck < 22 then gatherFinds = medium;
else gatherFinds = good;
end

for _ in pairs(gatherFinds) do count = count + 1 end
ItemNr = ZombRand(count)+1;
player:getInventory():AddItem(gatherFinds[ItemNr]);
 


-- getting seeds from gathering flora in autum
if skill >7 and (getGameTime():getMonth() + 1) > 8 and (getGameTime():getMonth() + 1) < 11 and ZombRand(30) == 1 then
luck = ZombRand(11);
if luck == 0 then player:getInventory():AddItem("Hydrocraft.HCCottonseeds");
elseif luck == 1 then player:getInventory():AddItem("Hydrocraft.HCHempseeds");
elseif luck == 2 then player:getInventory():AddItem("Hydrocraft.HCPoppyseeds");
elseif luck == 3 then player:getInventory():AddItem("Hydrocraft.HCRubbertreeseeds");
elseif luck == 4 then player:getInventory():AddItem("Hydrocraft.HCSpirulinaseeds");
elseif luck == 5 then player:getInventory():AddItem("Hydrocraft.HCBasilseeds");
elseif luck == 6 then player:getInventory():AddItem("Hydrocraft.HCOreganoseeds");
elseif luck == 7 then player:getInventory():AddItem("Hydrocraft.HCBananaseeds");
elseif luck == 8 then player:getInventory():AddItem("Hydrocraft.HCOnionseeds");
elseif luck == 9 then player:getInventory():AddItem("Hydrocraft.HCWheat");
elseif luck == 10 then player:getInventory():AddItem("Hydrocraft.HCSoyBeans");
end 
end -- end get random seeds


-- getting med medherbs if Herbalist in summer
if player:getTraits():contains('Herbalist') and skill >7 and (getGameTime():getMonth() + 1) > 4 and (getGameTime():getMonth() + 1) < 10 and ZombRand(3) == 1 then
luck = ZombRand(5);
if luck == 0 then player:getInventory():AddItem("Base.Comfrey");
elseif luck == 1 then player:getInventory():AddItem("Base.WildGarlic");
elseif luck == 2 then player:getInventory():AddItem("Base.Plantain");
elseif luck == 3 then player:getInventory():AddItem("Base.Ginseng");
elseif luck == 4 then player:getInventory():AddItem("Base.LemonGrass");
end 
end 


player:getXp():AddXP(Perks.PlantScavenging, 10);
end


