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
		'health', 'badCare', 'exterior', 'spriteName', 'objectName'})

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


waterbarrel=self:findbarrel(luaObject:getSquare())
if waterbarrel ~= nil then 

raingutter=self:findRainGutter(waterbarrel:getSquare())
if raingutter then -- move water from raingutter to barrel
--print ("raingutter has:" .. raingutter:getWaterMax() .. "max and contains: ".. raingutter:getWaterAmount())

needs=waterbarrel:getWaterMax() - waterbarrel:getWaterAmount()
has=raingutter:getWaterAmount()
--print ("needs:".. needs .. "has:".. has)

if needs >= has then 
	raingutter:setWaterAmount(0)
	waterbarrel:setWaterAmount(waterbarrel:getWaterAmount()+needs)
else 
	raingutter:setWaterAmount(raingutter:getWaterAmount()-needs)
	waterbarrel:setWaterAmount(waterbarrel:getWaterMax())
end

end -- move water from raingutter to barrel


--print ("plant:" ..  availableWater ..   " barrel: ".. waterbarrel:getWaterAmount())

if availableWater < maxWater then
	waterNeeded = maxWater - availableWater 
	if waterNeeded < waterbarrel:getWaterAmount() then
	waterbarrel:setWaterAmount(waterbarrel:getWaterAmount()- (waterNeeded / 4))
	availableWater=100
	luaObject.waterLvl=100
	end
end
	--waterbarrel:setWaterAmount(300)
end


		--print ("*******  Change Health for:" .. luaObject.typeOfSeed .. "  temp:" .. temperature .. "  Waterlevel:" .. availableWater)

		if not luaObject.exterior then -- ***indoors***
			if luaObject:getSquare() ~= nil then luaObject.hasWindow = self:checkWindowsAndGreenhouse( luaObject:getSquare() )
			end
			if luaObject.hasWindow then --indoors with greenhouse: no negative effects on weather
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



function SFarmingSystem:findbarrel(sq)
if sq then
	local x=sq:getX()
	local y=sq:getY()
	local z=sq:getZ()
	--print ("****************************find -A- barrel***************************".. x .. " ".. y .. " ".. z )
	local objs = nil
	local barrel = nil
	for x = x-1,x+1 do
		for y = y-1,y+1 do

			aaa = getCell():getGridSquare(x,y,z)
			if aaa ~= nil then
				objs = aaa:getObjects()
				if objs:size() > 1 then
					for i = 0, objs:size()-1 do
						barrel = objs:get(i)
						--print (i .. ":" .. barrel:getWaterAmount())
						if barrel:getWaterAmount() > 0 then return barrel
						end -- has water
					end -- tile loop
				end -- obj size?
			end
		end -- loopy
	end -- loopx
end -- sq is valid?
return nil
end -- function 


function SFarmingSystem:checkWindowsAndGreenhouse(sq)
	-- print ("check if windows and greenhouse..")
	if sq == nil then 
		return nil 
	end
	if self:checkRoof(sq) > 0 then
		-- print ("It has a glass roof")
		return true
	end
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



function SFarmingSystem:findRainGutter(sq)
if sq then

local x=sq:getX()
local y=sq:getY()
local z=sq:getZ()+1

local objs = nil
local barrel = nil
sq = getCell():getGridSquare(x,y,z)
if sq ~= nil then
--print ("****************************find -A- RainGutter***************************" .. x .. " ".. y .. " ".. z )

	objs = sq:getObjects()
	if objs:size() > 1 then
		if objs:get(1):getSprite() then
			barrel = objs:get(1)
			if barrel:getWaterAmount() > 0 then return barrel
			end
		end 
	end 
end
end 
return nil
end  






