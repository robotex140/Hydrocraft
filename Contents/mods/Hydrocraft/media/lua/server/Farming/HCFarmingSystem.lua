--overrides server/farming/SFarmingSystem.lua


if isClient() then return end



-- adding a few more fields for other timed actions here.

function SFarmingSystem:initSystem()
	SGlobalObjectSystem.initSystem(self)

	-- Specify GlobalObjectSystem fields that should be saved.
	self.system:setModDataKeys({'hoursElapsed'})
	
	-- Specify GlobalObject fields that should be saved.
	self.system:setObjectModDataKeys({
		'state', 'nbOfGrow', 'typeOfSeed', 'fertilizer', 'mildewLvl',
		'aphidLvl', 'fliesLvl', 'waterLvl', 'waterNeeded', 'waterNeededMax',
		'lastWaterHour', 'nextGrowing', 'hasSeed', 'hasVegetable',
		'health', 'badCare', 'exterior', 'spriteName', 'objectName',
		'greenhouse'})

	self:convertOldModData()
end



-- had to be rewritten to embed the new crops. Will be switched to HCgrowAllPlants for all plants as soon as it was tested productive.
function SFarmingSystem:growPlant(luaObject, nextGrowing, updateNbOfGrow)
	if(luaObject.state == "seeded") then
		local new = luaObject.nbOfGrow <= 0
		-- allow FarmingNeverRot mod to work with hydrocraft
		if (getActivatedMods():contains("FarmingNeverRot")) then
			--NeverRot is this if statement.
			if (luaObject.nbOfGrow >6) then
				luaObject.nbOfGrow = 6
			end
		end
		
		luaObject = farming_vegetableconf.HCgrowAllPlants(luaObject, nextGrowing, updateNbOfGrow)
		if not new and luaObject.nbOfGrow > 0 then
			self:diseaseThis(luaObject, true)
		end
		luaObject.nbOfGrow = luaObject.nbOfGrow + 1
	end
end


-- had to be rewritten because of multiharvest option
function SFarmingSystem:harvest(luaObject, player)
	local props = farming_vegetableconf.props[luaObject.typeOfSeed]
	local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, luaObject)
	if player then
		player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
	end

	if luaObject.hasSeed and player then
		player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
	end

	luaObject.hasVegetable = false
	luaObject.hasSeed = false

	-- multiharvest option
	if props.multiHarvest == true then
		luaObject.nbOfGrow = 3
		luaObject.fertilizer = 0;
		self:growPlant(luaObject, nil, true)
		luaObject:saveData()
	else
		self:removePlant(luaObject)
	end
end




function SFarmingSystem:changeHealth()

local lightStrength = ClimateManager.getInstance():getDayLightStrength()
local rainStrength = ClimateManager.getInstance():getRainIntensity()
local windStrength = ClimateManager.getInstance():getWindIntensity()
local luaObject = nil
local props = nil
local minWater = 0
local maxWater = 0
local availableWater = 0
local waterbarrel = nil
local waterNeeded = 0 

local needs=0
local has=0

for i=1,self:getLuaObjectCount() do
	luaObject = self:getLuaObjectByIndex(i)
	local temperature = ClimateManager.getInstance():getAirTemperatureForSquare( luaObject:getSquare() ) --indoor temp is 22a

	if luaObject.state == "seeded" then
		props = farming_vegetableconf.props[luaObject.typeOfSeed]
		availableWater = luaObject.waterLvl
		minWater = props.waterLvl
		maxWater = props.waterLvlMax


waterbarrel=self:findbarrel(luaObject.x, luaObject.y, luaObject.z)
if waterbarrel ~= nil then
	local raingutter=self:findRainGutter(waterbarrel.x, waterbarrel.y, waterbarrel.z)
if raingutter then -- move water from raingutter to barrel
	--print ("raingutter has:" .. raingutter:getWaterMax() .. "max and contains: ".. raingutter:getWaterAmount())
	needs=waterbarrel.waterMax - waterbarrel.waterAmount
	has=raingutter.waterAmount
	--print ("needs:".. needs .. "has:".. has)
	
	if needs >= has then 
		raingutter.waterAmount = 0
		waterbarrel.waterAmount = (waterbarrel.waterAmount+needs)
	else 
		raingutter.waterAmount = raingutter.waterAmount-needs
		waterbarrel.waterAmount = waterbarrel.waterMax
	end
	-- transmits changes to the world object
	local isoObject = raingutter:getIsoObject()
	if isoObject then -- object might have been destroyed
		self:noise('added rain to barrel at '..raingutter.x..","..raingutter.y..","..raingutter.z..' waterAmount='..raingutter.waterAmount)
		isoObject:setWaterAmount(raingutter.waterAmount)
		isoObject:transmitModData()
	end
end -- move water from raingutter to barrel


--print ("plant:" ..  availableWater ..   " barrel: ".. waterbarrel:getWaterAmount())

if availableWater < maxWater then
	waterNeeded = maxWater - availableWater 
	if waterNeeded < waterbarrel.waterAmount then
		waterbarrel.waterAmount = waterbarrel.waterAmount - (waterNeeded / 4)
		availableWater=100
		luaObject.waterLvl=100
		-- transmits changes to the world object
		local isoObject = waterbarrel:getIsoObject()
		if isoObject then -- object might have been destroyed
			isoObject:setWaterAmount(waterbarrel.waterAmount)
			isoObject:transmitModData()
		end
	end
end
	--waterbarrel:setWaterAmount(300)
end


		--print ("*******  Change Health for:" .. luaObject.typeOfSeed .. "  temp:" .. temperature .. "  Waterlevel:" .. availableWater)

		if not luaObject.exterior then -- ***indoors***
			if luaObject:getSquare() ~= nil then 
				self:checkWindowsAndGreenhouse(luaObject)
			end
			if luaObject.greenhouse then --indoors with greenhouse: no negative effects on weather
				print (luaObject.typeOfSeed .. "plant is indoors with greenhouse")
				luaObject.health = luaObject.health + (lightStrength*3) 
			else 
				print (luaObject.typeOfSeed .. "plant is indoors without a greenhouse")
				luaObject.health = luaObject.health - 10 -- no indoor growing without a greenhouse plant will die
			end -- greenhouse check

		else -- **** Outdoors ***	
		print (luaObject.typeOfSeed .. " is Outside - storm and frost handling")
			if temperature < 0 then  availableWater = 0 -- no available Water if outdoors and frozen
			end
			
			-- temp handling
			if temperature < props.bestTemp then luaObject.health = luaObject.health + 0.5 - (props.bestTemp - temperature) / (props.bestTemp - props.minTemp) * 1.5 -- +0.5 at best temp, -1 at min temp
			else luaObject.health = luaObject.health + 0.5 - (props.bestTemp - temperature) / (props.bestTemp - props.maxTemp)  -- -0.5 at max temp
			end

			-- storm handling
			if props.damageFromStorm and luaObject.nbOfGrow >= 3 and rainStrength > 0.5 and windStrength > 0.5 then luaObject.health = luaObject.health - (16 * rainStrength * windStrength -3) -- 1-13 damage
			end

 		end -- indoors/outdoors	


 		-- sunlight
		luaObject.health = luaObject.health + lightStrength / 5 -- only average ~0.1/h inside
	
		-- water levels
		if availableWater < minWater then luaObject.health = luaObject.health - 0.5 - (minWater - availableWater) / 50 -- min 0.5 - max ~1.4/2.1, depending on plant
		elseif availableWater > maxWater then luaObject.health = luaObject.health - (availableWater - maxWater) / 50 -- max ~0.3 damage for most plants
		else luaObject.health = luaObject.health + 1 - math.abs(minWater + (maxWater-minWater)/2 - availableWater)/(maxWater-minWater)/2 -- 0-1 gain
		end

		-- mildew disease
		if luaObject.mildewLvl > 0 then luaObject.health = luaObject.health - 0.2 - luaObject.mildewLvl/50 -- 0.2 - 2.2 damage
		end
		if luaObject.aphidLvl > 0 then luaObject.health = luaObject.health - 0.15 - luaObject.mildewLvl/75 -- 0.15 - 1.6 damage
		end
		if luaObject.fliesLvl > 0 then luaObject.health = luaObject.health - 0.1 - luaObject.mildewLvl/100 -- 0.1 - 1.1 damage
		end

		-- plant dies
		if luaObject.health <= 0 then
			if luaObject.exterior and rainStrength > 0.7 and windStrength > 0.7 then luaObject:destroyThis()
			elseif luaObject.exterior and temperature <= 0 then luaObject:dryThis()
			elseif luaObject.waterLvl <= 0 then luaObject:dryThis()
			elseif luaObject.mildewLvl > 0 then luaObject:rottenThis()
			else luaObject:dryThis()
			end
		end
			

end -- seeded?
end -- loop over getLuaObjectCount
end -- function



function SFarmingSystem:findbarrel(x, y, z)
	--print ("****************************find -A- barrel***************************".. x .. " ".. y .. " ".. z )
	local barrel = nil
	for x = x-1,x+1 do
		for y = y-1,y+1 do
			barrel = SRainBarrelSystem.instance:getLuaObjectAt(x, y, z)
			if barrel then return barrel end
		end -- loopy
	end -- loopx
	return nil
end -- function

function SFarmingSystem:checkWindowsAndGreenhouse(luaObject)
	local sq = luaObject:getSquare()
	-- print ("check if windows and greenhouse..")
	if sq == nil then
		if luaObject.greenhouse then
			return true
		end
		return nil 
	end
	if self:checkRoof(sq) > 0 then
		luaObject.greenhouse = true
		return true
	end
	luaObject.greenhouse = false
	return false
end


function SFarmingSystem:checkRoof(sq)
	
	sq = getCell():getGridSquare(sq:getX(),sq:getY(),sq:getZ()+1)
	if sq == nil then return 0 end

	local objs = sq:getObjects()
	if objs:size() > 0 then
		if objs:get(0):getSprite() then
			local id = objs:get(0):getSprite():getID()
			if id >= 220032 and id <= 220079 then --220055 is the HC glass roof
				if id >= 220032 and id <= 220047 then return 2 --slopes probably exist twice, but the 2nd one is hidden because of iso perspective
				elseif id >= 220050 and id <= 220061 then return 1
				elseif id == 220078 or id == 220079 then return 1
				end
			end
		end
	end
	return 0
end



function SFarmingSystem:findRainGutter(x, y, z)
	local z=z+1
	local barrel = SRainBarrelSystem.instance:getLuaObjectAt(x, y, z) 
	if barrel then return barrel end
	return nil
end






