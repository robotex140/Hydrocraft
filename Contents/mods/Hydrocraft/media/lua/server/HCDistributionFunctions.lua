-----------------------------------------------------------
--- Defines functions for old and new distribution methods, 
--- 2021-11-17 by lorgalis
-----------------------------------------------------------
require "Items/Distributions";
require "Items/ProceduralDistributions";

 function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end
 
function csvline(item,dist,bag,procedure,weight,container,area)
   return '"' .. item .. '",' .. dist .. ',"' ..bag .. '","' .. procedure .. '","' .. weight .. '","' .. container .. '","' .. area.. '"<nl>'
end
 
 
function distributioncsv()
   print(">>distdot")
   o = Distributions[1]
   local scsv = '' 
--------------------------------------
-- 1. Locations/Areas
--------------------------------------
   for k1,v1 in pairs(o) do
      local k1T = '"' .. k1 .. '"'
--------------------------------------
-- 2. Containers
--------------------------------------
      for k2,v2 in pairs (v1) do
         if k2 ~= "isShop" then
-------------------------------------
-- 2.A. Proc + Direct distribution
-------------------------------------
            if type(v2) == 'table' then
------------------------------------
-- 3.A.1 PROC list
------------------------------------
               if v2["procList"] ~= nil then
                  for k3,v3 in pairs(v2["procList"]) do
                     local k3T = '"' .. v3["name"] .. '"'
------------------------------------
-- Handling of invalid procedures
-- bug reported 2021-12-22
-----------------------------------
--                   print ( ">>>" .. v3["name"]  )
--                   if ProceduralDistributions["list"][v3["name"]] == nil then 
--                      print ( ">>>missmatch" .. v3["name"]  )
--                   end
                     if
--                -- BakeryDoughnuts
                        v3["name"] ~= "BakeryDonuts"               and
--                -- ??????
                        v3["name"] ~= "BookstoreTailoring"         and
--                -- CafeteriaFruit
                        v3["name"] ~= "CaferteriaFruit"            and
--                -- CrateCompactDiscs
                        v3["name"] ~= "CrateCompactDisks"          and
--                -- CratePaperNapkins
                        v3["name"] ~= "CrateNapkins"               and
--                -- CrateSandBags
                        v3["name"] ~= "CrateSandbags"              and
--                -- ElectronicStoreComputers
                        v3["name"] ~= "ElectronicStoreComputer"    and
--                -- ElectronicStoreComputers
                        v3["name"] ~= "ElectronicsStoreMisc"       and
--                -- ElectronicStoreComputers
                        v3["name"] ~= "ElectronicsStoreMusic"      and
--                -- FryFactoryPotatoes
                        v3["name"] ~= "FryShippingPotatoes"        and
--                -- FryFactoryPotatoes
                        v3["name"] ~= "FryShippingPotatoes"        and
--                -- ??????
                        v3["name"] ~= "GunStoreGuns"               and
--                -- FreezerIceCream ?
                        v3["name"] ~= "IceCreamKitchenFreezer"     and
--                -- MusicStoreGuitar ?
                        v3["name"] ~= "MusicStoreAcoustic"         and
--                -- FridgeOffice ?
                        v3["name"] ~= "OfficeFridge"               and
--                -- PlankStashGun
                        v3["name"] ~= "PlankStashWeapon"           and
--                -- ProduceStoragePear
                        v3["name"] ~= "ProduceStoragePears"        and
--                -- missing?
                        v3["name"] ~= "ProduceStorageGrapes"       and
--                -- ServingTrayBurgers
                        v3["name"] ~= "ServingTrayBurger"          and
--                -- ServingTraySpringRolls
                        v3["name"] ~= "ServingTrayMeatSpringRolls" and
--                -- ServingTrayTofuFried
                        v3["name"] ~= "ServingTrayMeatTofuFried"   and
--                -- ServingTrayTaco
                        v3["name"] ~= "ServingTrayTacos"           and
--                -- SportStoreSneakers
                        v3["name"] ~= "SportsStoreSneakers"        and
--                -- SushiKitchenFreezer & SushiKitchenFridge
                        v3["name"] ~= "SushiKitchenButcher"        
                     then
-------------------------------------
-- 4.A Items in Procedures
-------------------------------------
                          local lastk4a
                          for k4,v4 in pairs(ProceduralDistributions["list"][v3["name"]].items) do
                             if k4 % 2 == 1 then 
                                lastk4a=v4
                             else
                                local weight = ''
                                if v3["weightChance"] ~= nil then
                                    weight = "weighchance=" .. v3["weightChance"]
                                end
                                scsv = scsv .. csvline(lastk4a,v4,"",v3["name"],weight, k2 , k1 )
                             end
                          end
                     end
                  end
------------------------------------
-- 3.A.2 DIRECT DISTRIBUTIOn list
------------------------------------
               elseif v2["items"] ~= nil then
--                  print( k1 .. '>>#>>' .. k2 .. '|' .. dump(v2) )
                  local lastk3a
                  for k3a2, v3a2 in pairs(v2["items"]) do
                     if k3a2 % 2 == 1 then
                        lastk3a=v3a2
                     else
                        scsv = scsv .. csvline(lastk3a,v3a2,"","item","rolls=" .. v2["rolls"], k2 , k1 )
                     end 
                  end
                  if v2["junk"] ~= nil then
                     if v2["junk"]["items"] ~= nil then
                        local lastk3j
                        for k3j2, v3j2 in pairs(v2["junk"]["items"]) do
                           if k3j2 % 2 == 1 then
                              lastk3j=v3j2
                           else
                              scsv = scsv .. csvline(lastk3j,v3j2,"","junk","rolls=" .. v2["junk"]["rolls"], k2 , k1 )
                           end 
                        end
                     end
                  end
------------------------------------
-- 3.A.3 what else?
------------------------------------
               else
                  print( k1 .. '>>$>>what else' .. k2 .. '|' .. dump(v2) )
               end
               
------------------------------------
-- 2.B.1 @todo Bags list
------------------------------------
-- @todo Bags                               else
-- @todo Bags                                     print ("ignore" .. k1T .. '|' .. dump(v1) )
            end
         end
      end
   end
   print('scsv=')
   print(scsv)
end
 

-------------------------------------------------------------------
-- Method for new distribution. Appends distribition to location
-- @todo for items only, extension for trash etc. 
-------------------------------------------------------------------
function insertItemListsInProcDistribution(location, itemDistList )
        local debugfactor = 1;
        local table = ProceduralDistributions["list"][location].items
		if(table == nil) then
			print("Error: unknown distribution location " .. location .. " - insert aborted.")
			return
		end
        local n = #table
        for idx, itemDist in ipairs(itemDistList) do
                for i=1,#itemDist do 
                        n=n+1
                        table[n] = itemDist[i]
--                        print ( ">>>>>" .. itemDist[i] )
--                        for jdx, info in ipairs(itemDist[i]) do
--                          print ( ">info1"..info )
--                        end
                        
                end
        end
end


-------------------------------------------------------------------
-- Method for new distribution. Appends distribition to location
-- @todo for items only, extension for trash etc. 
-------------------------------------------------------------------
function insertItemListsInDistribution(location, container, itemDistList )
        local debugfactor = 1;
--        print (">1>" .. dump(Distributions) )
--        print (">2>" ..  dump(Distributions[1][location]) )
--        print (">3>" ..  dump(Distributions[1][location][container]) )
--        print (">4>" ..  dump(Distributions[1][location][container]["items"]) )
        local dist = Distributions[1][location][container]["items"]
		if(dist == nil) then
			print("Error: unknown distribution list " .. location .. " " .. container .. " - insert aborted.")
			return
		end
        for idx, itemDist in ipairs(itemDistList) do
                for i=1,#itemDist do 
                        table.insert(dist, itemDist[i] ) 
                end
        end
end

-------------------------------------------------------------------
-- Method for modifying number of rolls in distribution to accomodate
-- the item increase in HC.
-------------------------------------------------------------------
function setDistributionRolls(location, container, rolls )
   Distributions[1][location][container]["rolls"] = rolls
end

-- -------------------------------------------------------------------
-- -- Method for new distribution. Appends distribition to location
-- -- @todo for items only, extension for trash etc. 
-- -------------------------------------------------------------------
-- function insertItemListsInProcDistribution(location, itemDistList )
--         local table = ProceduralDistributions["list"][location].items
--         local n = #table
--         for idx, itemDist in ipairs(itemDistList) do
--                 for i=1,#itemDist do 
--                         n=n+1
--                         table[n] = itemDist[i]
--                 end
--         end
-- end

-------------------------------------------------------------------
-- Method for new distribution. Appends distribition to location
-- with junk
-------------------------------------------------------------------
function insertJunkListsInProcDistribution(location, itemDistList )
        local table = ProceduralDistributions["list"][location].junk.items
        local n = #table
        for idx, itemDist in ipairs(itemDistList) do
                for i=1,#itemDist do 
                        n=n+1
                        table[n] = itemDist[i]
                end
        end
end



-------------------------------------------------------------------
-- Method for creating on independent distribution containers
-- 1. Add container to zone and type in global Distribution
-- 2. Add container to Procdural Distribution Table
-------------------------------------------------------------------
function createProcDistributionContainer(zone, type, newName )
-- 1.
        local dist = Distributions[1][zone][type].procList
--        table.insert(dist, {name=newName, min=0, max=1, weightChance=10000} );      
        table.insert(dist, {name=newName, min=0, max=1, weightChance=40 } );      
--        print (dump(dist) )
-- 2.
        local proc = ProceduralDistributions["list"]
        proc[newName] = { rolls = 4, items = {} }
end







