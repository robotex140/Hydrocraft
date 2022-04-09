--HCMRE.lua

--Open MRE Package
function recipe_HCMRE_OpenPackage(items, result, player)
	local inv = player:getInventory()
	inv:AddItem("Hydrocraft.HCMREmeal");
	inv:AddItem("Hydrocraft.HCMREmealside");
	inv:AddItem("Hydrocraft.HCMREFRH");
	inv:AddItem("Hydrocraft.HCMREcrackers");
	inv:AddItem("Hydrocraft.HCMREbread");
	inv:AddItem("Hydrocraft.HCPurifyingtablets");
	inv:AddItem("Hydrocraft.HCPurifyingtablets");
	inv:AddItem("Hydrocraft.AlcoholWipes");

	local items = {"Hydrocraft.HCCandymnm", "Hydrocraft.HCCandyrainbow", "Hydrocraft.HCCandycorn", "Hydrocraft.HCGum", "Hydrocraft.HCGum2", "Hydrocraft.HCGum3", "Base.Chocolate", "Hydrocraft.HCGummyworms", "Hydrocraft.HCChocolatedark", "Hydrocraft.HCGummybears", "Hydrocraft.HCJellybeans", "Hydrocraft.HCTaffy", "Hydrocraft.HCEnergybar"};

	inv:AddItem(items[ZombRand(#items)+1])

end

--Heat MRE With FRH
function recipe_HCMRE_HeatPackage(items, result, player)
	local inv = player:getInventory()

	local itemSetA = {"Hydrocraft.HCMREmealprepedA", "Hydrocraft.HCMREmealprepedB", "Hydrocraft.HCMREmealprepedC", "Hydrocraft.HCMREmealprepedD", "Hydrocraft.HCMREmealprepedE", "Hydrocraft.HCMREmealprepedF", "Hydrocraft.HCMREmealprepedG", "Hydrocraft.HCMREmealprepedH", "Hydrocraft.HCMREmealprepedI", "Hydrocraft.HCMREmealprepedJ", "Hydrocraft.HCMREmealprepedK"};

	local itemSetB = {"Hydrocraft.HCMREmealsideprepedA", "Hydrocraft.HCMREmealsideprepedB", "Hydrocraft.HCMREmealsideprepedC", "Hydrocraft.HCMREmealsideprepedD", "Hydrocraft.HCMREmealsideprepedE", "Hydrocraft.HCMREmealsideprepedF", "Hydrocraft.HCMREmealsideprepedG", "Hydrocraft.HCMREmealsideprepedH"};
	
	inv:AddItem(itemSetA[ZombRand(#itemSetA)+1])
	inv:AddItem(itemSetB[ZombRand(#itemSetB)+1])
	
end

