--Initializations.

Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}
Recipe.OnCreate.Hydrocraft = Recipe.OnCreate.Hydrocraft or {}

-- ***********************************************************
-- **                    Hydromancerx                       **
-- **				 Single Item Returns.					**
-- ***********************************************************

function reinfHeavyCarWin(items, result, player, selectedItem)
    local conditionMax = 2 + player:getPerkLevel(Perks.Woodwork)
	print (selectedItem:getConditionMax())
	result:setConditionMax(selectedItem:getConditionMax() + 10)
    result:setCondition(selectedItem:getConditionMax() + 10)
end



function fixWindshield1(items, result, player)
	player:Say("We can make it!");
	local inv = player:getInventory();
	--inv:FindAndReturn("Windshield1"):setConditionMax(500);
	inv:FindAndReturn("Windshield1"):setCondition(100);
end


function RenewCarDoor(items, result, player)
local torepair=""
for i=items:size()-1, 0, -1  do
    print(items:get(i):getType())
    	if string.find(items:get(i):getType(),"CarDoor") then
    	torepair=items:get(i)
    	end
	end
print ("---")
print (torepair:getType())
if player:getInventory():contains("HCWorkgloves") then
	print ("es ist da.")
end

--inv:FindAndReturn("FrontCarDoor3"):setCondition(22)
--inv:FindAndReturn("FrontCarDoor2"):setCondition(44)
--player:Say(tostring(inv:FindAndReturn(torepair):getType()))

--local anz=inv:size()
end


function rprolld6(items, result, player)
	num = tostring(ZombRand(6)+1);
    player:Say("*Rolls* ... " .. num);
end

function recipe_hcgetplastic(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlastic");
end

function recipe_hcbreakbottle(player)
	local pl = getPlayer();
	if ZombRand(5) == 0 then
	pl:getBodyDamage():getBodyPart(BodyPartType.Hand_R):generateDeepShardWound();
	else return end
end

function HCEightBall(items, result, player)
    sayThis = ZombRand(21);
    if sayThis == 0 then
        player:Say("It is certain");
    elseif sayThis == 1 then
        player:Say("It is decidedly so");
	elseif sayThis == 2 then
        player:Say("Without a doubt");
    elseif sayThis == 3 then
        player:Say("Yes, definitely");
    elseif sayThis == 4 then
        player:Say("You may rely on it");
    elseif sayThis == 5 then
        player:Say("As I see it, yes");
    elseif sayThis == 6 then
        player:Say("Most likely");
    elseif sayThis == 7 then
        player:Say("Outlook good");
    elseif sayThis == 8 then
        player:Say("Yes");
    elseif sayThis == 9 then
        player:Say("Signs point to yes");
    elseif sayThis == 10 then
        player:Say("Reply hazy try again");
    elseif sayThis == 11 then
        player:Say("Ask again later");
    elseif sayThis == 12 then
        player:Say("Better not tell you now");
    elseif sayThis == 13 then
        player:Say("Cannot predict now");
    elseif sayThis == 14 then
        player:Say("Concentrate and ask again");	
    elseif sayThis == 15 then
        player:Say("Don't count on it");	
    elseif sayThis == 16 then
        player:Say("My reply is no");	
    elseif sayThis == 17 then
        player:Say("My sources say no");	
    elseif sayThis == 18 then
        player:Say("Outlook not so good");
    elseif sayThis == 19 then
        player:Say("Very doubtful");
    elseif sayThis == 20 then
        player:Say("All signs point to no");		
    end
end

function recipe_hcwalletmoney(items, result, player)
    local wallet = ZombRand(20);
    if wallet == 19 then
       player:getInventory():AddItem("Hydrocraft.HCCheque");  
	elseif wallet == 18 then		
       player:getInventory():AddItem("Hydrocraft.HCPokerchip");  
	elseif wallet == 17 then		
       player:getInventory():AddItem("Hydrocraft.HCDriverslicense");  
	elseif wallet == 16 then	
       player:getInventory():AddItem("Hydrocraft.HCCinematicket");  
	elseif wallet == 15 then	
       player:getInventory():AddItem("Hydrocraft.HCPostagestamp");  
	elseif wallet == 14 then		
       player:getInventory():AddItem("Base.Mirror");  
	elseif wallet == 13 then	
       player:getInventory():AddItem("Base.CreditCard");  
	elseif wallet == 12 then
       player:getInventory():AddItem("Hydrocraft.HC100dollarbill");  
	elseif wallet == 11 then
       player:getInventory():AddItem("Hydrocraft.HC50dollarbill");  
	elseif wallet == 10 then	
       player:getInventory():AddItem("Hydrocraft.HC20dollarbill");  
	elseif wallet == 9 then
       player:getInventory():AddItem("Hydrocraft.HC10dollarbill");  
	elseif wallet == 8 then
       player:getInventory():AddItem("Hydrocraft.HC5dollarbill");  
	elseif wallet == 7 then	
       player:getInventory():AddItem("Hydrocraft.HC2dollarbill");  
	elseif wallet == 6 then
       player:getInventory():AddItem("Hydrocraft.HC1dollarbill");  
	elseif wallet == 5 then
       player:getInventory():AddItem("Hydrocraft.HCDollar");  
	elseif wallet == 4 then	
       player:getInventory():AddItem("Hydrocraft.HCHalfdollar");  
	elseif wallet == 3 then
       player:getInventory():AddItem("Hydrocraft.HCQuarter");  
	elseif wallet == 2 then
       player:getInventory():AddItem("Hydrocraft.HCDime");	   
	elseif wallet == 1 then
       player:getInventory():AddItem("Hydrocraft.HCNickel");
    elseif wallet == 0 then
       player:getInventory():AddItem("Hydrocraft.HCPenny");      
    end
end

function recipe_hcslotmachine(items, result, player)
    local slots = ZombRand(13);
    if slots == 12 then	
       player:getInventory():AddItem("Hydrocraft.HC100dollarbill");  
	elseif slots == 11 then
       player:getInventory():AddItem("Hydrocraft.HC50dollarbill");  
	elseif slots == 10 then	
       player:getInventory():AddItem("Hydrocraft.HC20dollarbill");  
	elseif slots == 9 then
       player:getInventory():AddItem("Hydrocraft.HC10dollarbill");  
	elseif slots == 8 then
       player:getInventory():AddItem("Hydrocraft.HC5dollarbill");  
	elseif slots == 7 then	
       player:getInventory():AddItem("Hydrocraft.HC2dollarbill");  
	elseif slots == 6 then
       player:getInventory():AddItem("Hydrocraft.HC1dollarbill");  
	elseif slots == 5 then
       player:getInventory():AddItem("Hydrocraft.HCDollar");  
	elseif slots == 4 then	
       player:getInventory():AddItem("Hydrocraft.HCHalfdollar");  
	elseif slots == 3 then
       player:getInventory():AddItem("Hydrocraft.HCQuarter");  
	elseif slots == 2 then
       player:getInventory():AddItem("Hydrocraft.HCDime");	   
	elseif slots == 1 then
       player:getInventory():AddItem("Hydrocraft.HCNickel");
    elseif slots == 0 then
       player:getInventory():AddItem("Hydrocraft.HCPenny");      
    end
end

-- Trash

function recipe_hcget8trashbottle(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCTrashbottle", 8)
end 

function recipe_hcget12trashbottle(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCTrashbottle", 12)
end 

function recipe_hcget2emptymilk(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCUHTmilkempty", 2)
end 

-- Label

function recipe_hclabeldetergent(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabeldetergent");
end

function recipe_hclabelpoison(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelpoison");
end

function recipe_hclabelammonia(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelammonia");
end

function recipe_hclabelh2o2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelh2o2");
end

function recipe_hclabelmethylamin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelmethylamin");
end

function recipe_hclabelphenyl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelphenylaceticacid");
end

function recipe_hclabelsulfuricacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLabelsulfuricacid");
end

-- Get Buckets Beakers Cans

function recipe_hcget1beaker(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCGlassbeaker")
end 

function recipe_hcget2beakers(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCGlassbeaker", 2)
end 

function recipe_hcget4beakers(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCGlassbeaker", 4)
end 

function recipe_hcgetwoodenbucket(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbucket");
end

function recipe_hcgetemptypoisoncan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPoisonempty");
end

function recipe_hcgetemptydetergentcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDetergentempty");
end

function recipe_hcgetemptyplasticcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlasticcanempty");
end

function recipe_hcgetemptyammoniacan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniacanempty");
end

function recipe_hcgetemptyh2o2can(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCh2o2canempty");
end

function recipe_hcgetemptysulfuriccan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidcanempty");
end

function recipe_hcget3plasticcans(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCPlasticcanempty", 3)
end 

function recipe_hcget3ammoniacans(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCAmmoniacanempty", 3)
end 

function recipe_hcget3detergentcans(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCDetergentempty", 3)
end 

function recipe_hcget3poisoncans(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCPoisonempty", 3)
end 

function recipe_hcget3sulfuricacidcans(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCSulfuricacidcanempty", 3)
end 

function recipe_hcgeteyedropper(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCEyedropper")
end 

-- Get Barrels

function recipe_hcgetemptymetalbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBarrelmetalempty");
end

function recipe_hcgetemptyammoniabarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniabarrelempty");
end

function recipe_hcgetemptyammoniabarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAmmoniabarrelblueempty");
end

function recipe_hcgetemptymethlaminbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMethylaminbarrelempty");
end

function recipe_hcgetemptymethlaminbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMethylaminbarrelblueempty");
end

function recipe_hcgetemptyphenylbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPhenylbarrelempty");
end

function recipe_hcgetemptyphenylbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPhenylbarrelblueempty");
end

function recipe_hcgetemptysulfuricbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidbarrelempty");
end

function recipe_hcgetemptysulfuricbarrelblue(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSulfuricacidbarrelblueempty");
end

--Carpentry Stuff

function recipe_hclog5(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.Log", 5)
end 

function recipe_hcwoodenstick(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WoodenStick");
end

function recipe_hcsawdust(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSawdust");
end

function recipe_hcsawdustRoap(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCSawdust")
	inv:AddItems("Base.Rope", 2) --TODO log stack could be using sheet rope, which this function is ignoring.
end



function recipe_hcpallet(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCRopethick")
	inv:AddItem("Hydrocraft.HCWoodenpallet")
end 

--Tool Stuff

function recipe_hcportableminingmachine(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPortableminingmachine");
end

function recipe_hcgetmultitool(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCElectricmultitooloff");
end

function recipe_hcbolt(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBolt");
end

function recipe_hcemptyweldingtank(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWeldingtankempty");
end

function recipe_hcdisassembleweldingtorch(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWeldingtankempty")
	inv:AddItem("Base.BlowTorch")
end

function recipe_hcbelt(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Belt2");
end 

--Medical Stuff

function recipe_hcgetmedicalskeleton(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCMedicalskeletonparts")
	inv:AddItem("Hydrocraft.HCMedicalskeletonholderparts")
end 

function recipe_hcgetpetridish(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCPetridish")
end

function recipe_hcmicroscopefunghi(items, result, player)
	local temp = {"Hydrocraft.HCPetripenecilinumzoom", "Hydrocraft.HCPetriaspergilluszoom", "Hydrocraft.HCPetriyeastzoom", "Hydrocraft.HCPetrididymiumzoom", "Hydrocraft.HCPetrinothingzoom"}

    local index = ZombRand(#temp) + 1
	inv:AddItem(temp[index])
end


--Inject with Zed Blood
function HCInjectyourself(items, result, player)
    player:getBodyDamage():setInfectionLevel(1);
end

--Homemade Beta Blockers
function HCBetaBlocker(items, result, player)
	local player = getPlayer(); 
	local stats = player:getStats();
	stats:setPanic(stats:getPanic() - 10);
end

 function HCBetaBlockerMild(items, result, player)
	local player = getPlayer(); 
	local stats = player:getStats();
	stats:setPanic(stats:getPanic() - 5);
end

--Sewing Stuff

function recipe_hcspindle3(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCSpindle", 3)
end 

function recipe_hcspindle6(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCSpindle", 6)
end 

function recipe_hcpincushion(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPincushion");
end

function recipe_hcpillowcase(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPillowcase");
end

function Recipe.OnCreate.Hydrocraft.RecycleBag(items, result, player)

	local bag = items:get(0)
	local nylonAmount = bag:getModData().NylonAmount

	if nylonAmount == nil then
		nylonAmount = 1
		print( "Error: Missing Nylon Amount, defaulting to 1" )
	end

	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCNyloncloth", nylonAmount);

end

--Container Stuff

function recipe_hccdcase(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCDcase");
end

function recipe_hctennisballcontainer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTennisballcontainer");
end 

function recipe_hcgetplasticcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlasticcanempty");
end

function recipe_hcwoodenvat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCVat");
end

function recipe_hcwashtub(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWashtub");
end

function recipe_hcwoodenbucketbottle(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.WhiskeyEmpty")
	inv:AddItem("Hydrocraft.HCWoodenbucket")
end 

function recipe_hcwoodenbucket(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbucket");
end

function recipe_hcwoodenbucket2(items, result, player)
	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCWoodenbucket", 2);
end

function recipe_hcwoodenbucket4(items, result, player)
	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCWoodenbucket", 4);
end 

function recipe_hcwoodenbucket5(items, result, player)
	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCWoodenbucket", 5);
end 

function recipe_hcwoodenbarrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCWoodenbarrel");
end

--Electric  Stuff

function recipe_hcsolarpark(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCSolarpark")
end

function recipe_hcelectronics(items, result, player)
	local temp = {"Hydrocraft.HCElectronicpartsbroken", "Hydrocraft.HCLedyellow", "Hydrocraft.HCLedgreen", "Hydrocraft.HCLedred", "Hydrocraft.HCCablecopper"}
    local index = ZombRand(#temp) + 1
	local inv = player:getInventory()
	inv:AddItem(temp[index]);
end

function recipe_hcheaterwire(items, result, player)
	local temp = {"Hydrocraft.HCElectronicpartsbroken", "Hydrocraft.HCWireconstantan", "Hydrocraft.HCLedyellow", "Hydrocraft.HCLedgreen", "Hydrocraft.HCLedred"}
    local index = ZombRand(#temp) + 1
	local inv = player:getInventory()
	inv:AddItem(temp[index])
end

function recipe_hcelectromotorsmall(items, result, player)
	local temp = {"Hydrocraft.HCElectronicpartsbroken", "Hydrocraft.HCElectromotorsmall", "Hydrocraft.HCLedyellow", "Hydrocraft.HCLedgreen", "Hydrocraft.HCLedred"}
    local index = ZombRand(#temp) + 1
	local inv = player:getInventory()
	inv:AddItem(temp[index])
end

function recipe_hcelectronics02(items, result, player)
	local temp = {
		"Hydrocraft.HCCircutchip",
		"Hydrocraft.HCCeramicoscillator",
		"Hydrocraft.HCIREncoder",
		"Hydrocraft.HCIRDecoder",
		"Hydrocraft.HCDiode",
		"Hydrocraft.HCFuse",
		"Hydrocraft.HCGlowlamp",
		"Hydrocraft.HCInduktor",
		"Hydrocraft.HCIREmitter",
		"Hydrocraft.HCIRReceiver",
		"Hydrocraft.HCLDR",
		"Hydrocraft.HCPoti",
		"Hydrocraft.HCReceiverIC",
		"Hydrocraft.HCTransistor",
		"Hydrocraft.HCTerminalstrip",
		"Hydrocraft.HCResistor",
		"Hydrocraft.HCLedblue",
		"Hydrocraft.HCLedyellow",
		"Hydrocraft.HCCapacitor02",
		"Hydrocraft.HCCapacitor01",
		"Hydrocraft.HCLedgreen",
		"Hydrocraft.HCLedred",
		"Hydrocraft.HCCoppercablestriped",
		"Hydrocraft.HCCoppercablered",
		"Hydrocraft.HCCablecopper"
	}
    local index = ZombRand(#temp) + 1
	local inv = player:getInventory()
	inv:AddItem(temp[index])

end

function recipe_hclightbulb(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.LightBulb");
end

function recipe_hcdisplay(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDisplay");
end

function recipe_hccomputerfan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCComputerfandismantled");
end

function recipe_hcDisDomputer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSwitch");
	inv:AddItems("Hydrocraft.HCPlastic",6);
	inv:AddItems("Hydrocraft.Screws",10);
	inv:AddItems("Hydrocraft.ElectronicsScrap",15);
	inv:AddItems("Hydrocraft.HCColoredwire",4);
	inv:AddItem("Hydrocraft.HCLedgreen");
	inv:AddItem("Hydrocraft.HCLedred");
	inv:AddItem("Hydrocraft.HCComputerfan");
end

function recipe_hcDisKeyboard(items, result, player)
	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCPlastic",2);
	inv:AddItems("Hydrocraft.Screws",2);
	inv:AddItems("Hydrocraft.ElectronicsScrap",5);
	inv:AddItem("Hydrocraft.HCLedyellow");
	inv:AddItem("Hydrocraft.HCCablecopper");
end


function recipe_hcwashingmachine(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCElectromotor")
	inv:AddItems("Hydrocraft.SheetMetal", 2)
	inv:AddItem("Hydrocraft.HCWashingmachinepump")
	inv:AddItems("Hydrocraft.HCTerminalstrip", 5)
	inv:AddItems("Hydrocraft.HCColoredwire", 2)
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Hydrocraft.HCCablecopper")
	inv:AddItems("Hydrocraft.HCElectronicpartsbroken", 2)
end 

function recipe_hcfridge(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCElectromotor")
	inv:AddItem("Hydrocraft.SheetMetal")
	inv:AddItems("Hydrocraft.HCTerminalstrip", 5)
	inv:AddItems("Hydrocraft.HCColoredwire", 2)
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Hydrocraft.HCCablecopper")
	inv:AddItems("Hydrocraft.HCElectronicpartsbroken", 2)
end 

function recipe_hclargevac(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCElectromotor")
	inv:AddItem("Hydrocraft.HCSteelpipe")
	inv:AddItem("Hydrocraft.HCSwitch")
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Hydrocraft.HCCablecopper")
	inv:AddItems("Hydrocraft.HCTerminalstrip", 5)
	inv:AddItems("Hydrocraft.HCColoredwire", 2)
	inv:AddItems("Hydrocraft.HCElectronicpartsbroken", 2)
end 


function recipe_hcDismEguitar(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCSwitch")
	inv:AddItems("Hydrocraft.HCColoredwire", 2)
	inv:AddItems("Hydrocraft.ElectronicsScrap", 2)
end 

function recipe_hcbike1(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCBicyclewheel")
	inv:AddItems("Base.Pipe", 4)
end 

function recipe_hcbike2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.Pipe", 4)
	inv:AddItems("Base.HCBicyclewheel", 2)
end 

function recipe_hcelectronicparts(items, result, player)
	local temp = {"Hydrocraft.HCElectronicparts04", "Hydrocraft.HCElectronicparts03", "Hydrocraft.HCElectronicparts02", "Hydrocraft.HCElectronicparts01", "Hydrocraft.HCElectronicpartsbroken"}

    local index = ZombRand(#temp) + 1
	player:getInventory():AddItem(temp[index]);

end

function recipe_hcsortparts01(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCCapacitor02", 2)
	inv:AddItem("Hydrocraft.HCPoti")
	inv:AddItems("Hydrocraft.HCTransistor", 2)
	inv:AddItem("Hydrocraft.HCReceiverIC")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItems("Hydrocraft.HCResistor", 2)
end 

function recipe_hcsortparts02(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCResistor", 2)
	inv:AddItem("Hydrocraft.HCCeramicoscillator")
	inv:AddItem("Hydrocraft.HCCapacitor01")
	inv:AddItem("Hydrocraft.HCCapacitor02")
	inv:AddItem("Hydrocraft.HCLedblue")
	inv:AddItem("Hydrocraft.HCLedyellow")
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
end 

function recipe_hcsortparts03(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCapacitor02")
	inv:AddItem("Hydrocraft.HCLDR")
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCTransistor")
	inv:AddItems("Hydrocraft.HCDiode", 4)
	inv:AddItems("Hydrocraft.HCResistor", 2)
end 

function recipe_hcsortparts04(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCapacitor02")
	inv:AddItem("Hydrocraft.HCIREncoder")
	inv:AddItem("Hydrocraft.HCIREmitter")
	inv:AddItem("Hydrocraft.HCIRReceiver")
	inv:AddItems("Hydrocraft.HCDiode", 3)
	inv:AddItems("Hydrocraft.HCResistor", 2)
end 

function recipe_hccabletangle(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCoppercablestriped")
	inv:AddItems("Hydrocraft.HCWirecopper", 2)
	inv:AddItems("Hydrocraft.HCCoppercablered", 2)
	inv:AddItems("Hydrocraft.HCCablecopper", 2)
end 

function recipe_hcrecyclecable(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCoppercablestriped")
	inv:AddItem("Hydrocraft.HCCoppercablered")
end 

function recipe_hcdismantleengineparts(items, result, player)
	local temp = {"Hydrocraft.HCFanbelt", "Hydrocraft.HCClutch", "Hydrocraft.HCCamshaft", "Hydrocraft.HCAirfilter", "Hydrocraft.HCSparkplug"}
    local index = ZombRand(#temp) + 1
	player:getInventory():AddItem(temp[index])
end

function recipe_hcdismantlebreaks(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCBreakpads")
end

function recipe_hcreturngen(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.Generator")
	inv:AddItem("Hydrocraft.HCPowercord")
end

function recipe_hcdismantlemetal(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.SheetMetal", 11)
	inv:AddItems("Hydrocraft.HCMetalwheeliron", 4)
	inv:AddItems("Base.SmallSheetMetal", 2)
end

function recipe_hcdismantleforklift(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCLargesheetmetal", 2)
	inv:AddItems("Hydrocraft.HCSteelsheetlarge", 2)
	inv:AddItems("Hydrocraft.HCCablecopper", 2)
	inv:AddItems("Base.SheetMetal", 12)
	inv:AddItems("Base.ElectronicsScrap", 20)
	inv:AddItems("Base.MetalBar", 24)
	inv:AddItems("Base.EngineParts", 10)
	inv:AddItems("Base.Mirror", 2)

	inv:AddItem("Hydrocraft.HCLedblue")
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Base.NormalCarSeat1")
	inv:AddItem("Base.MetalPipe")
	inv:AddItem("Base.CarBattery1")
	inv:AddItem("Base.LightBulbOrange")
end

function recipe_hcdismantlescissorlift(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCLargesheetmetal", 6)
	inv:AddItems("Base.SheetMetal", 4)
	inv:AddItems("Base.ElectronicsScrap", 20)
	inv:AddItems("Base.MetalBar", 55)
	inv:AddItems("Base.EngineParts", 10)

	inv:AddItem("Hydrocraft.HCCablecopper")
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Hydrocraft.HCLedyellow")
	inv:AddItem("Base.MetalPipe")
	inv:AddItem("Base.CarBattery1")
	inv:AddItem("Base.RemoteCraftedV3")
end

function recipe_hcdismantleteslamachine(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCLedred")
	inv:AddItem("Hydrocraft.HCLedgreen")
	
	inv:AddItems("Hydrocraft.HCAluminumscrap", 2)
	inv:AddItems("Hydrocraft.HCRubberbelt", 4)
	inv:AddItems("Hydrocraft.HCPully", 4)
	inv:AddItems("Hydrocraft.HCLargesheetmetal", 5)
	inv:AddItems("Hydrocraft.HCLever", 2)
	inv:AddItems("Hydrocraft.HCConstantanheatingcoil", 8)
	inv:AddItems("Hydrocraft.HCCopperpipe", 2)
	inv:AddItems("Hydrocraft.HCCablecopper", 4)
	inv:AddItems("Base.SmallSheetMetal", 12)
	inv:AddItems("Base.SheetMetal", 2)
end

function recipe_hcdismantlecopymachine(items, result, player)
	local inv = player:getInventory()
    inv:AddItem("Hydrocraft.HCLedblue")
    inv:AddItem("Hydrocraft.HCLedyellow")
    inv:AddItem("Hydrocraft.HCLedred")
    inv:AddItem("Hydrocraft.HCLedgreen")
	inv:AddItem("Hydrocraft.HCElectromotor")
    inv:AddItem("Hydrocraft.HCIREncoder")
	inv:AddItem("Hydrocraft.HCIREmitter")
	inv:AddItem("Hydrocraft.HCIRReceiver")
    inv:AddItem("Hydrocraft.HCReceiverIC")
	inv:AddItem("Hydrocraft.HCLDR")
    inv:AddItem("Hydrocraft.HCCoppercablered")
	inv:AddItem("Hydrocraft.HCColoredwire")
	
	inv:AddItems("Hydrocraft.HCCablecopper", 4)
	inv:AddItems("Hydrocraft.HCCircutchip", 2)
	inv:AddItems("Hydrocraft.HCPlasticscrap", 30)
	inv:AddItems("Hydrocraft.HCTransistor", 2)
	inv:AddItems("Hydrocraft.HCResistor", 2)
	inv:AddItems("Hydrocraft.HCCapacitor02", 2)
	inv:AddItems("Hydrocraft.HCDiode", 4)

end

function recipe_hcdismantlepallettruck(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.MetalBar", 4)
	inv:AddItems("Hydrocraft.HCMetalwheel", 3)
	inv:AddItems("Hydrocraft.HCRubberscrap", 6)
	inv:AddItems("Hydrocraft.HCSteelsheet", 2)
end

function recipe_hcdismantletoywagon(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.MetalBar", 4)
	inv:AddItems("Hydrocraft.HCMetalwheel", 4)
	inv:AddItems("Hydrocraft.HCRubberscrap", 8)
	inv:AddItems("Hydrocraft.HCSteelsheet", 4)
end

function recipe_hcdismantlehanddolly(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.MetalBar", 10)
	inv:AddItems("Base.HCMetalwheel", 2)
	inv:AddItems("Hydrocraft.HCRubberscrap", 4)
end

function recipe_hcdismantlepushcart(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.MetalBar", 4)
	inv:AddItems("Base.HCMetalwheel", 4)
	inv:AddItems("Hydrocraft.HCRubberscrap", 8)
end

function recipe_hcdismantlebedsprings(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.MetalBar", 4)
	inv:AddItems("Hydrocraft.HCAluminumscrap", 20)
end

function recipe_hcdismantleglovebox(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.Sheetmetal", 9)
	inv:AddItems("Hydrocraft.HCPlasticscrap", 8)
	inv:AddItems("Hydrocraft.HCLedred", 2)
	inv:AddItems("Hydrocraft.HCCablecopper", 3)
	inv:AddItems("Hydrocraft.HCCircutchip", 2)
	inv:AddItems("Hydrocraft.HCColoredwire", 2)
	inv:AddItems("Hydrocraft.HCTransistor", 2)
	inv:AddItems("Hydrocraft.HCResistor", 2)
	inv:AddItems("Hydrocraft.HCCapacitor02", 2)
	inv:AddItems("Hydrocraft.HCDiode", 2)
	inv:AddItems("Base.SmallSheetMetal", 6)

    inv:AddItem("Hydrocraft.HCRubberglove")
    inv:AddItem("Hydrocraft.HCLedgreen")
    inv:AddItem("Hydrocraft.HCIREncoder")
	inv:AddItem("Hydrocraft.HCIREmitter")
	inv:AddItem("Hydrocraft.HCIRReceiver")
    inv:AddItem("Hydrocraft.HCReceiverIC")
	inv:AddItem("Hydrocraft.HCLDR")
    inv:AddItem("Base.MetalPipe")
end

function recipe_hcdismantlebrokenradiator(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCBrassscrap", 4)
end

function recipe_hcdismantlelawnmower(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCPlasticscrap", 6)
	inv:AddItems("Base.EngineParts", 10)
	inv:AddItems("Base.MetalBar", 8)

    inv:AddItem("Hydrocraft.HCSawcircularblade")
    inv:AddItem("Hydrocraft.HCCablecopper,")
end

function recipe_hcdismantleprojector(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCCircutchip", 2)
	inv:AddItems("Hydrocraft.HCCablecopper", 4)
	inv:AddItems("Hydrocraft.HCCapacitor02", 2)
	inv:AddItems("Hydrocraft.HCDiode", 4)
	inv:AddItems("Hydrocraft.HCLargesheetmetal", 3)
    inv:AddItems("Base.MetalBar", 4)
    inv:AddItems("Base.Sheetmetal", 12)
    inv:AddItems("Base.SmallSheetMetal", 4)

    inv:AddItem("Hydrocraft.HCIREncoder")
	inv:AddItem("Hydrocraft.HCIREmitter")
    inv:AddItem("Hydrocraft.HCIRReceiver")
    inv:AddItem("Hydrocraft.HCElectromotor")
    inv:AddItem("Hydrocraft.HCReceiverIC")
	inv:AddItem("Hydrocraft.HCLDR")
end	


--Battery Stuff

function recipe_hcbatterysmalldead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterysmalldead");
end

function recipe_hcbatterymediumdead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterymediumdead");
end

function recipe_hcbatterylargedead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatterylargedead");
end

function recipe_hcbatteryhugedead(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBatteryhugedead");
end

-- Barrels

function recipe_hcgetemptygasolinebarrel(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCGasolinebarrelempty")
end

function recipe_hcgetpetrolcan(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.PetrolCan")
end 

-- Explosives Stuff

function recipe_hcgetcapsule(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMk1capsule");
end

function recipe_hcgetrubberbung(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRubberbung");
end

function recipe_hcgetrubberbunghole(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRubberbunghole");
end

--Alchemy Stuff

function recipe_hcbiodieselcan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.EmptyPetrolCan");
end

function recipe_hcgetcalciumcarbonate(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCalciumcarbonatpowder");
end

function recipe_hcgetacidbath(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCAcidbathempty");
end

function recipe_hcbiogasempty(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBiogas");
end

function recipe_hcglycerin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlycerin");
end

function recipe_hcgeteyedropperammonia(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperammonia");
end 

function recipe_hcgeteyedropperpotassiumpermanganate(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperpotassiumpermanganate");
end 

function recipe_hcgeteyedroppercalciumchloride(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppercalciumchloridesolution");
end 

function recipe_hcgeteyedropperh2o2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperh2o2");
end 

function recipe_hcgeteyedroppermercuricoxide(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermercuricoxide");
end 

function recipe_hcgeteyedroppermethylamin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermethylamin");
end 

function recipe_hcgeteyedroppermorphinhydrochloridsolution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermorphinhydrochloridsolution");
end 

function recipe_hcgeteyedroppermuriaticacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppermuriaticacid");
end 

function recipe_hcgeteyedropperphenyl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperphenyl");
end 

function recipe_hcgeteyedroppersodiumhydroxidesolution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppersodiumhydroxidesolution");
end 

function recipe_hcgeteyedroppersulfuricacid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppersulfuricacid");
end 

function recipe_hcgeteyedroppertronasulution(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedroppertronasulution");
end 

function recipe_hcgeteyedropperwater(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperwater");
end 

function recipe_hcgeteyedropperether(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCEyedropperether");
end

function recipe_hcpaperscreen(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPaperscreen");
end  

--Lab Stuff

function recipe_hcgetglassbaloon(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlassbaloon");
end

function recipe_hcgetbaloonandhose(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCGlassbaloonconnector")
	inv:AddItem("Hydrocraft.HCRubberhose")
end 

function recipe_hcgetbeaker(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGlassbeaker");
end

function recipe_hcbeakerbottle(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGlassbeaker");
        inv:AddItem("Base.WhiskeyEmpty");
end

function recipe_hccork(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCork");
end

function recipe_hccorkhole(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCorkhole");
end

function recipe_hctesttuberack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTesttuberack");
end

function recipe_hcringstand(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRingstand");
end

function recipe_hccentifugemarble(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCCalcitepowder", 7)
end 

function recipe_hcelectrolyzerobsidian(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCMagnesiumpowder")
	inv:AddItems("Hydrocraft.HCSiliconpowder", 2)
end 

--Animal Stuff

function recipe_hcsheepmalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheepmalesheared");
end

function recipe_hcsheepfemalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheepfemalesheared");
end

function recipe_hcgoatmalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatmalesheared");
end

function recipe_hcgoatfemalesheared(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatfemalesheared");
end
	
function recipe_hchamsterpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHamsterpoop");
end

function recipe_hcrabbitpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRabbitpoop");
end

function recipe_hcchickenpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChickenpoop");
end

function recipe_hcpigpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPigpoop");
end

function recipe_hcsheeppoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSheeppoop");
end

function recipe_hcgoatpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCGoatpoop");
end

function recipe_hccowpoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCowpoop");
end

function recipe_hcdonkeypoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDonkeypoop");
end

function recipe_hchorsepoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHorsepoop");
end

function recipe_hcpigbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCPigmaletired");
        inv:AddItem("Hydrocraft.HCPigfemaletired");
end

function recipe_hcsheepbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCSheepmaletired");
        inv:AddItem("Hydrocraft.HCSheepfemaletired");
end

function recipe_hcgoatbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGoatmaletired");
        inv:AddItem("Hydrocraft.HCGoatfemaletired");
end

function recipe_hcgoatmilk(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCGoatfemaletired");
end

function recipe_hccowbreeding(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCowmaletired");
        inv:AddItem("Hydrocraft.HCCowfemaletired");
end

function recipe_hccowmilk(items, result, player)
        local inv = player:getInventory();
        inv:AddItem("Hydrocraft.HCCowfemaletired");
end

function recipe_hcdonkeybreeding(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDonkeymaletired");
	inv:AddItem("Hydrocraft.HCDonkeyfemaletired");
end

function recipe_hchorsebreeding(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHorsemaletired");
	inv:AddItem("Hydrocraft.HCHorsefemaletired");
end

function recipe_hcchickencoop(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCooptired");
end

--Seeds Stuff

function recipe_hcpumpkinseeds8(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCPumpkinseeds", 8)
end 

function recipe_hcteaseeds2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCTeaseeds", 2)
end 

function recipe_hccottonseeds(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCottonseeds")
end 

function recipe_hchempseeds2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCHempseeds", 2)
end 

function recipe_hctobaccoseeds2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCTobaccoseeds", 2)
end 

function recipe_hcjuteseeds2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCJuteseeds", 2)
end

function recipe_hcmulberryleaves(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCMulberryleaf", 5)
end 

function recipe_hcgrapeleaves(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Base.GrapeLeaves", 5)
end 

--Herbalism Stuff

function recipe_hcgetpoppyflower(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPoppyflower");
end

function recipe_hcchilipeppercut(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChilipeppercut");
end

function recipe_hcplantfibers(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPlantfibers");
end


function recipe_hcchaff(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCChaff");
end

function recipe_hcchaff2(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCChaff", 2)
end 

function recipe_hcchaffbran(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCChaff", 2)
	inv:AddItems("Hydrocraft.HCBran", 2)
end 


function recipe_hcstraw(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCStraw", 6)
end 


function recipe_hccob(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCCob")
	inv:AddItem("Hydrocraft.HCHusk")	
end 

--Open Cigarette Packs
function recipe_opencigpack1(items, result, player)
	player:getInventory():AddItem("Base.Cigarettes")
end

function recipe_opencigpack2(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCCigaretteslights")
end

function recipe_opencigpack3(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCCigarettesmenthol")
end

--Beekeeping Stuff

function recipe_hcbeeswax(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCBeeswax", 4)
end 

function isWinter()
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		return true
	end
    return false
end

function recipe_hcfeedbeehive1(items, result, player)
	local inv = player:getInventory();

	if isWinter() then 
		player:Say("Bees are dormant in the winter.")
		inv:AddItems("Hydrocraft.HCPollen",4)
		inv:AddItem("Hydrocraft.HCBeehive1")
		return
	end

	inv:AddItem("Hydrocraft.HCBeehive1Active")
end

function recipe_hcfeedbeehive2(items, result, player)
	local inv = player:getInventory();

	if isWinter() then 
		player:Say("Bees are dormant in the winter.")
		inv:AddItems("Hydrocraft.HCPollen",8)
		inv:AddItem("Hydrocraft.HCBeehive2")			
		return
	end

	inv:AddItem("Hydrocraft.HCBeehive2Active")
end

function recipe_hcfeedbeehive3(items, result, player)
	local inv = player:getInventory();

	if isWinter() then 
		player:Say("Bees are dormant in the winter.")
		inv:AddItems("Hydrocraft.HCPollen",12)
		inv:AddItem("Hydrocraft.HCBeehive3")			
		return
	end

	inv:AddItem("Hydrocraft.HCBeehive3Active")
end

function recipe_hcbeehive1(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBeehive1");
end

function recipe_hcbeehive2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBeehive2");
end

function recipe_hcbeehive3(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBeehive3");
end

function HCHoneycomb12(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCHoneycomb", 12)
end

--Cheese Stuff

function recipe_Process_RWAX(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCCheesecloth");
	inv:AddItem("Base.Pot");
	inv:AddItem("Base.Stone");
end

function recipe_hccheesetray(items, result, player)
	local inv = player:getInventory();
	inv:AddItems("Hydrocraft.HCCheesetray",4);
	inv:AddItem("Hydrocraft.HCCheeserack");	
end

--Wine Stuff

function recipe_hcwineempty(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WineEmpty");
end

function recipe_hcwineempty2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WineEmpty2");
end


-- Methanol
function recipe_getMethanol(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCMethanol", 5)
end


--Seafood Stuff

function recipe_hcgivemusselshell(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCMusselshell")
end

--Unbox Flat of Ramen
function recipe_unboxramenflat(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCCardboardflat")
end

--pickling
function recipe_hcsaltshaker(items,result,player)
	player:getInventory():AddItem("Hydrocraft.HCSaltshakerempty");
end

function recipe_hcsaltshakerandbowls(items,result,player)
	player:getInventory():AddItem("Hydrocraft.HCSaltshakerempty");
	HCRecipeBowls(items, result, player)
end

--Kitchen Stuff (Item Returns)

function recipe_hcnapkinholder(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCNapkinholder");
end

function recipe_hcbakingpan(items,result,player)
    player:getInventory():AddItem("Base.Pan");
end

function recipe_piepan(items,result,player)
    player:getInventory():AddItem("Hydrocraft.HCPiepan");
end

function recipe_hcsaucepan(items,result,player)
    player:getInventory():AddItem("Base.Saucepan");
end

function recipe_hcjellomold(items,result,player)
    player:getInventory():AddItem("Hydrocraft.HCJellomold1");
end

function recipe_hcmuffinpan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMuffinpan");
end

function recipe_hcbakingtray(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.BakingTray");
end

function recipe_hcbreadpan(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCBreadpan");
end

function recipe_hcbowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Bowl");
end

function recipe_hcjar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCJar");
end

function recipe_hcjar(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCJar")
end

function recipe_hcporcelainsaucer(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCPorcelainsaucer")
end

function recipe_hcjar5(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCJar", 5)
end 

function recipe_hcfortune(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCFortune")
end

function recipe_hcjarlid(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.JarLid")
end

function recipe_hcpizzastone(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCPizzastone")
end

function recipe_hcacornsoaked(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCAcornsoaked")
end

function recipe_hcsourdough(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCSourdoughstarterdepleted")
end

function recipe_hcpot(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.Pot")
end

function recipe_hcpotatopot3(items, result, player)
	player:getInventory():AddItems("Base.Pot", 3)
end

function recipe_hclargetuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCLargetuplid");
end

function recipe_hcmediumtuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCMediumtuplid");
end

function recipe_hcsmalltuplid(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCSmalltuplid");
end

--Rope Stuff

function recipe_hcropethin(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCRopethin");
end 

function recipe_hcrope(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Rope");
end 

function recipe_hcropethick(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCRopethick")
end 

--Pack Animal Stuff

function HCRemoveDogPack(items, result, player)
	HCEmptyContainerOnRecipe(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.Rope")
	inv:AddItems("Base.Bag_SurvivorBag", 2)
end


function HCRemoveDonkeyPack(items, result, player)
	HCEmptyContainerOnRecipe(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.Rope")
	inv:AddItems("Hydrocraft.HCAlicepack3", 2)	
end 

function HCRemoveHorseSaddle(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCHorsesaddle")
end 

--Bike Stuff

function HCRemoveBikeBaskets(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Base.Rope")
	inv:AddItems("Hydrocraft.HCStrawbasket", 2)
end 

--Telescope Stuff

function recipe_hctelescopetripod(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCTelescopetripod");
end 

function recipe_hcopentelescope(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCTelescopescope")
	inv:AddItem("Hydrocraft.HCTelescopetripod")
	inv:AddItem("Hydrocraft.HCBubblewrap")
end

--Zombie Stuff

function recipe_hcskinzed(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCZedskin")
end 

function recipe_hcdissectzed(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCZedbrain")
	inv:AddItem("Hydrocraft.HCZedheart")
	inv:AddItem("Hydrocraft.HCZedliver")	
	inv:AddItem("Hydrocraft.HCZedpancreas")	
	
	inv:AddItems("Hydrocraft.HCZedlung", 2)
	inv:AddItems("Hydrocraft.HCZedkidney", 2)
	inv:AddItems("Hydrocraft.HCZedintestines", 4)
	inv:AddItems("Hydrocraft.HCLard", 2)	
	player:getXp():AddXP(Perks.Doctor, 10)	
end 

function recipe_hcremovezed(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCZedmeat")
	inv:AddItem("Hydrocraft.HCZedskin")
end 

function recipe_hczedskull(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCZedskull")
end 

function recipe_hczedhead(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCZedhead")
end 

function recipe_hczedbutcher(items, result, player)
	local inv = player:getInventory()
	inv:AddItems("Hydrocraft.HCZedsteak", 4)
	inv:AddItems("Hydrocraft.HCLard", 2)
end 

--Animal Skinning Stuff

function recipe_hcskinrabbit(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawrabbit");
end 

function recipe_hcskinsquirrel(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawsquirrel");
end 

function recipe_hcskingroundhog(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawgroundhog");
end 

function recipe_hcskinmuskrat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawmuskrat");
end 

function recipe_hcskinnutria(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawnutria");
end 

function recipe_hcskinbeaver(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbeaver");
end 

function recipe_hcskinporcupine(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCPorcupinequills");
end 

function recipe_hcskinarmadillo(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawarmadillo");
end 

function recipe_hcskinfox(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawfox");
end

function recipe_hcskinopossum(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawopossum");
end  

function recipe_hcskinskunk(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawskunk");
end  

function recipe_hcskinraccoon(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawraccoon");
end 

function recipe_hcskinboar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawboar");
end 

function recipe_hcskindeer(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawdeer");
end 

function recipe_hcskinbearblack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbearblack");
end

function recipe_hcskinbear(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbear");
end

function recipe_hcskincougar(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcougar");
end    

function recipe_hcskindog(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawdog");
end 

function recipe_hcskincat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcat");
end 

function recipe_hcskinsheep(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawsheep");
end 

function recipe_hcskingoat(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawgoat");
end 

function recipe_hcskinpig(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawpig");
end 

function recipe_hcskincow(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawcow");
end 

function recipe_hcskinbull(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCHiderawbull");
end 

function recipe_hcskindonkey(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawdonkey")
end 

function recipe_hcskinhorse(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCHiderawhorse")
end 

function recipe_hcskinanimal(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCAnimalfur")
end 

function recipe_hcskinanimal2(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCAnimalfur", 2)
end 

function recipe_hcskinanimal4(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCAnimalfur", 4)
end 

function recipe_hcskinanimal6(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCAnimalfur", 6)
end 

function recipe_hcskinanimal8(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCAnimalfur", 8)
end 

function recipe_hcboartusks(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCBoartusk", 2)
end 

function recipe_hcgoathorn(items, result, player)
	player:getInventory():AddItems("Hydrocraft.HCGoathorn", 2)
end 

--Animal Butchering Stuff

function recipe_hcdeerantlers(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Hydrocraft.HCDeerantlers");
end

--Tree Cutting Stuff

function recipe_hccutfirtree3(items, result, player)
	HCAddManySameItem("Base.Log", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 0, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 4, player);
	HCAddManySameItem("Hydrocraft.HCResin", 1, player);		
end 

function recipe_hccutfirtree4(items, result, player)
	HCAddManySameItem("Base.Log", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 0, player);
	HCAddManySameItem("Hydrocraft.HCBark", 1, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 9, player);
	HCAddManySameItem("Hydrocraft.HCResin", 2, player);		
end

function recipe_hccutfirtree5(items, result, player)
	HCAddManySameItem("Base.Log", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 2, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 14, player);
	HCAddManySameItem("Hydrocraft.HCResin", 3, player);		
end  

function recipe_hccutfirtree6(items, result, player)
	HCAddManySameItem("Base.Log", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCFircone", 2, player);
	HCAddManySameItem("Hydrocraft.HCBark", 3, player);	
	HCAddManySameItem("Hydrocraft.HCFirbough", 19, player);
	HCAddManySameItem("Hydrocraft.HCResin", 5, player);	
end 

function recipe_hccutoaktree3(items, result, player)
	HCAddManySameItem("Hydrocraft.HCOakLog", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 0, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 4, player);	
end 

function recipe_hccutoaktree4(items, result, player)
	HCAddManySameItem("Hydrocraft.HCOakLog", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 0, player);
	HCAddManySameItem("Hydrocraft.HCBark", 1, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 9, player);	
end

function recipe_hccutoaktree5(items, result, player)
	HCAddManySameItem("Hydrocraft.HCOakLog", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 1, player);
	HCAddManySameItem("Hydrocraft.HCBark", 2, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 14, player);	
end  

function recipe_hccutoaktree6(items, result, player)
	HCAddManySameItem("Hydrocraft.HCOakLog", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCAcorn", 2, player);
	HCAddManySameItem("Hydrocraft.HCBark", 3, player);	
	HCAddManySameItem("Hydrocraft.HCOakleaves", 19, player);
end 

function recipe_hccutbirchtree3(items, result, player)
	HCAddManySameItem("Base.Log", 0, player);
	HCAddManySameItem("Base.Twigs", 1, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 0, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 4, player);
end 

function recipe_hccutbirchtree4(items, result, player)
	HCAddManySameItem("Base.Log", 1, player);
	HCAddManySameItem("Base.Twigs", 3, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 0, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 1, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 9, player);	
end

function recipe_hccutbirchtree5(items, result, player)
	HCAddManySameItem("Base.Log", 2, player);
	HCAddManySameItem("Base.Twigs", 7, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 1, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 2, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 14, player);	
end  

function recipe_hccutbirchtree6(items, result, player)
	HCAddManySameItem("Base.Log", 3, player);
	HCAddManySameItem("Base.Twigs", 15, player);
	HCAddManySameItem("Hydrocraft.HCBirchcatkin", 2, player);
	HCAddManySameItem("Hydrocraft.HCBirchbark", 3, player);	
	HCAddManySameItem("Hydrocraft.TreeBranch", 19, player);
end 

--Breaking Dead Stuff

function hcrecipegetpillbox(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCPillbox");
end

function hcammoniamaking(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCChalkpowder");
end

function hcdryammoniarecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.EmptySandbag");
end

function hcfillammoniarecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.BakingTray");
end

function hcextractassrecipe(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Hydrocraft.HCJar");
end

function hcmedicanti_a(items, result, player)
    local inv = player:getInventory()
    inv:AddItems("Hydrocraft.HCPetridish", 2)
end

function hcantidish(items, result, player)
    local inv = player:getInventory()
    inv:AddItem("Hydromancerx.HCPetridish")
end

function hcbluemethrecipe(items, result, player)
    local inv = player:getInventory()
    inv:AddItem("Base.BakingTray")
end

function hcmeth(items, result, player)
    local inv = player:getInventory()
    inv:AddItem("Hydrocraft.HCEmptybarrelblue")
    inv:AddItem("Hydrocraft.HCEmptybarrelmetal")
end

--Pinata Code

function HCPinataBreak(items, result, player)
	player:getInventory():AddItem("Hydrocraft.HCCandymixed")
    HCDoStats(player, 20, 20);
end

--Minor Mundane Boost, like brushing teeth 
function recipe_minorhyienic(items, result, player)
    local boredom = 5;
    local unhappy = 5;
	local stress = 5;
	HCDoStats(player, boredom, unhappy, stress);
end 

--Yossitaru
--Boredom and Unhappiness recipe modifiers.

function HC_ToyStatModifier(items, result, player)
    --Defaults to ten each.
    local boredom = 10;
    local unhappy = 10;
    
    --Combo uses are twenty each.
    if items:size() > 1 then
    boredom = 20;
    unhappy = 20;
    else
        local toy = items:get(0):getType();
    
        --Minus two to both.
        if toy == "HCBaseballglove" or toy == "HCToyglasses" or toy == "HCBowlingpin" then
            boredom = 2;
            unhappy = 2;
        --Two boredom, four unhappy.
        elseif toy == "HCGardengnome" then
            boredom = 2;
            unhappy = 4;
        --Two boredom, six unhappy.
        elseif toy == "Doll" or toy == "HCToydoll" or toy == "HCToydog" or toy == "HCToyoctopus" or toy == "HCToytriceratops" or toy == "HCToytrex" or toy == "HCToystegosaurus" or toy == "HCToypterodactyl" or toy == "HCToybrontosaurus" or toy == "HCToyshark" or toy == "HCToyactionfigure1" or toy == "HCToyactionfigure2" or toy == "HCToyactionfigure3" or toy == "HCToyactionfigure4" or toy == "HCToyarmyman" or toy == "Rubberducky" or toy == "ToyBear" or toy == "HCToyrabbit" or toy == "HCToycat" or toy == "HCToydonkey" or toy == "HCToyhippo" or toy == "HCToymonkey" or toy == "HCToypanda" then
            boredom = 2;
            unhappy = 6;
        --Two boredom, ten unhappy.
        elseif toy == "Spiffo" or toy == "HCToyunicorn" or toy == "HCToydragon" then
            boredom = 2;
            unhappy = 10;
        --Four boredom, two unhappy.
        elseif toy == "HCCaclulator" or toy == "Dice" or toy == "HCToyrings" or toy == "HCToytop" then
            boredom = 4;
            unhappy = 2;
        --Four boredom, six unhappy.
        elseif toy == "CardDeck" then
            boredom = 4;
            unhappy = 6;
        --Six boredom, four unhappy.
        elseif toy == "HCBinoculars" or toy == "HCCammera" or toy == "Yoyo" then
            boredom = 6;
            unhappy = 4;
        --Six boredom, six unhappy.
        elseif toy == "HCLaserpointer" or toy == "HCPaddleball" or toy == "PoolBall" or toy == "HCToyhorse" or toy == "HCToyrobot" then
            boredom = 6;
            unhappy = 6;
        --Six boredom, ten unhappy.
        elseif toy == "HCHarmonica" then
            boredom = 6;
            unhappy = 10;
        --Ten boredom, four unhappy.
        elseif toy == "Bricktoys" or toy == "HCToycar" or toy == "HCToyairplane" or toy == "HCToyship" or toy == "HCToytrain" or toy == "HCToyrocketship" or toy == "HCToyhelicopter" or toy == "HCToydrawing" then
            boredom = 10;
            unhappy = 4;
        --Ten boredom, six unhappy.
        elseif toy == "HCCheckers" then
            boredom = 10;
            unhappy = 6;
        end
    end
    HCDoStats(player, boredom, unhappy);
end

--Changes made to boredom and unhappyness.
function HCDoStats(player, b, u)
	player:getBodyDamage():setBoredomLevel(player:getBodyDamage():getBoredomLevel() - b);
	player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - u);
end

--Cookie Jar random cookies.
function HCJarCookies(items, result, player)
	local cookies = {
		"Hydrocraft.HCHomemadecookie",
		"Hydrocraft.HCChipcookie",
		"Hydrocraft.HCCookiewhite",
		"Hydrocraft.HCCookiepeanutbutter",
		"Hydrocraft.HCChocolatecookie",
		"Hydrocraft.HCChocolatecookie"
	}
	local cookie = cookies[ZombRand(#cookies) + 1]
	local count = ZombRand(10)+1
	player:getInventory():AddItems(cookie, count)
end

--Simple loop for lots of the same item. --DO NOT CALL THIS FUNCTION.
function HCAddManySameItem(item, count, player)
	for x=0, count do
		player:getInventory():AddItem(item);
	end
end

function HCHappyTen(items, result, player)
	player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() - 10);
end

--Checking Bowls.
function HCRecipeBowls(items, result, player)
    bowls = 0;
    for x=0, items:size()-1 do
        print(items:get(x):getType()); --TODO: add 'BowlOfFood' tag?
            if items:get(x):getType() == "HCTacosaucebowl" or items:get(x):getType() == "HCGuacamolebowl" or items:get(x):getType() == "HCSalsabowl" or items:get(x):getType() == "HCNachobowl" or items:get(x):getType() == "HCSpicypaste" or items:get(x):getType() == "HCTomatosaucebowl" or items:get(x):getType() == "HCLemonjuicebowl" or items:get(x):getType() == "HCBBQsaucebowl" then
                    bowls = bowls + 1;
            end
    end
    if bowls > 0 then
		player:getInventory():AddItems("Base.Bowl", bowls)
    end
end

--Random Gifts
function HCRandomGiftGet(items, result, player)
giftSet = {"Hydrocraft.HCBookanarchist", "Hydrocraft.HCBinoculars", "Hydrocraft.HCCalculator", "Hydrocraft.HCLaserpointer", "Base.Spiffo", "Hydrocraft.HCToyrobot", "Hydrocraft.HCToydrawing",  "Hydrocraft.HCDVDPlayer", "Base.Book", "Base.WhiskeyFull", "Base.Wine", "Base.Wine2", "Base.FishingRod", "Base.Headphones",  "Base.Radio", "Base.DigitalWatch", "Hydrocraft.HCFlashlightoff","Hydrocraft.HCBookbedtime", "Hydrocraft.HCBookfairytale", "Hydrocraft.HCDogwhistle"};
    gift = ZombRand(#giftSet) + 1;
    player:getInventory():AddItem(giftSet[gift]);
end

--Randomized Eggs.
function HCRandomegg(items, result, player)
	local eggs = {
		"Hydrocraft.HCSparrowegg",
		"Hydrocraft.HCChickenegg",
		"Hydrocraft.HCGooseegg",
		"Base.WildEggs"
	}
	local egg = eggs[ ZombRand(#eggs)+1 ]
	player:getInventory():AddItem(egg)
end

--Randomized Dogs. 
function HCDogCall(items, result, player)
	local dogs = {
		"Hydrocraft.HCGoldenfemale",
		"Hydrocraft.HCGoldenmale",
		"Hydrocraft.HCBeaglefemale",
		"Hydrocraft.HCBeaglemale",
		"Hydrocraft.HCIrishsetterfemale",
		"Hydrocraft.HCIrishsettermale",
		"Hydrocraft.HCDachshundfemale",
		"Hydrocraft.HCDachshundmale",
		"Hydrocraft.HCBordercolliemale",
		"Hydrocraft.HCBordercolliefemale",
		"Hydrocraft.HCBoxermale",
		"Hydrocraft.HCBoxerfemale",
		"Hydrocraft.HCColliemale",
		"Hydrocraft.HCColliefemale",
		"Hydrocraft.HCCorgimale",
		"Hydrocraft.HCCorgifemale",
		"Hydrocraft.HCDobermanmale",
		"Hydrocraft.HCDobermanfemale",
		"Hydrocraft.HCGreatdanemale",
		"Hydrocraft.HCGreatdanefemale",
		"Hydrocraft.HCGermanshepherdmale",
		"Hydrocraft.HCGermanshepherdfemale",
		"Hydrocraft.HCHeelermale",
		"Hydrocraft.HCHeelerfemale",
		"Hydrocraft.HCHuskymale",
		"Hydrocraft.HCHuskyfemale",
		"Hydrocraft.HCLabradormale",
		"Hydrocraft.HCLabradorfemale",
		"Hydrocraft.HCRottweilermale",
		"Hydrocraft.HCRottweilerfemale",
		"Hydrocraft.HCShibainumale",
		"Hydrocraft.HCShibainufemale",
		"Hydrocraft.HCPitbullmale",
		"Hydrocraft.HCPitbullfemale",
		"Hydrocraft.HCBernesemale",
		"Hydrocraft.HCBernesefemale"
	}

    local dog = dogs[ZombRand(#dogs) + 1];
	player:getInventory():AddItem(dog)

end

--Randomized Cats. 
function HCCatCall(items, result, player)
	local cats = {
		"Hydrocraft.HCCatwmale",
		"Hydrocraft.HCCatwhitefemale",
		"Hydrocraft.HCCatsilvermale",
		"Hydrocraft.HCCatsilverfemale",
		"Hydrocraft.HCCatgingermale",
		"Hydrocraft.HCCatgingerfemale",
		"Hydrocraft.HCCatcreammale",
		"Hydrocraft.HCCatcreamfemale",
		"Hydrocraft.HCCatbrownmale",
		"Hydrocraft.HCCatbrownfemale",
		"Hydrocraft.HCCatbluemale",
		"Hydrocraft.HCCatbluefemale",
		"Hydrocraft.HCCatblackmale",
		"Hydrocraft.HCCatblackfemale",
		"Hydrocraft.HCCatmale",
		"Hydrocraft.HCCatfemale"
	}
	local cat = cats[ ZombRand(#cats)+1 ]
	player:getInventory():AddItem(cat)

end

--Randomized Chicken.
function getChicken(items, result, player)
    chicken = ZombRand(3)
    if chicken == 2 then
        player:getInventory():AddItem("Hydrocraft.HCChickenmalebaby")
    elseif chicken == 1 then
        player:getInventory():AddItem("Hydrocraft.HCChickenfemalebaby")
    elseif chicken == 0 then
        player:getInventory():AddItem("Base.Egg")	
    end
end

--Randomized Pig.
function getPig(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find pigs indoors!");
player:getInventory():AddItem("Hydrocraft.HCPigpoopferal");
player:getInventory():AddItem("Base.Rope");
else
    pig = ZombRand(4);
    if pig == 3 then
        player:getInventory():AddItem("Hydrocraft.HCPigmale");
    elseif pig == 2 then
        player:getInventory():AddItem("Hydrocraft.HCPigfemale");
    end
end
end

--Randomized Baby Pigs.
function getPigBaby(items, result, player)
	local pigletCount = ZombRand(3) + 1
	local maleCount = ZombRand(pigletCount)
	local femaleCount = pigletCount - maleCount
	local inv = player:getInventory()
	if maleCount > 0 then
		inv:AddItems("Hydrocraft.HCPigmalebaby", maleCount)
	end
	if femaleCount > 0 then
		inv:AddItems("Hydrocraft.HCPigfemalebaby", femaleCount)
	end
	inv:AddItem("Hydrocraft.HCPigmaletired") --female is returned via result of recipe.
end

--Randomized Sheep.
function getSheep(items, result, player)
	if ( player:isOutside() == false ) then
		player:Say("I cannot find sheep indoors!") --TODO: translate this.
		player:getInventory():AddItem("Hydrocraft.HCSheeppoopferal")
		player:getInventory():AddItem("Base.Rope")
	else
		sheep = ZombRand(4);
		if sheep == 3 then
			player:getInventory():AddItem("Hydrocraft.HCSheepmale")
		elseif sheep == 2 then
			player:getInventory():AddItem("Hydrocraft.HCSheepfemale")
		end
	end
end

--Randomized Baby Sheep.
function getSheepBaby(items, result, player)
	local inv = player:getInventory()
	if ZombRand(2) == 0 then
		inv:AddItem("Hydrocraft.HCSheepmalebaby")
	else
		inv:AddItem("Hydrocraft.HCSheepfemalebaby")
	end	
	inv:AddItem("Hydrocraft.HCSheepmaletired")
end

--Randomized Goat.
function getGoat(items, result, player)
	local inv = player:getInventory()
	if player:isOutside() then
		local r = ZombRand(4);
		if r == 0 then
			inv:AddItem("Hydrocraft.HCGoatmale");
		elseif r == 1 then
			inv:AddItem("Hydrocraft.HCGoatfemale");
		end
	else
		player:Say("I cannot find anything indoors!");
		inv:AddItem("Hydrocraft.HCGoatpoopferal");
		inv:AddItem("Base.Rope");
	end
end

--Randomized Baby Goat.
function getGoatBaby(items, result, player)
	local inv = player:getInventory()
	if ZombRand(2) == 0 then
		inv:AddItem("Hydrocraft.HCGoatmalebaby")
	else
		inv:AddItem("Hydrocraft.HCGoatfemalebaby")
	end
	inv:AddItem("Hydrocraft.HCGoatmaletired")
end

--Randomized Cow.
function getCow(items, result, player)
	local inv = player:getInventory()
	if player:isOutside() then
		local r = ZombRand(4)
		if r == 0 then
			inv:AddItem("Hydrocraft.HCCowmale")
		elseif r == 1 then
			inv:AddItem("Hydrocraft.HCCowfemale")
		end
	else
		player:Say("I cannot find anything indoors!")
		inv:AddItem("Hydrocraft.HCCowpoopferal")
		inv:AddItem("Base.Rope")
	end
end

--Randomized Baby Cow.
function getCowBaby(items, result, player)
	local inv = player:getInventory()
	if ZombRand(2) == 0 then
		inv:AddItem("Hydrocraft.HCCowmalebaby")
	else
		inv:AddItem("Hydrocraft.HCCowfemalebaby")
	end
	player:getInventory():AddItem("Hydrocraft.HCCowmaletired")		
end

--Randomized Donkey.
function getDonkey(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCDonkeypoopferal");
player:getInventory():AddItem("Base.Rope");
else
    donkey = ZombRand(4);
    if donkey == 3 then
        player:getInventory():AddItem("Hydrocraft.HCDonkeymale");
    elseif donkey == 2 then
        player:getInventory():AddItem("Hydrocraft.HCDonkeyfemale");
    end
end
end

--Randomized Baby Donkey.
function getDonkeyBaby(items, result, player)
		local donkey = ZombRand(2);
		if donkey == 1 then
			player:getInventory():AddItem("Hydrocraft.HCDonkeymalebaby");
		elseif donkey == 0 then
			player:getInventory():AddItem("Hydrocraft.HCDonkeyfemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCDonkeymaletired");
end

--Randomized Horse.
function getHorse(items, result, player)
 if ( player:isOutside() == false ) then
player:Say("I cannot find anything indoors!");
player:getInventory():AddItem("Hydrocraft.HCHorsepoopferal");
player:getInventory():AddItem("Base.Rope");
else
    horse = ZombRand(4);
    if horse == 3 then
        player:getInventory():AddItem("Hydrocraft.HCHorsemale");
    elseif horse == 2 then
        player:getInventory():AddItem("Hydrocraft.HCHorsefemale");
    end
end
end

--Randomized Baby Horse.
function getHorseBaby(items, result, player)
		local horse = ZombRand(2);
		if horse == 1 then
			player:getInventory():AddItem("Hydrocraft.HCHorsemalebaby");
		elseif horse == 0 then
			player:getInventory():AddItem("Hydrocraft.HCHorsefemalebaby");
		end;
		
		player:getInventory():AddItem("Hydrocraft.HCHorsemaletired");
end

--Randomized Silk Moth.
function getSilkmoth(items, result, player)
	local r = ZombRand(4)
    if r == 0 then
        player:getInventory():AddItem("Hydrocraft.HCSilkmothmale");
    elseif r == 1 then
        player:getInventory():AddItem("Hydrocraft.HCSilkmothfemale");
    end
end

--Randomized Baby Rabbits.
function HCRabbitGet(items, result, player)
	local rabbitCount = ZombRand(3) + 1
	local maleCount = ZombRand(rabbitCount)
	local femaleCount = rabbitCount - maleCount
	local inv = player:getInventory()
	if maleCount > 0 then
		inv:AddItems("Hydrocraft.HCRabbitmale", maleCount)
	end
	if femaleCount > 0 then
		inv:AddItems("Hydrocraft.HCRabbitfemale", femaleCount)
	end
end


function HCEmptyContainerOnRecipe(item, resultItem, player)

	local pInv = player:getInventory();
	local iTab2 = {}; --need an empty table later
	local dItem;
	
	for i = 0, (item:size()-1) do --item = number of items required for recipe
		dItem = item:get(i); 
		if dItem:getCategory() == "Container" then --if any items in recipe are bags...
			print("Container detected")
			if player:getClothingItem_Back() == dItem then --...and are equiped on the back...
				player:setClothingItem_Back(nil);
			end
			if player:getPrimaryHandItem() == dItem then --...or are equiped primary...
				player:setPrimaryHandItem(nil);
			end
			if player:getSecondaryHandItem() == dItem then --...or are equiped secondary...
				player:setSecondaryHandItem(nil); --remove them from being equipped
			end
			dInv = dItem:getInventory(); --get the inventory of recipe item
			dInvItems = dInv:getItems(); --get the size of the inventory
			if dInvItems:size() >= 1 then --if container is empty we are finished i.e. less than 1 item
				for i2 = 0, (dInvItems:size()-1) do --if not, iterate over each item
					invItem = dInvItems:get(i2);
					table.insert(iTab2, invItem) --add each item to empty table
					print(invItem:getType());
				end
			end
		end
	end
	
	for i3, k3 in ipairs(iTab2) do
		print (k3:getType()..": removing from container.")
		dInv:Remove(k3); --remove items from container in recipe
		pInv:AddItem(k3); --add items to player inventory
	end
end



function Recipe.GetItemTypes.GatherSeeds(scriptItems)
local allScriptItems = getScriptManager():getAllItems();
for typeOfSeed,props in pairs(farming_vegetableconf.props) do
	if (props.seedCollect ~= nil and props.seedCollect > 0) then 
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1);
        local vegetableName = string.gsub(props.vegetableName, "Base.", ""); 
        vegetableName = string.gsub(vegetableName, "farming.", ""); 
        vegetableName = string.gsub(vegetableName, "Hydrocraft.", "");        
        if scriptItem:getName() == vegetableName and vegetableName ~= "HCMulberry" then
        scriptItems:add(scriptItem);
        end
    end -- loop items
end -- vegy has seeds
end -- loop crops
end -- function 
 

function HCgatherSeeds(items, resultItem, player) --0 = thing with seeds, 1=knife
	local inv = player:getInventory()
	
	local itemName = items:get(0):getType()
	--print( itemName )

	for typeOfSeed,props in pairs(farming_vegetableconf.props) do
		local vegetableName = string.gsub(props.vegetableName, "Base.", "")
		vegetableName = string.gsub(vegetableName, "farming.", "");
		vegetableName = string.gsub(vegetableName, "Hydrocraft.", "")
		if (itemName == vegetableName) then
			--print (vegetableName)
			if props.gatherSeed ~= nil then
				inv:AddItems(props.gatherSeed, props.seedCollect)
			else
				inv:AddItems(props.seedName, props.seedCollect)
			end
		end
	end
end

--calls vanilla code then adds a cigarette butt if desired
function HCOnEat_Cigarettes(food, character, percent)
	OnEat_Cigarettes(food, character, percent) --calls vanilla smoking code
	if(SandboxVars.Hydrocraft.SpawnCigaretteButts == true) then
		character:getInventory():AddItem("Hydrocraft.HCCigarettebutt")
	end
end

function HCOpenSealedLetter(items, result, player)
	local list = {
		"Hydrocraft.HCMagazinemetalworking1",
		"Hydrocraft.HCMagazinemetalworking2",
		"Hydrocraft.HCMagazinemetalworking3",
		"Hydrocraft.HCMagazinemetalworking4",
		"Hydrocraft.HCMagazinemetalworking5",
		"Hydrocraft.HCMagazinemetalworking6",
		"Hydrocraft.HCMagazinemetalworking7",
		"Hydrocraft.HCAdultmagazine",
		"Hydrocraft.HCAdultmagazine2",
		"Hydrocraft.HCAdultmagazine3",
		"Hydrocraft.HCAdultmagazine4",
		"Hydrocraft.HCAdultmagazine5",
		"Hydrocraft.HCAdultmagazine6",
		"Base.HerbalistMag",
		"Base.ElectronicsMag4", --How to Use Generators
		"Base.HottieZ", --TODO: remove vanilla mags? They're already very common.
		"Base.ComicBook",
		"Base.MagazineCrossword1",
		"Base.MagazineCrossword2",
		"Base.MagazineCrossword3",
		"Base.MagazineWordsearch1",
		"Base.MagazineWordsearch2",
		"Base.MagazineWordsearch3"
	}
	local magazine = list[ 1 + ZombRand( #list ) ]
	local inv = player:getInventory();
	inv:AddItem(magazine);
end

function Recipe.OnCreate.Hydrocraft.BoxThings(items, result, player)

	local item = items:get(0)
	local count = items:size()
	local weight = item:getActualWeight() * count * 0.80 --20% weight reduction
	
	result:setCustomWeight( true )
	result:setWeight( weight )
	result:setActualWeight( weight )
	result:setDisplayCategory( item:getDisplayCategory() )-- not preserved on re-load, don't know why.
	
	result:setCustomName( true ) --required?
	result:setName( "Box of " .. item:getName() .. " [" .. count .. "]" )
	
	local modData = result:getModData()
	modData.StoredFullType = item:getFullType()
	modData.StoredAmount = count

end

function Recipe.OnCreate.Hydrocraft.OpenBox(items, result, player)

	local item = items:get(0)

	local modData = item:getModData()
	local ft = modData.StoredFullType
	local count = modData.StoredAmount
	
	player:getInventory():AddItems( ft, count )

end

--use to give the player the accurate number of pages from a book
function Recipe.OnCreate.Hydrocraft.PullOutPages(items, result, player)
	local book = items:get(0)
	local pageCount = book:getNumberOfPages()
	if pageCount > 0 then
		player:getInventory():AddItems("Base.SheetPaper2", pageCount / 2)
	end
end