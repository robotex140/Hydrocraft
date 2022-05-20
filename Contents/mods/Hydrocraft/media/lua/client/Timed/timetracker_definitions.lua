--[[

Life is number of (in game)hours to live before turning into "TurnInto"
for example 0.5 would be 30 in game minutes, 0.25 would be 15 minutes, 24.0 would be one day

TurnInto is the item that it will turn into after the amount of life time has expired

Make sure each you have ItemTimeTrackerMod["ItemCodeNameHERE"] = {}; before the Life and TurnInto lines (see examples below)
 
]]

if ItemTimeTrackerMod == nil then
ItemTimeTrackerMod = {}; -- DONT delete this!
end

local STARVATION = true

if(SandboxVars.Hydrocraft.AnimalStarvation ~= nil and SandboxVars.Hydrocraft.AnimalStarvation == 2) then
	STARVATION = false
end

--Hamster
--Without Food 2 Days

ItemTimeTrackerMod["HCHamstermale"] = {};   
ItemTimeTrackerMod["HCHamstermale"]["Life"] = 24.0;
ItemTimeTrackerMod["HCHamstermale"]["TurnInto"] = "Hydrocraft.HCHamstermalehungry";

if(STARVATION) then
ItemTimeTrackerMod["HCHamstermalehungry"] = {};   
ItemTimeTrackerMod["HCHamstermalehungry"]["Life"] = 24.0;
ItemTimeTrackerMod["HCHamstermalehungry"]["TurnInto"] = "Hydrocraft.HCHamsterdead";
elseif(ItemTimeTrackerMod["HCHamstermalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCHamstermalehungry"] = nil
end

ItemTimeTrackerMod["HCHamsterfemale"] = {};   
ItemTimeTrackerMod["HCHamsterfemale"]["Life"] = 24.0;
ItemTimeTrackerMod["HCHamsterfemale"]["TurnInto"] = "Hydrocraft.HCHamsterfemalehungry";

if(STARVATION) then
ItemTimeTrackerMod["HCHamsterfemalehungry"] = {};   
ItemTimeTrackerMod["HCHamsterfemalehungry"]["Life"] = 24.0;
ItemTimeTrackerMod["HCHamsterfemalehungry"]["TurnInto"] = "Hydrocraft.HCHamsterdead";
elseif(ItemTimeTrackerMod["HCHamsterfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCHamsterfemalehungry"] = nil
end

--Rabbit
--Without Food 2 Days

ItemTimeTrackerMod["HCRabbitmale"] = {};   
ItemTimeTrackerMod["HCRabbitmale"]["Life"] = 24.0;
ItemTimeTrackerMod["HCRabbitmale"]["TurnInto"] = "Hydrocraft.HCRabbitmalehungry";

if(STARVATION) then
ItemTimeTrackerMod["HCRabbitmalehungry"] = {};   
ItemTimeTrackerMod["HCRabbitmalehungry"]["Life"] = 24.0;
ItemTimeTrackerMod["HCRabbitmalehungry"]["TurnInto"] = "Base.DeadRabbit";
elseif(ItemTimeTrackerMod["HCRabbitmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCRabbitmalehungry"] = nil
end

ItemTimeTrackerMod["HCRabbitfemale"] = {};   
ItemTimeTrackerMod["HCRabbitfemale"]["Life"] = 24.0;
ItemTimeTrackerMod["HCRabbitfemale"]["TurnInto"] = "Hydrocraft.HCRabbitfemalehungry";

if(STARVATION) then
ItemTimeTrackerMod["HCRabbitfemalehungry"] = {};   
ItemTimeTrackerMod["HCRabbitfemalehungry"]["Life"] = 24.0;
ItemTimeTrackerMod["HCRabbitfemalehungry"]["TurnInto"] = "Base.DeadRabbit";
elseif(ItemTimeTrackerMod["HCRabbitfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCRabbitfemalehungry"] = nil
end

ItemTimeTrackerMod["HCRabbithutchfull"] = {};   
ItemTimeTrackerMod["HCRabbithutchfull"]["Life"] = 120.0;
ItemTimeTrackerMod["HCRabbithutchfull"]["TurnInto"] = "Hydrocraft.HCRabbithutchhungry";

if(STARVATION) then
ItemTimeTrackerMod["HCRabbithutchhungry"] = {};   
ItemTimeTrackerMod["HCRabbithutchhungry"]["Life"] = 120.0;
ItemTimeTrackerMod["HCRabbithutchhungry"]["TurnInto"] = "Hydrocraft.HCRabbithutch";
elseif(ItemTimeTrackerMod["HCRabbithutchhungry"] ~= nil) then
	ItemTimeTrackerMod["HCRabbithutchhungry"] = nil
end

ItemTimeTrackerMod["HCRabbithutchtired"] = {};   
ItemTimeTrackerMod["HCRabbithutchtired"]["Life"] = 168.0;
ItemTimeTrackerMod["HCRabbithutchtired"]["TurnInto"] = "Hydrocraft.HCRabbithutchfull";

--Chicken
--Without Food 2 Days

ItemTimeTrackerMod["HCChickenmale"] = {};   
ItemTimeTrackerMod["HCChickenmale"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenmale"]["TurnInto"] = "Hydrocraft.HCChickenmalehungry";
ItemTimeTrackerMod["HCChickenmale"]["ChangeSound"] = "rooster"; 

if(STARVATION) then
ItemTimeTrackerMod["HCChickenmalehungry"] = {};   
ItemTimeTrackerMod["HCChickenmalehungry"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenmalehungry"]["TurnInto"] = "Hydrocraft.HCChickendead";
elseif(ItemTimeTrackerMod["HCChickenmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCChickenmalehungry"] = nil
end

ItemTimeTrackerMod["HCChickenfemale"] = {};   
ItemTimeTrackerMod["HCChickenfemale"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenfemale"]["TurnInto"] = "Hydrocraft.HCChickenfemalehungry";
ItemTimeTrackerMod["HCChickenfemale"]["ChangeSound"] = "bock"; 

if(STARVATION) then
ItemTimeTrackerMod["HCChickenfemalehungry"] = {};   
ItemTimeTrackerMod["HCChickenfemalehungry"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenfemalehungry"]["TurnInto"] = "Hydrocraft.HCChickendead2";
elseif(ItemTimeTrackerMod["HCChickenfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCChickenfemalehungry"] = nil
end

ItemTimeTrackerMod["HCChickenmalebaby"] = {};   
ItemTimeTrackerMod["HCChickenmalebaby"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenmalebaby"]["TurnInto"] = "Hydrocraft.HCChickenmalehungry";
ItemTimeTrackerMod["HCChickenmalebaby"]["ChangeSound"] = "rooster2"; 

ItemTimeTrackerMod["HCChickenfemalebaby"] = {};   
ItemTimeTrackerMod["HCChickenfemalebaby"]["Life"] = 22.0;
ItemTimeTrackerMod["HCChickenfemalebaby"]["TurnInto"] = "Hydrocraft.HCChickenfemalehungry";
ItemTimeTrackerMod["HCChickenfemalebaby"]["ChangeSound"] = "bock"; 

ItemTimeTrackerMod["HCCoopfull"] = {};   
ItemTimeTrackerMod["HCCoopfull"]["Life"] = 118.0;
ItemTimeTrackerMod["HCCoopfull"]["TurnInto"] = "Hydrocraft.HCCoophungry"
ItemTimeTrackerMod["HCCoopfull"]["ChangeSound"] = "clucking"; 

if(STARVATION) then
ItemTimeTrackerMod["HCCoophungry"] = {};   
ItemTimeTrackerMod["HCCoophungry"]["Life"] = 118.0;
ItemTimeTrackerMod["HCCoophungry"]["TurnInto"] = "Hydrocraft.HCCoop";
elseif(ItemTimeTrackerMod["HCCoophungry"] ~= nil) then
	ItemTimeTrackerMod["HCCoophungry"] = nil
end

ItemTimeTrackerMod["HCCooptired"] = {};   
ItemTimeTrackerMod["HCCooptired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCCooptired"]["TurnInto"] = "Hydrocraft.HCCoopfull";
ItemTimeTrackerMod["HCCooptired"]["ChangeSound"] = "clucking"; 

--Pig
--Without Food 14 Days

ItemTimeTrackerMod["HCPigmale"] = {};   
ItemTimeTrackerMod["HCPigmale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCPigmale"]["TurnInto"] = "Hydrocraft.HCPigmalehungry";
ItemTimeTrackerMod["HCPigmale"]["ChangeSound"] = "oink"; 

if(STARVATION) then
ItemTimeTrackerMod["HCPigmalehungry"] = {};   
ItemTimeTrackerMod["HCPigmalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCPigmalehungry"]["TurnInto"] = "Hydrocraft.HCPigdead";
elseif(ItemTimeTrackerMod["HCPigmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCPigmalehungry"] = nil
end

ItemTimeTrackerMod["HCPigfemale"] = {};   
ItemTimeTrackerMod["HCPigfemale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCPigfemale"]["TurnInto"] = "Hydrocraft.HCPigfemalehungry";
ItemTimeTrackerMod["HCPigfemale"]["ChangeSound"] = "oink"; 

if(STARVATION) then
ItemTimeTrackerMod["HCPigfemalehungry"] = {};   
ItemTimeTrackerMod["HCPigfemalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCPigfemalehungry"]["TurnInto"] = "Hydrocraft.HCPigdead";
elseif(ItemTimeTrackerMod["HCPigfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCPigfemalehungry"] = nil
end

ItemTimeTrackerMod["HCPigmaletired"] = {};   
ItemTimeTrackerMod["HCPigmaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCPigmaletired"]["TurnInto"] = "Hydrocraft.HCPigmale";
ItemTimeTrackerMod["HCPigmaletired"]["ChangeSound"] = "oink"; 

ItemTimeTrackerMod["HCPigfemaletired"] = {};   
ItemTimeTrackerMod["HCPigfemaletired"]["Life"] = 166.0;
ItemTimeTrackerMod["HCPigfemaletired"]["TurnInto"] = "Hydrocraft.HCPigfemale";
ItemTimeTrackerMod["HCPigfemaletired"]["ChangeSound"] = "oink"; 

ItemTimeTrackerMod["HCPigmalebaby"] = {};   
ItemTimeTrackerMod["HCPigmalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCPigmalebaby"]["TurnInto"] = "Hydrocraft.HCPigmalehungry";
ItemTimeTrackerMod["HCPigmalebaby"]["ChangeSound"] = "oink"; 

ItemTimeTrackerMod["HCPigfemalebaby"] = {};   
ItemTimeTrackerMod["HCPigfemalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCPigfemalebaby"]["TurnInto"] = "Hydrocraft.HCPigfemalehungry";
ItemTimeTrackerMod["HCPigfemalebaby"]["ChangeSound"] = "oink"; 

--Sheep 
--Without Food 10 Days

ItemTimeTrackerMod["HCSheepmale"] = {};   
ItemTimeTrackerMod["HCSheepmale"]["Life"] = 118.0;
ItemTimeTrackerMod["HCSheepmale"]["TurnInto"] = "Hydrocraft.HCSheepmalehungry";
ItemTimeTrackerMod["HCSheepmale"]["ChangeSound"] = "baa"; 

if(STARVATION) then
ItemTimeTrackerMod["HCSheepmalehungry"] = {};   
ItemTimeTrackerMod["HCSheepmalehungry"]["Life"] = 118.0;
ItemTimeTrackerMod["HCSheepmalehungry"]["TurnInto"] = "Hydrocraft.HCSheepdead";
elseif(ItemTimeTrackerMod["HCSheepmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCSheepmalehungry"] = nil
end

ItemTimeTrackerMod["HCSheepfemale"] = {};   
ItemTimeTrackerMod["HCSheepfemale"]["Life"] = 118.0;
ItemTimeTrackerMod["HCSheepfemale"]["TurnInto"] = "Hydrocraft.HCSheepfemalehungry";
ItemTimeTrackerMod["HCSheepfemale"]["ChangeSound"] = "baa"; 

if(STARVATION) then
ItemTimeTrackerMod["HCSheepfemalehungry"] = {};   
ItemTimeTrackerMod["HCSheepfemalehungry"]["Life"] = 118.0;
ItemTimeTrackerMod["HCSheepfemalehungry"]["TurnInto"] = "Hydrocraft.HCSheepdead";
elseif(ItemTimeTrackerMod["HCSheepfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCSheepfemalehungry"] = nil
end

ItemTimeTrackerMod["HCSheepmaletired"] = {};   
ItemTimeTrackerMod["HCSheepmaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCSheepmaletired"]["TurnInto"] = "Hydrocraft.HCSheepmale";
ItemTimeTrackerMod["HCSheepmaletired"]["ChangeSound"] = "baa"; 

ItemTimeTrackerMod["HCSheepfemaletired"] = {};   
ItemTimeTrackerMod["HCSheepfemaletired"]["Life"] = 166.0;
ItemTimeTrackerMod["HCSheepfemaletired"]["TurnInto"] = "Hydrocraft.HCSheepfemale";
ItemTimeTrackerMod["HCSheepfemaletired"]["ChangeSound"] = "baa"; 

ItemTimeTrackerMod["HCSheepmalebaby"] = {};   
ItemTimeTrackerMod["HCSheepmalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCSheepmalebaby"]["TurnInto"] = "Hydrocraft.HCSheepmalehungry";
ItemTimeTrackerMod["HCSheepmalebaby"]["ChangeSound"] = "baa"; 

ItemTimeTrackerMod["HCSheepfemalebaby"] = {};   
ItemTimeTrackerMod["HCSheepfemalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCSheepfemalebaby"]["TurnInto"] = "Hydrocraft.HCSheepfemalehungry";
ItemTimeTrackerMod["HCSheepfemalebaby"]["ChangeSound"] = "baa"; 

ItemTimeTrackerMod["HCSheepmalesheared"] = {};   
ItemTimeTrackerMod["HCSheepmalesheared"]["Life"] = 166.0;
ItemTimeTrackerMod["HCSheepmalesheared"]["TurnInto"] = "Hydrocraft.HCSheepmale";
ItemTimeTrackerMod["HCSheepmalesheared"]["ChangeSound"] = "baa"; 

ItemTimeTrackerMod["HCSheepfemalesheared"] = {};   
ItemTimeTrackerMod["HCSheepfemalesheared"]["Life"] = 166.0;
ItemTimeTrackerMod["HCSheepfemalesheared"]["TurnInto"] = "Hydrocraft.HCSheepfemale";
ItemTimeTrackerMod["HCSheepfemalesheared"]["ChangeSound"] = "baa"; 

--Goat
--Without Food 10 Days

ItemTimeTrackerMod["HCGoatmale"] = {};   
ItemTimeTrackerMod["HCGoatmale"]["Life"] = 118.0;
ItemTimeTrackerMod["HCGoatmale"]["TurnInto"] = "Hydrocraft.HCGoatmalehungry";
ItemTimeTrackerMod["HCGoatmale"]["ChangeSound"] = "meeh"; 

if(STARVATION) then
ItemTimeTrackerMod["HCGoatmalehungry"] = {};   
ItemTimeTrackerMod["HCGoatmalehungry"]["Life"] = 118.0;
ItemTimeTrackerMod["HCGoatmalehungry"]["TurnInto"] = "Hydrocraft.HCGoatdead";
elseif(ItemTimeTrackerMod["HCGoatmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCGoatmalehungry"] = nil
end

ItemTimeTrackerMod["HCGoatfemale"] = {};   
ItemTimeTrackerMod["HCGoatfemale"]["Life"] = 118.0;
ItemTimeTrackerMod["HCGoatfemale"]["TurnInto"] = "Hydrocraft.HCGoatfemalehungry";
ItemTimeTrackerMod["HCGoatfemale"]["ChangeSound"] = "meeh"; 

if(STARVATION) then
ItemTimeTrackerMod["HCGoatfemalehungry"] = {};   
ItemTimeTrackerMod["HCGoatfemalehungry"]["Life"] = 118.0;
ItemTimeTrackerMod["HCGoatfemalehungry"]["TurnInto"] = "Hydrocraft.HCGoatdead2";
elseif(ItemTimeTrackerMod["HCGoatfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCGoatfemalehungry"] = nil
end

ItemTimeTrackerMod["HCGoatmaletired"] = {};   
ItemTimeTrackerMod["HCGoatmaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCGoatmaletired"]["TurnInto"] = "Hydrocraft.HCGoatmale";
ItemTimeTrackerMod["HCGoatmaletired"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatfemaletired"] = {};   
ItemTimeTrackerMod["HCGoatfemaletired"]["Life"] = 166.0;
ItemTimeTrackerMod["HCGoatfemaletired"]["TurnInto"] = "Hydrocraft.HCGoatfemale";
ItemTimeTrackerMod["HCGoatfemaletired"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatmalebaby"] = {};   
ItemTimeTrackerMod["HCGoatmalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCGoatmalebaby"]["TurnInto"] = "Hydrocraft.HCGoatmalehungry";
ItemTimeTrackerMod["HCGoatmalebaby"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatfemalebaby"] = {};   
ItemTimeTrackerMod["HCGoatfemalebaby"]["Life"] = 334.0;
ItemTimeTrackerMod["HCGoatfemalebaby"]["TurnInto"] = "Hydrocraft.HCGoatfemalehungry";
ItemTimeTrackerMod["HCGoatfemalebaby"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatmalesheared"] = {};   
ItemTimeTrackerMod["HCGoatmalesheared"]["Life"] = 116.0;
ItemTimeTrackerMod["HCGoatmalesheared"]["TurnInto"] = "Hydrocraft.HCGoatmale";
ItemTimeTrackerMod["HCGoatmalesheared"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatfemalesheared"] = {};   
ItemTimeTrackerMod["HCGoatfemalesheared"]["Life"] = 116.0;
ItemTimeTrackerMod["HCGoatfemalesheared"]["TurnInto"] = "Hydrocraft.HCGoatfemale";
ItemTimeTrackerMod["HCGoatfemalesheared"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatfemaletired2"] = {};   
ItemTimeTrackerMod["HCGoatfemaletired2"]["Life"] = 22.0;
ItemTimeTrackerMod["HCGoatfemaletired2"]["TurnInto"] = "Hydrocraft.HCGoatfemaletired";
ItemTimeTrackerMod["HCGoatfemaletired2"]["ChangeSound"] = "meeh"; 

ItemTimeTrackerMod["HCGoatfemaletired"] = {};   
ItemTimeTrackerMod["HCGoatfemaletired"]["Life"] = 70.0;
ItemTimeTrackerMod["HCGoatfemaletired"]["TurnInto"] = "Hydrocraft.HCGoatfemalehungry";
ItemTimeTrackerMod["HCGoatfemaletired"]["ChangeSound"] = "meeh"; 

--Cow
--Without Food 6 Days

ItemTimeTrackerMod["HCCowmale"] = {};   
ItemTimeTrackerMod["HCCowmale"]["Life"] = 70.0;
ItemTimeTrackerMod["HCCowmale"]["TurnInto"] = "Hydrocraft.HCCowmalehungry";
ItemTimeTrackerMod["HCCowmale"]["ChangeSound"] = "moo2"; 

if(STARVATION) then
ItemTimeTrackerMod["HCCowmalehungry"] = {};   
ItemTimeTrackerMod["HCCowmalehungry"]["Life"] = 70.0;
ItemTimeTrackerMod["HCCowmalehungry"]["TurnInto"] = "Hydrocraft.HCCowdead";
elseif(ItemTimeTrackerMod["HCCowmalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCCowmalehungry"] = nil
end

ItemTimeTrackerMod["HCCowfemale"] = {};   
ItemTimeTrackerMod["HCCowfemale"]["Life"] = 70.0;
ItemTimeTrackerMod["HCCowfemale"]["TurnInto"] = "Hydrocraft.HCCowfemalehungry";
ItemTimeTrackerMod["HCCowfemale"]["ChangeSound"] = "moo"; 

if(STARVATION) then
ItemTimeTrackerMod["HCCowfemalehungry"] = {};   
ItemTimeTrackerMod["HCCowfemalehungry"]["Life"] = 70.0;
ItemTimeTrackerMod["HCCowfemalehungry"]["TurnInto"] = "Hydrocraft.HCCowdead2";
elseif(ItemTimeTrackerMod["HCCowfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCCowfemalehungry"] = nil
end

ItemTimeTrackerMod["HCCowmaletired"] = {};   
ItemTimeTrackerMod["HCCowmaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCCowmaletired"]["TurnInto"] = "Hydrocraft.HCCowmale";
ItemTimeTrackerMod["HCCowmaletired"]["ChangeSound"] = "moo2"; 

ItemTimeTrackerMod["HCCowfemaletired"] = {};   
ItemTimeTrackerMod["HCCowfemaletired"]["Life"] = 334.0;
ItemTimeTrackerMod["HCCowfemaletired"]["TurnInto"] = "Hydrocraft.HCCowfemale";
ItemTimeTrackerMod["HCCowfemaletired"]["ChangeSound"] = "moo"; 

ItemTimeTrackerMod["HCCowmalebaby"] = {};   
ItemTimeTrackerMod["HCCowmalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCCowmalebaby"]["TurnInto"] = "Hydrocraft.HCCowmalehungry";
ItemTimeTrackerMod["HCCowmalebaby"]["ChangeSound"] = "moo2"; 

ItemTimeTrackerMod["HCCowfemalebaby"] = {};   
ItemTimeTrackerMod["HCCowfemalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCCowfemalebaby"]["TurnInto"] = "Hydrocraft.HCCowfemalehungry";
ItemTimeTrackerMod["HCCowfemalebaby"]["ChangeSound"] = "moo"; 

ItemTimeTrackerMod["HCCowfemaletired2"] = {};   
ItemTimeTrackerMod["HCCowfemaletired2"]["Life"] = 22.0;
ItemTimeTrackerMod["HCCowfemaletired2"]["TurnInto"] = "Hydrocraft.HCCowfemaletired";
ItemTimeTrackerMod["HCCowfemaletired2"]["ChangeSound"] = "moo"; 

ItemTimeTrackerMod["HCCowfemaletired"] = {};   
ItemTimeTrackerMod["HCCowfemaletired"]["Life"] = 70.0;
ItemTimeTrackerMod["HCCowfemaletired"]["TurnInto"] = "Hydrocraft.HCCowfemalehungry";
ItemTimeTrackerMod["HCCowfemaletired"]["ChangeSound"] = "moo"; 

--Donkey
--Without Food 14 Days

ItemTimeTrackerMod["HCDonkeymale"] = {};   
ItemTimeTrackerMod["HCDonkeymale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCDonkeymale"]["TurnInto"] = "Hydrocraft.HCDonkeymalehungry";
ItemTimeTrackerMod["HCDonkeymale"]["ChangeSound"] = "heehaw"; 

if(STARVATION) then
ItemTimeTrackerMod["HCDonkeymalehungry"] = {};   
ItemTimeTrackerMod["HCDonkeymalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCDonkeymalehungry"]["TurnInto"] = "Hydrocraft.HCDonkeydead";
elseif(ItemTimeTrackerMod["HCDonkeymalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCDonkeymalehungry"] = nil
end

ItemTimeTrackerMod["HCDonkeyfemale"] = {};   
ItemTimeTrackerMod["HCDonkeyfemale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCDonkeyfemale"]["TurnInto"] = "Hydrocraft.HCDonkeyfemalehungry";
ItemTimeTrackerMod["HCDonkeyfemale"]["ChangeSound"] = "heehaw"; 

if(STARVATION) then
ItemTimeTrackerMod["HCDonkeyfemalehungry"] = {};   
ItemTimeTrackerMod["HCDonkeyfemalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCDonkeyfemalehungry"]["TurnInto"] = "Hydrocraft.HCDonkeydead";
elseif(ItemTimeTrackerMod["HCDonkeyfemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCDonkeyfemalehungry"] = nil
end

ItemTimeTrackerMod["HCDonkeymaletired"] = {};   
ItemTimeTrackerMod["HCDonkeymaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCDonkeymaletired"]["TurnInto"] = "Hydrocraft.HCDonkeymale";
ItemTimeTrackerMod["HCDonkeymaletired"]["ChangeSound"] = "heehaw"; 

ItemTimeTrackerMod["HCDonkeyfemaletired"] = {};   
ItemTimeTrackerMod["HCDonkeyfemaletired"]["Life"] = 334.0;
ItemTimeTrackerMod["HCDonkeyfemaletired"]["TurnInto"] = "Hydrocraft.HCDonkeyfemale";
ItemTimeTrackerMod["HCDonkeyfemaletired"]["ChangeSound"] = "heehaw"; 

ItemTimeTrackerMod["HCDonkeymalebaby"] = {};   
ItemTimeTrackerMod["HCDonkeymalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCDonkeymalebaby"]["TurnInto"] = "Hydrocraft.HCDonkeymalehungry";
ItemTimeTrackerMod["HCDonkeymalebaby"]["ChangeSound"] = "heehaw"; 

ItemTimeTrackerMod["HCDonkeyfemalebaby"] = {};   
ItemTimeTrackerMod["HCDonkeyfemalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCDonkeyfemalebaby"]["TurnInto"] = "Hydrocraft.HCDonkeyfemalehungry";
ItemTimeTrackerMod["HCDonkeyfemalebaby"]["ChangeSound"] = "heehaw"; 

--Horse
--Without Food 14 Days

ItemTimeTrackerMod["HCHorsemale"] = {};   
ItemTimeTrackerMod["HCHorsemale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCHorsemale"]["TurnInto"] = "Hydrocraft.HCHorsemalehungry";
ItemTimeTrackerMod["HCHorsemale"]["ChangeSound"] = "neigh";

if(STARVATION) then
ItemTimeTrackerMod["HCHorsemalehungry"] = {};   
ItemTimeTrackerMod["HCHorsemalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCHorsemalehungry"]["TurnInto"] = "Hydrocraft.HCHorsedead";
elseif(ItemTimeTrackerMod["HCHorsemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCHorsemalehungry"] = nil
end

ItemTimeTrackerMod["HCHorsefemale"] = {};   
ItemTimeTrackerMod["HCHorsefemale"]["Life"] = 166.0;
ItemTimeTrackerMod["HCHorsefemale"]["TurnInto"] = "Hydrocraft.HCHorsefemalehungry";
ItemTimeTrackerMod["HCHorsefemale"]["ChangeSound"] = "neigh";

if(STARVATION) then
ItemTimeTrackerMod["HCHorsefemalehungry"] = {};   
ItemTimeTrackerMod["HCHorsefemalehungry"]["Life"] = 166.0;
ItemTimeTrackerMod["HCHorsefemalehungry"]["TurnInto"] = "Hydrocraft.HCHorsedead";
elseif(ItemTimeTrackerMod["HCHorsefemalehungry"] ~= nil) then
	ItemTimeTrackerMod["HCHorsefemalehungry"] = nil
end

ItemTimeTrackerMod["HCHorsemaletired"] = {};   
ItemTimeTrackerMod["HCHorsemaletired"]["Life"] = 22.0;
ItemTimeTrackerMod["HCHorsemaletired"]["TurnInto"] = "Hydrocraft.HCHorsemale";
ItemTimeTrackerMod["HCHorsemaletired"]["ChangeSound"] = "neigh"; 

ItemTimeTrackerMod["HCHorsefemaletired"] = {};   
ItemTimeTrackerMod["HCHorsefemaletired"]["Life"] = 334.0;
ItemTimeTrackerMod["HCHorsefemaletired"]["TurnInto"] = "Hydrocraft.HCHorsefemale";
ItemTimeTrackerMod["HCHorsefemaletired"]["ChangeSound"] = "neigh"; 

ItemTimeTrackerMod["HCHorsemalebaby"] = {};   
ItemTimeTrackerMod["HCHorsemalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCHorsemalebaby"]["TurnInto"] = "Hydrocraft.HCHorsemalehungry";
ItemTimeTrackerMod["HCHorsemalebaby"]["ChangeSound"] = "neigh"; 

ItemTimeTrackerMod["HCHorsefemalebaby"] = {};   
ItemTimeTrackerMod["HCHorsefemalebaby"]["Life"] = 670.0;
ItemTimeTrackerMod["HCHorsefemalebaby"]["TurnInto"] = "Hydrocraft.HCHorsefemalehungry";
ItemTimeTrackerMod["HCHorsefemalebaby"]["ChangeSound"] = "neigh"; 

--Red Wine
--14 Days for Grape Juice to Wine

ItemTimeTrackerMod["HCBarrelgrape"] = {};   
ItemTimeTrackerMod["HCBarrelgrape"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelgrape"]["TurnInto"] = "Hydrocraft.HCBarrelwine";

--White Wine
--14 Days for Grape Juice to Wine

ItemTimeTrackerMod["HCBarrelgrapegreen"] = {};   
ItemTimeTrackerMod["HCBarrelgrapegreen"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelgrapegreen"]["TurnInto"] = "Hydrocraft.HCBarrelwinewhite";

--Mead
--14 Days for Honey Brew to Mead

ItemTimeTrackerMod["HCBarrelhoney"] = {};   
ItemTimeTrackerMod["HCBarrelhoney"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelhoney"]["TurnInto"] = "Hydrocraft.HCBarrelmead";

--Mead
--14 Days for Rice Mash to Sake

ItemTimeTrackerMod["HCBarrelrice"] = {};   
ItemTimeTrackerMod["HCBarrelrice"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelrice"]["TurnInto"] = "Hydrocraft.HCBarrelsake";

--Vinegar
--14 Days for Wine to Vinegar

ItemTimeTrackerMod["HCBarrelwine"] = {};   
ItemTimeTrackerMod["HCBarrelwine"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelwine"]["TurnInto"] = "Hydrocraft.HCBarrelvinegar";

--Vinegar
--14 Days for Wine to Vinegar

ItemTimeTrackerMod["HCBarrelwinewhite"] = {};   
ItemTimeTrackerMod["HCBarrelwinewhite"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelwinewhite"]["TurnInto"] = "Hydrocraft.HCBarrelvinegar";

--Vinegar
--14 Days for Mead to Vinegar

ItemTimeTrackerMod["HCBarrelmead"] = {};   
ItemTimeTrackerMod["HCBarrelmead"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelmead"]["TurnInto"] = "Hydrocraft.HCBarrelvinegar";

--Vinegar
--14 Days for Sake to Vinegar

ItemTimeTrackerMod["HCBarrelsake"] = {};   
ItemTimeTrackerMod["HCBarrelsake"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBarrelsake"]["TurnInto"] = "Hydrocraft.HCBarrelvinegar";

--BarrelLemon
--28 Days for Lemon Mash Barrels
ItemTimeTrackerMod["HCBarrelLemon"] = {};   
ItemTimeTrackerMod["HCBarrelLemon"]["Life"] = 720.0;
ItemTimeTrackerMod["HCBarrelLemon"]["TurnInto"] = "Hydrocraft.HCBarrelLemonFermented";

--Cheese
--7 Days to Age Cheese

ItemTimeTrackerMod["HCCheeserackfull"] = {};   
ItemTimeTrackerMod["HCCheeserackfull"]["Life"] = 168.0;
ItemTimeTrackerMod["HCCheeserackfull"]["TurnInto"] = "Hydrocraft.HCCheeserackaged";

--Cheddar Cheese
--7 Days to Age Cheddar Cheese

ItemTimeTrackerMod["HCCheeserackfullcheddar"] = {};   
ItemTimeTrackerMod["HCCheeserackfullcheddar"]["Life"] = 168.0;
ItemTimeTrackerMod["HCCheeserackfullcheddar"]["TurnInto"] = "Hydrocraft.HCCheeserackagedcheddar";

--Waxed Cheddar Cheese
--7 Days to Age Waxed Cheddar Cheese

ItemTimeTrackerMod["HCCheeserackfullcheddarwaxed"] = {};   
ItemTimeTrackerMod["HCCheeserackfullcheddarwaxed"]["Life"] = 168.0;
ItemTimeTrackerMod["HCCheeserackfullcheddarwaxed"]["TurnInto"] = "Hydrocraft.HCCheeserackagedcheddarwaxed";

--Fir Sprout to Fir Sapling
-- 24 Hours

ItemTimeTrackerMod["HCFir1"] = {};   
ItemTimeTrackerMod["HCFir1"]["Life"] = 24.0;
ItemTimeTrackerMod["HCFir1"]["TurnInto"] = "Hydrocraft.HCFir2";

--Fir Sapling to Young Fir Tree
-- 7 Days

ItemTimeTrackerMod["HCFir2"] = {};   
ItemTimeTrackerMod["HCFir2"]["Life"] = 168.0;
ItemTimeTrackerMod["HCFir2"]["TurnInto"] = "Hydrocraft.HCFir3";

--Young Fir Tree to Adult Fir Tree
-- 14 Days

ItemTimeTrackerMod["HCFir3"] = {};   
ItemTimeTrackerMod["HCFir3"]["Life"] = 336.0;
ItemTimeTrackerMod["HCFir3"]["TurnInto"] = "Hydrocraft.HCFir4";

--Adult Fir Tree to Elder Fir Tree
-- 30 Days

ItemTimeTrackerMod["HCFir4"] = {};   
ItemTimeTrackerMod["HCFir4"]["Life"] = 720.0;
ItemTimeTrackerMod["HCFir4"]["TurnInto"] = "Hydrocraft.HCFir5";

--Elder Fir Tree to Ancient Fir Tree
-- 30 Days

ItemTimeTrackerMod["HCFir5"] = {};   
ItemTimeTrackerMod["HCFir5"]["Life"] = 720.0;
ItemTimeTrackerMod["HCFir5"]["TurnInto"] = "Hydrocraft.HCFir6";

--Oak Sprout to Oak Sapling
-- 24 Hours

ItemTimeTrackerMod["HCOak1"] = {};   
ItemTimeTrackerMod["HCOak1"]["Life"] = 24.0;
ItemTimeTrackerMod["HCOak1"]["TurnInto"] = "Hydrocraft.HCOak2";

--Oak Sapling to Young Oak Tree
-- 7 Days

ItemTimeTrackerMod["HCOak2"] = {};   
ItemTimeTrackerMod["HCOak2"]["Life"] = 168.0;
ItemTimeTrackerMod["HCOak2"]["TurnInto"] = "Hydrocraft.HCOak3";

--Young Oak Tree to Adult Oak Tree
-- 14 Days

ItemTimeTrackerMod["HCOak3"] = {};   
ItemTimeTrackerMod["HCOak3"]["Life"] = 336.0;
ItemTimeTrackerMod["HCOak3"]["TurnInto"] = "Hydrocraft.HCOak4";

--Adult Oak Tree to Elder Oak Tree
-- 30 Days

ItemTimeTrackerMod["HCOak4"] = {};   
ItemTimeTrackerMod["HCOak4"]["Life"] = 720.0;
ItemTimeTrackerMod["HCOak4"]["TurnInto"] = "Hydrocraft.HCOak5";

--Elder Oak Tree to Ancient Oak Tree
-- 30 Days

ItemTimeTrackerMod["HCOak5"] = {};   
ItemTimeTrackerMod["HCOak5"]["Life"] = 720.0;
ItemTimeTrackerMod["HCOak5"]["TurnInto"] = "Hydrocraft.HCOak6";

--Birch Sprout to Birch Sapling
-- 24 Hours

ItemTimeTrackerMod["HCBirch1"] = {};   
ItemTimeTrackerMod["HCBirch1"]["Life"] = 24.0;
ItemTimeTrackerMod["HCBirch1"]["TurnInto"] = "Hydrocraft.HCBirch2";

--Birch Sapling to Young Birch Tree
-- 7 Days

ItemTimeTrackerMod["HCBirch2"] = {};   
ItemTimeTrackerMod["HCBirch2"]["Life"] = 168.0;
ItemTimeTrackerMod["HCBirch2"]["TurnInto"] = "Hydrocraft.HCBirch3";

--Young Birch Tree to Adult Birch Tree
-- 14 Days

ItemTimeTrackerMod["HCBirch3"] = {};   
ItemTimeTrackerMod["HCBirch3"]["Life"] = 336.0;
ItemTimeTrackerMod["HCBirch3"]["TurnInto"] = "Hydrocraft.HCBirch4";

--Adult Birch Tree to Elder Birch Tree
-- 30 Days

ItemTimeTrackerMod["HCBirch4"] = {};   
ItemTimeTrackerMod["HCBirch4"]["Life"] = 720.0;
ItemTimeTrackerMod["HCBirch4"]["TurnInto"] = "Hydrocraft.HCBirch5";

--Elder Birch Tree to Ancient Birch Tree
-- 30 Days

ItemTimeTrackerMod["HCBirch5"] = {};   
ItemTimeTrackerMod["HCBirch5"]["Life"] = 720.0;
ItemTimeTrackerMod["HCBirch5"]["TurnInto"] = "Hydrocraft.HCBirch6";

--Bee Hive Stage 1
-- 7 Days

ItemTimeTrackerMod["HCBeehive1Active"] = {};   
ItemTimeTrackerMod["HCBeehive1Active"]["Life"] = 168;
ItemTimeTrackerMod["HCBeehive1Active"]["TurnInto"] = "Hydrocraft.HCBeehive1full";

--Bee Hive Stage 2
-- 7 Days

ItemTimeTrackerMod["HCBeehive2Active"] = {};   
ItemTimeTrackerMod["HCBeehive2Active"]["Life"] = 168;
ItemTimeTrackerMod["HCBeehive2Active"]["TurnInto"] = "Hydrocraft.HCBeehive2full";

-- Bee Hive Stage 3
-- 7 Days

ItemTimeTrackerMod["HCBeehive3Active"] = {};   
ItemTimeTrackerMod["HCBeehive3Active"]["Life"] = 168;
ItemTimeTrackerMod["HCBeehive3Active"]["TurnInto"] = "Hydrocraft.HCBeehive3full";

-- Bee Hive Stage 3 ancored
-- 7 Days
ItemTimeTrackerMod["HCBeehive3bActive"] = {};   
ItemTimeTrackerMod["HCBeehive3bActive"]["Life"] = 168;
ItemTimeTrackerMod["HCBeehive3bActive"]["TurnInto"] = "Hydrocraft.HCBeehive3bfull";


-- Silkworm Eggs to Silkworm
-- 48 Hours

ItemTimeTrackerMod["HCSilkegg"] = {};   
ItemTimeTrackerMod["HCSilkegg"]["Life"] = 48.0;
ItemTimeTrackerMod["HCSilkegg"]["TurnInto"] = "Hydrocraft.HCSilkwom";

-- Silkworm Cocoon
-- 48 Hours

ItemTimeTrackerMod["HCSilkcocoon"] = {};   
ItemTimeTrackerMod["HCSilkcocoon"]["Life"] = 48.0;
ItemTimeTrackerMod["HCSilkcocoon"]["TurnInto"] = "Hydrocraft.HCSilkcocoon2";

--Solar Park
-- 24 Hours

ItemTimeTrackerMod["HCSolarpark"] = {};   
ItemTimeTrackerMod["HCSolarpark"]["Life"] = 24.0;
ItemTimeTrackerMod["HCSolarpark"]["TurnInto"] = "Hydrocraft.HCSolarparkcharged";

--Charged Solar Park
-- 24 Hours

ItemTimeTrackerMod["HCSolarparkcharged"] = {};
ItemTimeTrackerMod["HCSolarparkcharged"]["Life"] = 24.0;
ItemTimeTrackerMod["HCSolarparkcharged"]["TurnInto"] = "Hydrocraft.HCSolarparkcharged";

-- Penecilinum
-- 24 Hours

ItemTimeTrackerMod["HCPetripenicillium"] = {};   
ItemTimeTrackerMod["HCPetripenicillium"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetripenicillium"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Zoomed Penecilinum
-- 24 Hours

ItemTimeTrackerMod["HCPetripenecilinumzoom"] = {};   
ItemTimeTrackerMod["HCPetripenecilinumzoom"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetripenecilinumzoom"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Aspergillus
-- 24 Hours

ItemTimeTrackerMod["HCPetriaspergillus"] = {};   
ItemTimeTrackerMod["HCPetriaspergillus"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetriaspergillus"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Zoomed Aspergillus
-- 24 Hours

ItemTimeTrackerMod["HCPetriaspergilluszoom"] = {};   
ItemTimeTrackerMod["HCPetriaspergilluszoom"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetriaspergilluszoom"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Yeast
-- 24 Hours

ItemTimeTrackerMod["HCPetriyeast"] = {};   
ItemTimeTrackerMod["HCPetriyeast"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetriyeast"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Zoomed Yeast
-- 24 Hours

ItemTimeTrackerMod["HCPetriyeastzoom"] = {};   
ItemTimeTrackerMod["HCPetriyeastzoom"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetriyeastzoom"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Slime Mold
-- 24 Hours

ItemTimeTrackerMod["HCPetrididymium"] = {};   
ItemTimeTrackerMod["HCPetrididymium"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetrididymium"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Zoomed Slime Mold
-- 24 Hours

ItemTimeTrackerMod["HCPetrididymiumzoom"] = {};   
ItemTimeTrackerMod["HCPetrididymiumzoom"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetrididymiumzoom"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Empty Petri Dish
-- 24 Hours

ItemTimeTrackerMod["HCPetrinothingzoom"] = {};   
ItemTimeTrackerMod["HCPetrinothingzoom"]["Life"] = 24.0;
ItemTimeTrackerMod["HCPetrinothingzoom"]["TurnInto"] = "Hydrocraft.HCPetribiowaste";

-- Corpse in Blue Barrel
-- 24 Hours

ItemTimeTrackerMod["HCBluebarrelcorpse"] = {};   
ItemTimeTrackerMod["HCBluebarrelcorpse"]["Life"] = 24.0;
ItemTimeTrackerMod["HCBluebarrelcorpse"]["TurnInto"] = "Hydrocraft.HCBluebarreltoxicwaste";

-- Ferment Opium
-- 24 Hours

ItemTimeTrackerMod["HCJaropium"] = {};   
ItemTimeTrackerMod["HCJaropium"]["Life"] = 24.0;
ItemTimeTrackerMod["HCJaropium"]["TurnInto"] = "Hydrocraft.HCPureopium";

--Jello setting for a hour
ItemTimeTrackerMod["HCJelloapple1hot"] = {};   
ItemTimeTrackerMod["HCJelloapple1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJelloapple1hot"]["TurnInto"] = "Hydrocraft.HCJelloapple1cold";

ItemTimeTrackerMod["HCJelloblueberry1hot"] = {};   
ItemTimeTrackerMod["HCJelloblueberry1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJelloblueberry1hot"]["TurnInto"] = "Hydrocraft.HCJelloblueberry1cold";

ItemTimeTrackerMod["HCJellocherry1hot"] = {};   
ItemTimeTrackerMod["HCJellocherry1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellocherry1hot"]["TurnInto"] = "Hydrocraft.HCJellocherry1cold";

ItemTimeTrackerMod["HCJellolemon1hot"] = {};   
ItemTimeTrackerMod["HCJellolemon1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellolemon1hot"]["TurnInto"] = "Hydrocraft.HCJellolemon1cold";

ItemTimeTrackerMod["HCJellolime1hot"] = {};   
ItemTimeTrackerMod["HCJellolime1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellolime1hot"]["TurnInto"] = "Hydrocraft.HCJellolime1cold";

ItemTimeTrackerMod["HCJelloorange1hot"] = {};   
ItemTimeTrackerMod["HCJelloorange1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJelloorange1hot"]["TurnInto"] = "Hydrocraft.HCJelloorange1cold";

ItemTimeTrackerMod["HCJellostrawberry1hot"] = {};   
ItemTimeTrackerMod["HCJellostrawberry1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellostrawberry1hot"]["TurnInto"] = "Hydrocraft.HCJellostrawberry1cold";

ItemTimeTrackerMod["HCJellowatermelon1hot"] = {};   
ItemTimeTrackerMod["HCJellowatermelon1hot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellowatermelon1hot"]["TurnInto"] = "Hydrocraft.HCJellowatermelon1cold";

ItemTimeTrackerMod["HCJellochocolatepuddinghot"] = {};   
ItemTimeTrackerMod["HCJellochocolatepuddinghot"]["Life"] = 1.0;
ItemTimeTrackerMod["HCJellochocolatepuddinghot"]["TurnInto"] = "Hydrocraft.HCJellochocolatepudding";

--Plants ===========================================================================
--HCPottedwheat

--HCPottedbananatree
ItemTimeTrackerMod["HCPottedbananatreesmall"] = {};
ItemTimeTrackerMod["HCPottedbananatreesmall"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedbananatreesmall"]["TurnInto"] = "Hydrocraft.HCPottedbananatree";

ItemTimeTrackerMod["HCPottedbananatree"] = {};
ItemTimeTrackerMod["HCPottedbananatree"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedbananatree"]["TurnInto"] = "Hydrocraft.HCPottedbananatreeready";

ItemTimeTrackerMod["HCPottedbananatreeready"] = {};
ItemTimeTrackerMod["HCPottedbananatreeready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedbananatreeready"]["TurnInto"] = "Hydrocraft.HCPottedbananatree";

--HCPottedlimetree
ItemTimeTrackerMod["HCPottedlimetreesmall"] = {};
ItemTimeTrackerMod["HCPottedlimetreesmall"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedlimetreesmall"]["TurnInto"] = "Hydrocraft.HCPottedlimetree";

ItemTimeTrackerMod["HCPottedlimetree"] = {};
ItemTimeTrackerMod["HCPottedlimetree"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedlimetree"]["TurnInto"] = "Hydrocraft.HCPottedlimetreeready";

ItemTimeTrackerMod["HCPottedlimetreeready"] = {};
ItemTimeTrackerMod["HCPottedlimetreeready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedlimetreeready"]["TurnInto"] = "Hydrocraft.HCPottedlimetree";

--HCPottedorangetree
ItemTimeTrackerMod["HCPottedorangetreesmall"] = {};
ItemTimeTrackerMod["HCPottedorangetreesmall"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedorangetreesmall"]["TurnInto"] = "Hydrocraft.HCPottedorangetree";

ItemTimeTrackerMod["HCPottedorangetree"] = {};
ItemTimeTrackerMod["HCPottedorangetree"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedorangetree"]["TurnInto"] = "Hydrocraft.HCPottedorangetreeready";

ItemTimeTrackerMod["HCPottedorangetreeready"] = {};
ItemTimeTrackerMod["HCPottedorangetreeready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedorangetreeready"]["TurnInto"] = "Hydrocraft.HCPottedorangetree";

--HCPottedappletree
ItemTimeTrackerMod["HCPottedappletreesmall"] = {};
ItemTimeTrackerMod["HCPottedappletreesmall"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedappletreesmall"]["TurnInto"] = "Hydrocraft.HCPottedappletree";

ItemTimeTrackerMod["HCPottedappletree"] = {};
ItemTimeTrackerMod["HCPottedappletree"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedappletree"]["TurnInto"] = "Hydrocraft.HCPottedappletreeready";

ItemTimeTrackerMod["HCPottedappletreeready"] = {};
ItemTimeTrackerMod["HCPottedappletreeready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedappletreeready"]["TurnInto"] = "Hydrocraft.HCPottedappletree";


--HCPottedpumpkin
ItemTimeTrackerMod["HCPottedpumpkinsmall"] = {};
ItemTimeTrackerMod["HCPottedpumpkinsmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedpumpkinsmall"]["TurnInto"] = "Hydrocraft.HCPottedpumpkin";

ItemTimeTrackerMod["HCPottedpumpkin"] = {};
ItemTimeTrackerMod["HCPottedpumpkin"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedpumpkin"]["TurnInto"] = "Hydrocraft.HCPottedpumpkinready";

ItemTimeTrackerMod["HCPottedpumpkinready"] = {};
ItemTimeTrackerMod["HCPottedpumpkinready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedpumpkinready"]["TurnInto"] = "Hydrocraft.HCPottedpumpkindead";


--HCPottedtea
ItemTimeTrackerMod["HCPottedteasmall"] = {};
ItemTimeTrackerMod["HCPottedteasmall"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedteasmall"]["TurnInto"] = "Hydrocraft.HCPottedtea";

ItemTimeTrackerMod["HCPottedtea"] = {};
ItemTimeTrackerMod["HCPottedtea"]["Life"] = 168.0;
ItemTimeTrackerMod["HCPottedtea"]["TurnInto"] = "Hydrocraft.HCPottedteaready";

ItemTimeTrackerMod["HCPottedteaready"] = {};
ItemTimeTrackerMod["HCPottedteaready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedteaready"]["TurnInto"] = "Hydrocraft.HCPottedtea";

--HCPottedtobacco
ItemTimeTrackerMod["HCPottedtobaccosmall"] = {};
ItemTimeTrackerMod["HCPottedtobaccosmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedtobaccosmall"]["TurnInto"] = "Hydrocraft.HCPottedtobacco";

ItemTimeTrackerMod["HCPottedtobacco"] = {};
ItemTimeTrackerMod["HCPottedtobacco"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedtobacco"]["TurnInto"] = "Hydrocraft.HCPottedtobaccoready";

ItemTimeTrackerMod["HCPottedtobaccoready"] = {};
ItemTimeTrackerMod["HCPottedtobaccoready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedtobaccoready"]["TurnInto"] = "Hydrocraft.HCPottedtobaccodead";

--HCPottedginger
ItemTimeTrackerMod["HCPottedgingersmall"] = {};
ItemTimeTrackerMod["HCPottedgingersmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedgingersmall"]["TurnInto"] = "Hydrocraft.HCPottedginger";

ItemTimeTrackerMod["HCPottedginger"] = {};
ItemTimeTrackerMod["HCPottedginger"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedginger"]["TurnInto"] = "Hydrocraft.HCPottedgingerready";

ItemTimeTrackerMod["HCPottedgingerready"] = {};
ItemTimeTrackerMod["HCPottedgingerready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedgingerready"]["TurnInto"] = "Hydrocraft.HCPottedgingerdead";

--HCPottedgarlic
ItemTimeTrackerMod["HCPottedgarlicsmall"] = {};
ItemTimeTrackerMod["HCPottedgarlicsmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedgarlicsmall"]["TurnInto"] = "Hydrocraft.HCPottedgarlic";

ItemTimeTrackerMod["HCPottedgarlic"] = {};
ItemTimeTrackerMod["HCPottedgarlic"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedgarlic"]["TurnInto"] = "Hydrocraft.HCPottedgarlicready";

ItemTimeTrackerMod["HCPottedgarlicready"] = {};
ItemTimeTrackerMod["HCPottedgarlicready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedgarlicready"]["TurnInto"] = "Hydrocraft.HCPottedgarlicdead";

--HCPottedjute
ItemTimeTrackerMod["HCPottedjutesmall"] = {};
ItemTimeTrackerMod["HCPottedjutesmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedjutesmall"]["TurnInto"] = "Hydrocraft.HCPottedjute";

ItemTimeTrackerMod["HCPottedjute"] = {};
ItemTimeTrackerMod["HCPottedjute"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedjute"]["TurnInto"] = "Hydrocraft.HCPottedjuteready";

ItemTimeTrackerMod["HCPottedjuteready"] = {};
ItemTimeTrackerMod["HCPottedjuteready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedjuteready"]["TurnInto"] = "Hydrocraft.HCPottedjutedead";

--HCPottedchilipepperplant
ItemTimeTrackerMod["HCPottedchilipepperplantsmall"] = {};
ItemTimeTrackerMod["HCPottedchilipepperplantsmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedchilipepperplantsmall"]["TurnInto"] = "Hydrocraft.HCPottedchilipepperplant";

ItemTimeTrackerMod["HCPottedchilipepperplant"] = {};
ItemTimeTrackerMod["HCPottedchilipepperplant"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedchilipepperplant"]["TurnInto"] = "Hydrocraft.HCPottedchilipepperplantready";

ItemTimeTrackerMod["HCPottedchilipepperplantready"] = {};
ItemTimeTrackerMod["HCPottedchilipepperplantready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedchilipepperplantready"]["TurnInto"] = "Hydrocraft.HCPottedchilipepperplantdead";

--HCPottedpoppy
ItemTimeTrackerMod["HCPottedpoppysmall"] = {};
ItemTimeTrackerMod["HCPottedpoppysmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedpoppysmall"]["TurnInto"] = "Hydrocraft.HCPottedpoppy";

ItemTimeTrackerMod["HCPottedpoppy"] = {};
ItemTimeTrackerMod["HCPottedpoppy"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedpoppy"]["TurnInto"] = "Hydrocraft.HCPottedpoppyready";

ItemTimeTrackerMod["HCPottedpoppyready"] = {};
ItemTimeTrackerMod["HCPottedpoppyready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedpoppyready"]["TurnInto"] = "Hydrocraft.HCPottedpoppydead";


--HCPottedcottonplant
ItemTimeTrackerMod["HCPottedcottonplantsmall"] = {};
ItemTimeTrackerMod["HCPottedcottonplantsmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedcottonplantsmall"]["TurnInto"] = "Hydrocraft.HCPottedcottonplant";

ItemTimeTrackerMod["HCPottedcottonplant"] = {};
ItemTimeTrackerMod["HCPottedcottonplant"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedcottonplant"]["TurnInto"] = "Hydrocraft.HCPottedcottonplantready";

ItemTimeTrackerMod["HCPottedcottonplantready"] = {};
ItemTimeTrackerMod["HCPottedcottonplantready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedcottonplantready"]["TurnInto"] = "Hydrocraft.HCPottedcottonplantdead";

--HCPottedrice
ItemTimeTrackerMod["HCPottedricesmall"] = {};
ItemTimeTrackerMod["HCPottedricesmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedricesmall"]["TurnInto"] = "Hydrocraft.HCPottedrice";

ItemTimeTrackerMod["HCPottedrice"] = {};
ItemTimeTrackerMod["HCPottedrice"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedrice"]["TurnInto"] = "Hydrocraft.HCPottedriceready";

ItemTimeTrackerMod["HCPottedriceready"] = {};
ItemTimeTrackerMod["HCPottedriceready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedriceready"]["TurnInto"] = "Hydrocraft.HCPottedricedead";

--HCPottedrubbertree
ItemTimeTrackerMod["HCPottedrubbertreesmall"] = {};
ItemTimeTrackerMod["HCPottedrubbertreesmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedrubbertreesmall"]["TurnInto"] = "Hydrocraft.HCPottedrubbertree";

ItemTimeTrackerMod["HCPottedrubbertree"] = {};
ItemTimeTrackerMod["HCPottedrubbertree"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedrubbertree"]["TurnInto"] = "Hydrocraft.HCPottedrubbertreeready";

ItemTimeTrackerMod["HCPottedrubbertreeready"] = {};
ItemTimeTrackerMod["HCPottedrubbertreeready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedrubbertreeready"]["TurnInto"] = "Hydrocraft.HCPottedrubbertree";


--HCPottedbasil
ItemTimeTrackerMod["HCPottedbasilsmall"] = {};
ItemTimeTrackerMod["HCPottedbasilsmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedbasilsmall"]["TurnInto"] = "Hydrocraft.HCPottedbasil";

ItemTimeTrackerMod["HCPottedbasil"] = {};
ItemTimeTrackerMod["HCPottedbasil"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedbasil"]["TurnInto"] = "Hydrocraft.HCPottedbasilready";

ItemTimeTrackerMod["HCPottedbasilready"] = {};
ItemTimeTrackerMod["HCPottedbasilready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedbasilready"]["TurnInto"] = "Hydrocraft.HCPottedbasilsmalldead";

--HCPottedoregano
ItemTimeTrackerMod["HCPottedoreganosmall"] = {};
ItemTimeTrackerMod["HCPottedoreganosmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedoreganosmall"]["TurnInto"] = "Hydrocraft.HCPottedoregano";

ItemTimeTrackerMod["HCPottedoregano"] = {};
ItemTimeTrackerMod["HCPottedoregano"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedoregano"]["TurnInto"] = "Hydrocraft.HCPottedoreganoready";

ItemTimeTrackerMod["HCPottedoreganoready"] = {};
ItemTimeTrackerMod["HCPottedoreganoready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedoreganoready"]["TurnInto"] = "Hydrocraft.HCPottedoreganosmalldead";


--HCPottedalfalfa
ItemTimeTrackerMod["HCPottedalfalfasmall"] = {};
ItemTimeTrackerMod["HCPottedalfalfasmall"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedalfalfasmall"]["TurnInto"] = "Hydrocraft.HCPottedalfalfa";

ItemTimeTrackerMod["HCPottedalfalfa"] = {};
ItemTimeTrackerMod["HCPottedalfalfa"]["Life"] = 72.0;
ItemTimeTrackerMod["HCPottedalfalfa"]["TurnInto"] = "Hydrocraft.HCPottedalfalfaready";

ItemTimeTrackerMod["HCPottedalfalfaready"] = {};
ItemTimeTrackerMod["HCPottedalfalfaready"]["Life"] = 48.0;
ItemTimeTrackerMod["HCPottedalfalfaready"]["TurnInto"] = "Hydrocraft.HCPottedalfalfadead";

