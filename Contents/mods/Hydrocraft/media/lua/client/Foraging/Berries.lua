
local BERRIES = {
	"farming.Strewberrie", 
	"Base.BerryBlack",
	"Base.BerryBlue",
	"Base.BerryGeneric1",
	"Base.BerryGeneric2",
	"Base.BerryGeneric3",
	"Base.BerryGeneric4",
	"Base.BerryGeneric5",
	"Hydrocraft.HCCandleberry",
	"Hydrocraft.HCHuckleberry",
	"Hydrocraft.HCCranberry",
	"Hydrocraft.HCSeaberry",
	"Hydrocraft.HCBlackcurrant",
	"Hydrocraft.HCRedcurrant",
	"Hydrocraft.HCArrowwoodberry",
	"Hydrocraft.HCRaspberry",
	"Hydrocraft.HCBlackthornberry",
	"Hydrocraft.HCCrampbarkberry",
	"Hydrocraft.HCCrowberry",
	"Hydrocraft.HCGooseberry",
	"Hydrocraft.HCHawthornfruit"
}

local function isValidBerry(fullType)

	for key, value in pairs(BERRIES) do
		if(value == fullType) then
			return true
		end
	end
	return false
end

--items are the ingredients
function MakeBunchOfBerries(items, result, player)

	local selectedBerry = items:get(0) --the berry the player used to craft the recipe

	local inv = player:getInventory()
	local contents = inv:getItems()

	local books = player:getAlreadyReadBook()
	local traits = player:getTraits()
	
	local hebalist = false
	
	if(books:contains("Base.HerbalistMag") or traits:contains("Herbalist")) then
		hebalist = true
	end

	local berries = { }
	berries[0] = selectedBerry
	local j=1
	
	--print("size=", contents:size())
	for i=0, contents:size()-1 do
		local x = contents:get(i)
		if(isValidBerry(x:getFullType())) then
			--print(" ** poison power=", x:getPoisonPower())

			if(herbalist) then
				if(x:getPoisonPower() == 0) then
					berries[j] = x
					j = j + 1
				end
			else
				berries[j] = x
				j = j + 1
			end

		end
		if(j == 4) then
			break
		end
	end

	if(j <= 3) then
		player:Say("I don't have enough berries :(")
		return
	end

	local poison = 0 --selectedBerry:getPoisonPower()
	local detection = 0 --selectedBerry:getPoisonDetectionLevel()
	
	for i=0, 3 do --loop: 0,1,2,3
		inv:Remove(berries[i])
		poison = poison + berries[i]:getPoisonPower()
		detection = detection + berries[i]:getPoisonDetectionLevel()
	end
	
	local res = InventoryItemFactory.CreateItem("Hydrocraft.HCBunchofberries")
	res:setPoisonPower(poison)
	res:setPoisonDetectionLevel(detection)
	
	inv:AddItem(res)
	player:getXp():AddXP(Perks.Cooking, 2)

end

function OnTestHasfourBerries(selectedBerry)
	local player = getPlayer()
	local inv = player:getInventory()
	local contents = inv:getItems()

	local books = player:getAlreadyReadBook()
	local traits = player:getTraits()
	
	local hebalist = false
	
	if(books:contains("Base.HerbalistMag") or traits:contains("Herbalist")) then
		hebalist = true
	end

	local berryCount = 0
	
	for i=0, contents:size()-1 do
		local x = contents:get(i)
		if(isValidBerry(x:getFullType())) then
			--print(" ** poison power=", x:getPoisonPower())
			if(herbalist) then
				if(x:getPoisonPower() == 0) then --else: don't count the poisonous berry.
					berryCount = berrycount + 1
				end
			else
				berryCount = berryCount + 1
			end
		end
	end
	--print(" **** OnTest: ", (berryCount >= 4))
	return (berryCount >= 4)
end
