
--Randomize findings for dirt sifting.
function HCSiftDirt(items, result, player)

skill = player:getPerkLevel(Perks.PlantScavenging);

    dirtLvl0 = 1024+(18.6*skill);
    dirtLvl1 = 512+(18.6*skill);
    dirtLvl2 = 256+(18.6*skill);
    dirtLvl3 = 128+(18.6*skill);
    dirtLvl4 = 64+(18.6*skill);
    dirtLvl5 = 32+(18.6*skill);
    dirtLvl6 = 16+(18.6*skill);
    dirtLvl7 = 8+(18.6*skill);
    dirtLvl8 = 4+(18.6*skill);
    dirtLvl9 = 2+(18.6*skill);
    dirtLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCSandstone");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashlarge");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end
    elseif chance <= dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
		if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCMetalArrowhead");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
		elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashmedium");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
		end
    elseif chance <= dirtLvl8+dirtLvl9+dirtLvl10 then	
		secondChance = ZombRand(3);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCBauxiteore");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashsmall");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        elseif secondChance == 2 then player:getInventory():AddItem("Base.ScrapMetal"); 	
        end
    elseif chance <= dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCIronore");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCLeadore");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end
    elseif chance <= dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCCopperore");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTinore");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end
    elseif chance <= dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2)
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCCoal");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCStonearrowhead");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end
    elseif chance <= dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then	
		secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCRocksalt");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCSandstone");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end	
    elseif chance <= dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCMetalArrowhead");
            player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCLimestone");
            player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end			
    elseif chance <= dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
		secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCRedclay",1);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCGreyclay",1);
        end	
    elseif chance <= dirtLvl1+dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
	    secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Base.Stone");
        elseif secondChance == 1 then player:getInventory():AddItem("Base.SharpedStone");
        end	
    elseif chance <= dirtLvl0+dirtLvl1+dirtLvl2+dirtLvl3+dirtLvl4+dirtLvl5+dirtLvl6+dirtLvl7+dirtLvl8+dirtLvl9+dirtLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then player:getInventory():AddItem("Base.Worm");
        end
    end
end

--Randomize findings for Mine
function HCMine(items, result, player)

local pl = getPlayer();
pl:getXp():AddXP(Perks.Strength, 2);
pl:getXp():AddXP(Perks.Fitness, 2);  

player:getStats():setEndurance(player:getStats():getEndurance() - 0.01)
skill = player:getPerkLevel(Perks.PlantScavenging);

    mineLvl0 = 1024+(18.6*skill);
    mineLvl1 = 512+(18.6*skill);
    mineLvl2 = 256+(18.6*skill);
    mineLvl3 = 128+(18.6*skill);
    mineLvl4 = 64+(18.6*skill);
    mineLvl5 = 32+(18.6*skill);
    mineLvl6 = 16+(18.6*skill);
    mineLvl7 = 8+(18.6*skill);
    mineLvl8 = 4+(18.6*skill);
    mineLvl9 = 2+(18.6*skill);
    mineLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCGoldore");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashlarge");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCMeteorite");
        elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCSandstone");            
        end
    elseif chance <= mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCSilverore");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashmedium");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCStonearrowhead");
        elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCNickelore");              
        end
    elseif chance <= mineLvl8+mineLvl9+mineLvl10 then   
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCBauxiteore");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCCinnabar");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCMagnetite");
        elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCTrashsmall");             
        end
    elseif chance <= mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCIronore");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCLeadore");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCSaltpeter");
        elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCSulphur");                
        end
    elseif chance <= mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCCopperore");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTinore");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCGypsum");
        elseif secondChance == 3 then player:getInventory():AddItem("Base.ScrapMetal");
        end
    elseif chance <= mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4)
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCCoal");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTar");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCGraphite");
        elseif secondChance == 3 then player:getInventory():AddItem("Base.ScrapMetal");
        end
    elseif chance <= mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then 
        secondChance = ZombRand(3);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCBorax");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCFeldspar");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCRocksalt");   
        end 
    elseif chance <= mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCTrashsmall");
        elseif secondChance == 2 then player:getInventory():AddItem("Base.ScrapMetal");
        end  
    elseif chance <= mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Base.Worm");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCSandstone");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCLimestone");
        elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCChalkrock");
        end 
    elseif chance <= mineLvl1+mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCRedclay");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCGreyclay");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCMetalArrowhead");
        end 
    elseif chance <= mineLvl0+mineLvl1+mineLvl2+mineLvl3+mineLvl4+mineLvl5+mineLvl6+mineLvl7+mineLvl8+mineLvl9+mineLvl10 then
        secondChance = ZombRand(3);
        if secondChance == 0 then player:getInventory():AddItem("Base.SharpedStone");
        elseif secondChance == 1 then player:getInventory():AddItem("Base.Stone");
        elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCMetalArrowhead");
        end
    end 
end


-- shovel clay
function HCShovelClay(items, result, player)
player:getStats():setEndurance(player:getStats():getEndurance() - 0.01)

local pl = getPlayer();
pl:getXp():AddXP(Perks.Strength, 2);
pl:getXp():AddXP(Perks.Fitness, 2);  

player:getInventory():AddItems("Hydrocraft.HCRedclay",math.floor((ZombRand(10) + player:getPerkLevel(Perks.PlantScavenging)) / 4));
player:getInventory():AddItems("Hydrocraft.HCGreyclay",math.floor((ZombRand(10) + player:getPerkLevel(Perks.PlantScavenging)) / 4));
end




-- Mine stone
function HCMineStone(items, result, player)
player:getStats():setEndurance(player:getStats():getEndurance() - 0.01)
local pl = getPlayer();
pl:getXp():AddXP(Perks.Strength, 2);
pl:getXp():AddXP(Perks.Fitness, 2);  
if (ZombRand(14)==0) then player:getInventory():AddItem("Hydrocraft.HCLimestone");
end
end




--Randomize findings for Dark Mine
function HCDarkmine(items, result, player)

local pl = getPlayer();
pl:getXp():AddXP(Perks.Strength, 10);
pl:getXp():AddXP(Perks.Fitness, 10);  

player:getStats():setEndurance(player:getStats():getEndurance() - 0.15)
skill = player:getPerkLevel(Perks.PlantScavenging);

for i=1,5,1 do  

    darkLvl0 = 1024+(18.6*skill);
    darkLvl1 = 512+(18.6*skill);
    darkLvl2 = 256+(18.6*skill);
    darkLvl3 = 128+(18.6*skill);
    darkLvl4 = 64+(18.6*skill);
    darkLvl5 = 32+(18.6*skill);
    darkLvl6 = 16+(18.6*skill);
    darkLvl7 = 8+(18.6*skill);
    darkLvl8 = 4+(18.6*skill);
    darkLvl9 = 2+(18.6*skill);
    darkLvl10 = 1+(18.6*skill);
    nothing = 2048-(204.8*skill);
    chance = ZombRand(4096);
    secondChance = 0;
    if chance <= darkLvl10 then
        secondChance = ZombRand(7);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCGoldore",2);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCTrashlarge",2);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCZincore",2);
		elseif secondChance == 3 then player:getInventory():AddItems("Hydrocraft.HCTungstenore",2);
		elseif secondChance == 4 then player:getInventory():AddItems("Hydrocraft.HCTitaniumore",2);	
		elseif secondChance == 5 then player:getInventory():AddItems("Hydrocraft.HCBerlinite",2);
        elseif secondChance == 6 then player:getInventory():AddItems("Hydrocraft.HCDiatomite",2);
        end
    elseif chance <= darkLvl9+darkLvl10 then
		secondChance = ZombRand(7);
		if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCSilverore",2);
		elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCLithiumore",2);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCTrona",2);
		elseif secondChance == 3 then player:getInventory():AddItems("Hydrocraft.HCTrashmedium",2);
		elseif secondChance == 4 then player:getInventory():AddItem("Hydrocraft.HCTitaniumore");
		elseif secondChance == 5 then player:getInventory():AddItems("Hydrocraft.HCChromeore",2);			
		end
    elseif chance <= darkLvl8+darkLvl9+darkLvl10 then	
		secondChance = ZombRand(8);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCBauxiteore",3);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCCinnabar",3);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCMagnetite",3);
		elseif secondChance == 3 then player:getInventory():AddItems("Hydrocraft.HCZincore",3);	
		elseif secondChance == 4 then player:getInventory():AddItems("Hydrocraft.HCNickelore",3);
		elseif secondChance == 5 then player:getInventory():AddItems("Hydrocraft.HCDiatomite",3);
		elseif secondChance == 6 then player:getInventory():AddItems("Hydrocraft.HCTrashsmall",3);
		elseif secondChance == 7 then player:getInventory():AddItems("Hydrocraft.HCAlbite",3);
        end
    elseif chance <= darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(5);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCIronore",3);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCLeadore",3);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCSaltpeter",3);
        elseif secondChance == 3 then player:getInventory():AddItems("Hydrocraft.HCSulphur",3);
        elseif secondChance == 4 then player:getInventory():AddItems("Hydrocraft.HCTrashlarge",3);
        end
    elseif chance <= darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(6);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCCopperore",3);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCTinore",3);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCGypsum",3);
		elseif secondChance == 3 then player:getInventory():AddItems("Hydrocraft.HCAzurite",3);
		elseif secondChance == 4 then player:getInventory():AddItems("Hydrocraft.HCMalachite",3);
		elseif secondChance == 5 then player:getInventory():AddItems("Hydrocraft.HCCobaltore",3);				
        end
    elseif chance <= darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(3)
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCZincore",3);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCTar",3);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCGraphite",3);
        end
    elseif chance <= darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then	
		secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCBorax",3);
		elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCFeldspar",3);
		elseif secondChance == 2 then player:getInventory():AddItems("Hydrocraft.HCRocksalt",3);
        elseif secondChance == 3 then player:getInventory():AddItems("Base.ScrapMetal",3);
        end	
    elseif chance <= darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
		secondChance = ZombRand(3);
        if secondChance == 0 then player:getInventory():AddItem("Hydrocraft.HCZombiebones");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCStonearrowhead");
        elseif secondChance == 2 then player:getInventory():AddItem("Base.ScrapMetal");
        end			
    elseif chance <= darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
		secondChance = ZombRand(4);
        if secondChance == 0 then player:getInventory():AddItem("Base.Worm");
        elseif secondChance == 1 then player:getInventory():AddItem("Hydrocraft.HCSandstone");
		elseif secondChance == 2 then player:getInventory():AddItem("Hydrocraft.HCLimestone");
		elseif secondChance == 3 then player:getInventory():AddItem("Hydrocraft.HCChalkrock");
        end	
    elseif chance <= darkLvl1+darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
	    secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItems("Hydrocraft.HCRedclay",5);
        elseif secondChance == 1 then player:getInventory():AddItems("Hydrocraft.HCGreyclay",5);
        end	
    elseif chance <= darkLvl0+darkLvl1+darkLvl2+darkLvl3+darkLvl4+darkLvl5+darkLvl6+darkLvl7+darkLvl8+darkLvl9+darkLvl10 then
        secondChance = ZombRand(2);
        if secondChance == 0 then player:getInventory():AddItem("Base.SharpedStone");
        elseif secondChance == 1 then player:getInventory():AddItems("Base.Stone",5);
        end
    end	
end
end






 --  move to the gem mine.. once i got it
--Hydrocraft.HCKaolinite = Porzelan
--Hydrocraft.HCGabbro
--Hydrocraft.HCShale
--Hydrocraft.HCBasalt
--Hydrocraft.HCRhyolite
--Hydrocraft.HCDacite
--Hydrocraft.HCAlabaster
--Hydrocraft.HCObsidian
--Hydrocraft.HCMarble
--Hydrocraft.HCQuartz
--Hydrocraft.HCUraniumore
--Hydrocraft.HCDiamond
--Hydrocraft.HCKimberlite
--Hydrocraft.HCRuby
--Hydrocraft.HCSapphire
--Hydrocraft.HCEmerald
--Hydrocraft.HCTopaz
--Hydrocraft.HCGarnet
--Hydrocraft.HCThoriumore
--Hydrocraft.HCOlivine
--Hydrocraft.HCFireagate
--Hydrocraft.HCAmethyst
--Hydrocraft.HCRhodonite
--Hydrocraft.HCLepidolite
--Hydrocraft.HCJade
--Hydrocraft.HCTrona
--Hydrocraft.HCTurquoise
--Hydrocraft.HCPyrite
--Hydrocraft.HCLapislazuli
--Hydrocraft.HCAmazonite
--Hydrocraft.HCQuartzblue 
--Hydrocraft.HCQuartzrose 
--Hydrocraft.HCQuartzsmokey
--Hydrocraft.HCQuartzcitrine
--Hydrocraft.HCSchist