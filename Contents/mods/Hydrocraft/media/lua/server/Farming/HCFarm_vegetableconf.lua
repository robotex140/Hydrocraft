


farming_vegetableconf.icons = {}
farming_vegetableconf.icons["Carrots"] = "Item_Carrots";
farming_vegetableconf.icons["Broccoli"] = "Item_Broccoli";
farming_vegetableconf.icons["Radishes"] = "Item_TZ_LRRadish";
farming_vegetableconf.icons["Strawberry plant"] = "Item_TZ_Strewberry";
farming_vegetableconf.icons["Tomato"] = "Item_TZ_Tomato";
farming_vegetableconf.icons["Potatoes"] = "Item_TZ_Potato";
farming_vegetableconf.icons["Cabbages"] = "Item_TZ_CabbageLettuce";
farming_vegetableconf.icons["Onion"] = "Item_Onion"
farming_vegetableconf.icons["Hemp"] = "media/textures/Item_HCHempbudfresh.png"
farming_vegetableconf.icons["Grapes"] = "Item_Grapes"
farming_vegetableconf.icons["Lettuce"] = "Item_Lettuce"
farming_vegetableconf.icons["Corn"] = "Item_Corn"
farming_vegetableconf.icons["Wheat"] = "media/textures/Item_HCWheatBundle.png"
farming_vegetableconf.icons["Peanut"] = "Item_Peanut"
farming_vegetableconf.icons["Flax"] = "media/textures/Item_HCFlaxflower.png"
farming_vegetableconf.icons["CoffeeBeans"] = "media/textures/Item_HCBeans.png"
farming_vegetableconf.icons["Sunflower"] = "Item_SunflowerSeeds"
farming_vegetableconf.icons["SoyBeans"] = "media/textures/Item_HCBeanseeds.png"
farming_vegetableconf.icons["Mulberries"] = "media/textures/Item_HCMulberry.png"
farming_vegetableconf.icons["Candleberries"] = "media/textures/Item_HCCandleberry.png"
farming_vegetableconf.icons["Lemontree"] = "Item_Lemon"



farming_vegetableconf.props = {};


-- Carrots (12 to 16 weeks to grow)
farming_vegetableconf.props["Carrots"] = {};
farming_vegetableconf.props["Carrots"].seedsRequired = 12;
farming_vegetableconf.props["Carrots"].texture = "vegetation_farming_01_38";
farming_vegetableconf.props["Carrots"].waterLvl = 35;
farming_vegetableconf.props["Carrots"].waterLvlMax = 85;
farming_vegetableconf.props["Carrots"].timeToGrow = ZombRand(50,55);
farming_vegetableconf.props["Carrots"].minVeg = 3;
farming_vegetableconf.props["Carrots"].maxVeg = 6;
farming_vegetableconf.props["Carrots"].minVegAutorized = 10;
farming_vegetableconf.props["Carrots"].maxVegAutorized = 15;
farming_vegetableconf.props["Carrots"].vegetableName = "Base.Carrots";
farming_vegetableconf.props["Carrots"].seedName = "farming.CarrotSeed";
farming_vegetableconf.props["Carrots"].seedCollect = 0;
farming_vegetableconf.props["Carrots"].seedPerVeg = 3;
farming_vegetableconf.props["Carrots"].minTemp = 3;
farming_vegetableconf.props["Carrots"].bestTemp = 3;
farming_vegetableconf.props["Carrots"].maxTemp = 3;
farming_vegetableconf.props["Carrots"].damageFromStorm = false;
farming_vegetableconf.props["Carrots"].plantWithFruit = true;
farming_vegetableconf.props["Carrots"].multiHarvest = false;
farming_vegetableconf.props["Carrots"].vegetableName2 = "";
farming_vegetableconf.props["Carrots"].numberOfVegetables2 = 0;


--~ -- Broccoli (20 to 24 weeks to grow)
farming_vegetableconf.props["Broccoli"] = {};
farming_vegetableconf.props["Broccoli"].waterLvl = 70;
farming_vegetableconf.props["Broccoli"].waterLvlMax = 100;
farming_vegetableconf.props["Broccoli"].seedsRequired = 5;
farming_vegetableconf.props["Broccoli"].texture = "vegetation_farming_01_30";
farming_vegetableconf.props["Broccoli"].timeToGrow = ZombRand(103, 117);
farming_vegetableconf.props["Broccoli"].minVeg = 2;
farming_vegetableconf.props["Broccoli"].maxVeg = 4;
farming_vegetableconf.props["Broccoli"].minVegAutorized = 6;
farming_vegetableconf.props["Broccoli"].maxVegAutorized = 8;
farming_vegetableconf.props["Broccoli"].vegetableName = "Base.Broccoli";
farming_vegetableconf.props["Broccoli"].seedName = "farming.BroccoliSeed";
farming_vegetableconf.props["Broccoli"].seedCollect = 0;
farming_vegetableconf.props["Broccoli"].seedPerVeg = 3;
farming_vegetableconf.props["Broccoli"].minTemp = 0;
farming_vegetableconf.props["Broccoli"].bestTemp = 15;
farming_vegetableconf.props["Broccoli"].maxTemp = 25;
farming_vegetableconf.props["Broccoli"].plantWithFruit = false;
farming_vegetableconf.props["Broccoli"].damageFromStorm = false;
farming_vegetableconf.props["Broccoli"].multiHarvest = false;
farming_vegetableconf.props["Broccoli"].vegetableName2 = "";
farming_vegetableconf.props["Broccoli"].numberOfVegetables2 = 0;



-- Radishes (6 to 8 weeks to grow)
farming_vegetableconf.props["Radishes"] = {};
farming_vegetableconf.props["Radishes"].seedsRequired = 6;
farming_vegetableconf.props["Radishes"].texture = "vegetation_farming_01_54";
farming_vegetableconf.props["Radishes"].waterLvl = 45;
farming_vegetableconf.props["Radishes"].waterLvlMax = 100;
farming_vegetableconf.props["Radishes"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Radishes"].minVeg = 4;
farming_vegetableconf.props["Radishes"].maxVeg = 9;
farming_vegetableconf.props["Radishes"].minVegAutorized = 11;
farming_vegetableconf.props["Radishes"].maxVegAutorized = 15;
farming_vegetableconf.props["Radishes"].vegetableName = "farming.RedRadish";
farming_vegetableconf.props["Radishes"].seedName = "farming.RedRadishSeed";
farming_vegetableconf.props["Radishes"].seedCollect = 0;
farming_vegetableconf.props["Radishes"].seedPerVeg = 4;
farming_vegetableconf.props["Radishes"].minTemp = 5;
farming_vegetableconf.props["Radishes"].bestTemp = 15;
farming_vegetableconf.props["Radishes"].maxTemp = 30;
farming_vegetableconf.props["Radishes"].plantWithFruit = true;
farming_vegetableconf.props["Radishes"].damageFromStorm = false;
farming_vegetableconf.props["Radishes"].multiHarvest = false;
farming_vegetableconf.props["Radishes"].vegetableName2 = "";
farming_vegetableconf.props["Radishes"].numberOfVegetables2 = 0;


-- Strawberry (24 to 28 weeks to grow)
farming_vegetableconf.props["Strawberry plant"] = {};
farming_vegetableconf.props["Strawberry plant"].seedsRequired = 12;
farming_vegetableconf.props["Strawberry plant"].texture = "vegetation_farming_01_62";
farming_vegetableconf.props["Strawberry plant"].waterLvl = 85;
farming_vegetableconf.props["Strawberry plant"].waterLvlMax = 100;
farming_vegetableconf.props["Strawberry plant"].timeToGrow = ZombRand(103, 131);
farming_vegetableconf.props["Strawberry plant"].minVeg = 4;
farming_vegetableconf.props["Strawberry plant"].maxVeg = 6;
farming_vegetableconf.props["Strawberry plant"].minVegAutorized = 8;
farming_vegetableconf.props["Strawberry plant"].maxVegAutorized = 14;
farming_vegetableconf.props["Strawberry plant"].vegetableName = "farming.Strewberrie";
farming_vegetableconf.props["Strawberry plant"].seedName = "farming.StrewberrieSeed";
farming_vegetableconf.props["Strawberry plant"].seedCollect = 15;
farming_vegetableconf.props["Strawberry plant"].seedPerVeg = 0;
farming_vegetableconf.props["Strawberry plant"].minTemp = 5;
farming_vegetableconf.props["Strawberry plant"].bestTemp = 15;
farming_vegetableconf.props["Strawberry plant"].maxTemp = 30;
farming_vegetableconf.props["Strawberry plant"].plantWithFruit = true;
farming_vegetableconf.props["Strawberry plant"].damageFromStorm = false;
farming_vegetableconf.props["Strawberry plant"].multiHarvest = true;
farming_vegetableconf.props["Strawberry plant"].vegetableName2 = "";
farming_vegetableconf.props["Strawberry plant"].numberOfVegetables2 = 0;



-- Tomatos (16 to 20 weeks to grow)
farming_vegetableconf.props["Tomato"] = {};
farming_vegetableconf.props["Tomato"].seedsRequired = 4;
farming_vegetableconf.props["Tomato"].texture = "vegetation_farming_01_70";
farming_vegetableconf.props["Tomato"].waterLvl = 75;
farming_vegetableconf.props["Tomato"].waterLvlMax = 100;
farming_vegetableconf.props["Tomato"].timeToGrow = ZombRand(90, 110);
farming_vegetableconf.props["Tomato"].minVeg = 4;
farming_vegetableconf.props["Tomato"].maxVeg = 5;
farming_vegetableconf.props["Tomato"].minVegAutorized = 6;
farming_vegetableconf.props["Tomato"].maxVegAutorized = 10;
farming_vegetableconf.props["Tomato"].vegetableName = "farming.Tomato";
farming_vegetableconf.props["Tomato"].seedName = "farming.TomatoSeed";
farming_vegetableconf.props["Tomato"].seedCollect = 15;
farming_vegetableconf.props["Tomato"].seedPerVeg = 0;
farming_vegetableconf.props["Tomato"].minTemp = 10;
farming_vegetableconf.props["Tomato"].bestTemp = 25;
farming_vegetableconf.props["Tomato"].maxTemp = 35;
farming_vegetableconf.props["Tomato"].plantWithFruit = true;
farming_vegetableconf.props["Tomato"].damageFromStorm = true;
farming_vegetableconf.props["Tomato"].multiHarvest = true;
farming_vegetableconf.props["Tomato"].vegetableName2 = "";
farming_vegetableconf.props["Tomato"].numberOfVegetables2 = 0;



-- Potatos (16 to 20 weeks to grow)
farming_vegetableconf.props["Potatoes"] = {};
farming_vegetableconf.props["Potatoes"].seedsRequired = 4;
farming_vegetableconf.props["Potatoes"].texture = "vegetation_farming_01_46";
farming_vegetableconf.props["Potatoes"].waterLvl = 65;
farming_vegetableconf.props["Potatoes"].waterLvlMax = 100;
farming_vegetableconf.props["Potatoes"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Potatoes"].minVeg = 3;
farming_vegetableconf.props["Potatoes"].maxVeg = 4;
farming_vegetableconf.props["Potatoes"].minVegAutorized = 5;
farming_vegetableconf.props["Potatoes"].maxVegAutorized = 9;
farming_vegetableconf.props["Potatoes"].vegetableName = "farming.Potato";
farming_vegetableconf.props["Potatoes"].seedName = "farming.PotatoSeed";
farming_vegetableconf.props["Potatoes"].seedCollect = 0;
farming_vegetableconf.props["Potatoes"].seedPerVeg = 5;
farming_vegetableconf.props["Potatoes"].minTemp = 5;
farming_vegetableconf.props["Potatoes"].bestTemp = 20;
farming_vegetableconf.props["Potatoes"].maxTemp = 30;
farming_vegetableconf.props["Potatoes"].plantWithFruit = true;
farming_vegetableconf.props["Potatoes"].damageFromStorm = false;
farming_vegetableconf.props["Potatoes"].multiHarvest = false;
farming_vegetableconf.props["Potatoes"].vegetableName2 = "";
farming_vegetableconf.props["Potatoes"].numberOfVegetables2 = 0;


-- Cabbage (6 to 8 weeks to grow)
farming_vegetableconf.props["Cabbages"] = {};
farming_vegetableconf.props["Cabbages"].seedsRequired = 9;
farming_vegetableconf.props["Cabbages"].texture = "vegetation_farming_01_21";
farming_vegetableconf.props["Cabbages"].waterLvl = 85;
farming_vegetableconf.props["Cabbages"].waterLvlMax = 100;
farming_vegetableconf.props["Cabbages"].timeToGrow = ZombRand(90, 100);
farming_vegetableconf.props["Cabbages"].vegetableName = "farming.Cabbage";
farming_vegetableconf.props["Cabbages"].seedName = "farming.CabbageSeed";
farming_vegetableconf.props["Cabbages"].seedCollect = 0;
farming_vegetableconf.props["Cabbages"].seedPerVeg = 3;
farming_vegetableconf.props["Cabbages"].minVeg = 4;
farming_vegetableconf.props["Cabbages"].maxVeg = 6;
farming_vegetableconf.props["Cabbages"].minVegAutorized = 9;
farming_vegetableconf.props["Cabbages"].maxVegAutorized = 11;
farming_vegetableconf.props["Cabbages"].minTemp = 5;
farming_vegetableconf.props["Cabbages"].bestTemp = 15;
farming_vegetableconf.props["Cabbages"].maxTemp = 25;
farming_vegetableconf.props["Cabbages"].plantWithFruit = false;
farming_vegetableconf.props["Cabbages"].damageFromStorm = false;
farming_vegetableconf.props["Cabbages"].multiHarvest = true;
farming_vegetableconf.props["Cabbages"].vegetableName2 = "";
farming_vegetableconf.props["Cabbages"].numberOfVegetables2 = 0;



-- Onion 
farming_vegetableconf.props["Onion"] = {};
farming_vegetableconf.props["Onion"].seedsRequired = 5;
farming_vegetableconf.props["Onion"].texture = "hcFarmingOnion06_0";
farming_vegetableconf.props["Onion"].waterLvl = 85;
farming_vegetableconf.props["Onion"].waterLvlMax = 100;
farming_vegetableconf.props["Onion"].timeToGrow = ZombRand(80, 90);
farming_vegetableconf.props["Onion"].vegetableName = "Base.Onion";
farming_vegetableconf.props["Onion"].seedName = "Hydrocraft.HCOnionseeds";
farming_vegetableconf.props["Onion"].seedPerVeg = 3;
farming_vegetableconf.props["Onion"].seedCollect = 0;
farming_vegetableconf.props["Onion"].minVeg = 4;
farming_vegetableconf.props["Onion"].maxVeg = 6;
farming_vegetableconf.props["Onion"].minVegAutorized = 9;
farming_vegetableconf.props["Onion"].maxVegAutorized = 11;
farming_vegetableconf.props["Onion"].minTemp = 5;
farming_vegetableconf.props["Onion"].bestTemp = 15;
farming_vegetableconf.props["Onion"].maxTemp = 25;
farming_vegetableconf.props["Onion"].plantWithFruit = true;
farming_vegetableconf.props["Onion"].damageFromStorm = true;
farming_vegetableconf.props["Onion"].multiHarvest = false;
farming_vegetableconf.props["Onion"].vegetableName2 = "";
farming_vegetableconf.props["Onion"].numberOfVegetables2 = 0;


-- Corn 
farming_vegetableconf.props["Corn"] = {};
farming_vegetableconf.props["Corn"].seedsRequired = 10;
farming_vegetableconf.props["Corn"].texture = "vegetation_farming_01_77";
farming_vegetableconf.props["Corn"].waterLvl = 85;
farming_vegetableconf.props["Corn"].waterLvlMax = 100;
farming_vegetableconf.props["Corn"].timeToGrow = ZombRand(150, 170);
farming_vegetableconf.props["Corn"].vegetableName = "Base.Corn";
farming_vegetableconf.props["Corn"].seedName = "Hydrocraft.HCCornseeds";
farming_vegetableconf.props["Corn"].seedPerVeg = 0;
farming_vegetableconf.props["Corn"].seedCollect = 0;
farming_vegetableconf.props["Corn"].minVeg = 6;
farming_vegetableconf.props["Corn"].maxVeg = 8;
farming_vegetableconf.props["Corn"].minVegAutorized = 9;
farming_vegetableconf.props["Corn"].maxVegAutorized = 11;
farming_vegetableconf.props["Corn"].minTemp = 10;
farming_vegetableconf.props["Corn"].bestTemp = 20;
farming_vegetableconf.props["Corn"].maxTemp = 35;
farming_vegetableconf.props["Corn"].plantWithFruit = true;
farming_vegetableconf.props["Corn"].damageFromStorm = true;
farming_vegetableconf.props["Corn"].multiHarvest = false;
farming_vegetableconf.props["Corn"].vegetableName2 = "";
farming_vegetableconf.props["Corn"].numberOfVegetables2 = 0;



-- Wheat 
farming_vegetableconf.props["Wheat"] = {};
farming_vegetableconf.props["Wheat"].seedsRequired = 2;
farming_vegetableconf.props["Wheat"].texture = "hcFarmingWheat06_0";
farming_vegetableconf.props["Wheat"].waterLvl = 45;
farming_vegetableconf.props["Wheat"].waterLvlMax = 85;
farming_vegetableconf.props["Wheat"].timeToGrow = ZombRand(180, 200);
farming_vegetableconf.props["Wheat"].vegetableName = "Hydrocraft.HCWheatBundle";
farming_vegetableconf.props["Wheat"].seedName = "Hydrocraft.HCWheat";
farming_vegetableconf.props["Wheat"].seedPerVeg = 0;
farming_vegetableconf.props["Wheat"].seedCollect = 0;
farming_vegetableconf.props["Wheat"].minVeg = 8;
farming_vegetableconf.props["Wheat"].maxVeg = 10;
farming_vegetableconf.props["Wheat"].minVegAutorized = 9;
farming_vegetableconf.props["Wheat"].maxVegAutorized = 11;
farming_vegetableconf.props["Wheat"].minTemp = 10;
farming_vegetableconf.props["Wheat"].bestTemp = 20;
farming_vegetableconf.props["Wheat"].maxTemp = 35;
farming_vegetableconf.props["Wheat"].plantWithFruit = false;
farming_vegetableconf.props["Wheat"].damageFromStorm = true;
farming_vegetableconf.props["Wheat"].multiHarvest = false;
farming_vegetableconf.props["Wheat"].vegetableName2 = "";
farming_vegetableconf.props["Wheat"].numberOfVegetables2 = 0;


-- Hemp 
farming_vegetableconf.props["Hemp"] = {};
farming_vegetableconf.props["Hemp"].seedsRequired = 5;
farming_vegetableconf.props["Hemp"].texture = "hcFarmingHemp06_0";
farming_vegetableconf.props["Hemp"].waterLvl = 45;
farming_vegetableconf.props["Hemp"].waterLvlMax = 100;
farming_vegetableconf.props["Hemp"].timeToGrow = ZombRand(200, 250);
farming_vegetableconf.props["Hemp"].vegetableName = "Hydrocraft.HCHempbudfresh";
farming_vegetableconf.props["Hemp"].seedName = "Hydrocraft.HCHempseeds";
farming_vegetableconf.props["Hemp"].seedPerVeg = 10;
farming_vegetableconf.props["Hemp"].seedCollect = 1;
farming_vegetableconf.props["Hemp"].minVeg = 8;
farming_vegetableconf.props["Hemp"].maxVeg = 10;
farming_vegetableconf.props["Hemp"].minVegAutorized = 9;
farming_vegetableconf.props["Hemp"].maxVegAutorized = 11;
farming_vegetableconf.props["Hemp"].minTemp = 10;
farming_vegetableconf.props["Hemp"].bestTemp = 20;
farming_vegetableconf.props["Hemp"].maxTemp = 35;
farming_vegetableconf.props["Hemp"].plantWithFruit = false;
farming_vegetableconf.props["Hemp"].damageFromStorm = true;
farming_vegetableconf.props["Hemp"].multiHarvest = false;
farming_vegetableconf.props["Hemp"].vegetableName2 = "";
farming_vegetableconf.props["Hemp"].numberOfVegetables2 = 0;


-- Grapes 
farming_vegetableconf.props["Grapes"] = {};
farming_vegetableconf.props["Grapes"].seedsRequired = 2;
farming_vegetableconf.props["Grapes"].texture = "hcFarmingGrapes06_0";
farming_vegetableconf.props["Grapes"].waterLvl = 45;
farming_vegetableconf.props["Grapes"].waterLvlMax = 100;
farming_vegetableconf.props["Grapes"].timeToGrow = ZombRand(230, 250);
farming_vegetableconf.props["Grapes"].vegetableName = "Base.Grapes";
farming_vegetableconf.props["Grapes"].seedName = "Hydrocraft.HCGrapeseeds";
farming_vegetableconf.props["Grapes"].seedPerVeg = 0;
farming_vegetableconf.props["Grapes"].seedCollect = 3;
farming_vegetableconf.props["Grapes"].minVeg = 8;
farming_vegetableconf.props["Grapes"].maxVeg = 10;
farming_vegetableconf.props["Grapes"].minVegAutorized = 9;
farming_vegetableconf.props["Grapes"].maxVegAutorized = 11;
farming_vegetableconf.props["Grapes"].minTemp = 10;
farming_vegetableconf.props["Grapes"].bestTemp = 25;
farming_vegetableconf.props["Grapes"].maxTemp = 35;
farming_vegetableconf.props["Grapes"].plantWithFruit = true;
farming_vegetableconf.props["Grapes"].damageFromStorm = true;
farming_vegetableconf.props["Grapes"].multiHarvest = true;
farming_vegetableconf.props["Grapes"].vegetableName2 = "Base.GrapeLeaves";
farming_vegetableconf.props["Grapes"].numberOfVegetables2 = 10;



-- Lettuce 
farming_vegetableconf.props["Lettuce"] = {};
farming_vegetableconf.props["Lettuce"].seedsRequired = 2;
farming_vegetableconf.props["Lettuce"].texture = "hcFarmingLettuce06_0";
farming_vegetableconf.props["Lettuce"].waterLvl = 45;
farming_vegetableconf.props["Lettuce"].waterLvlMax = 100;
farming_vegetableconf.props["Lettuce"].timeToGrow = ZombRand(100, 120);
farming_vegetableconf.props["Lettuce"].vegetableName = "Base.Lettuce";
farming_vegetableconf.props["Lettuce"].seedName = "Hydrocraft.HCLettuceseeds";
farming_vegetableconf.props["Lettuce"].seedPerVeg = 10;
farming_vegetableconf.props["Lettuce"].seedCollect = 0;
farming_vegetableconf.props["Lettuce"].minVeg = 8;
farming_vegetableconf.props["Lettuce"].maxVeg = 10;
farming_vegetableconf.props["Lettuce"].minVegAutorized = 9;
farming_vegetableconf.props["Lettuce"].maxVegAutorized = 11;
farming_vegetableconf.props["Lettuce"].minTemp = 5;
farming_vegetableconf.props["Lettuce"].bestTemp = 15;
farming_vegetableconf.props["Lettuce"].maxTemp = 30;
farming_vegetableconf.props["Lettuce"].plantWithFruit = false;
farming_vegetableconf.props["Lettuce"].damageFromStorm = false;
farming_vegetableconf.props["Lettuce"].multiHarvest = true;
farming_vegetableconf.props["Lettuce"].vegetableName2 = "";
farming_vegetableconf.props["Lettuce"].numberOfVegetables2 = 0;


-- Peanut 
farming_vegetableconf.props["Peanut"] = {};
farming_vegetableconf.props["Peanut"].seedsRequired = 1;
farming_vegetableconf.props["Peanut"].texture = "hcFarmingPeanut06_0";
farming_vegetableconf.props["Peanut"].waterLvl = 45;
farming_vegetableconf.props["Peanut"].waterLvlMax = 100;
farming_vegetableconf.props["Peanut"].timeToGrow = ZombRand(100, 120);
farming_vegetableconf.props["Peanut"].vegetableName = "Base.Peanuts";
farming_vegetableconf.props["Peanut"].seedName = "Base.Peanuts";
farming_vegetableconf.props["Peanut"].seedPerVeg = 0;
farming_vegetableconf.props["Peanut"].seedCollect = 0;
farming_vegetableconf.props["Peanut"].minVeg = 8;
farming_vegetableconf.props["Peanut"].maxVeg = 10;
farming_vegetableconf.props["Peanut"].minVegAutorized = 9;
farming_vegetableconf.props["Peanut"].maxVegAutorized = 11;
farming_vegetableconf.props["Peanut"].minTemp = 15;
farming_vegetableconf.props["Peanut"].bestTemp = 25;
farming_vegetableconf.props["Peanut"].maxTemp = 35;
farming_vegetableconf.props["Peanut"].plantWithFruit = true;
farming_vegetableconf.props["Peanut"].damageFromStorm = false;
farming_vegetableconf.props["Peanut"].multiHarvest = false;
farming_vegetableconf.props["Peanut"].vegetableName2 = "";
farming_vegetableconf.props["Peanut"].numberOfVegetables2 = 0;




-- Flax 
farming_vegetableconf.props["Flax"] = {};
farming_vegetableconf.props["Flax"].seedsRequired = 5;
farming_vegetableconf.props["Flax"].texture = "hcFarmingFlax06_0";
farming_vegetableconf.props["Flax"].waterLvl = 45;
farming_vegetableconf.props["Flax"].waterLvlMax = 100;
farming_vegetableconf.props["Flax"].timeToGrow = ZombRand(70, 90);
farming_vegetableconf.props["Flax"].vegetableName = "Hydrocraft.HCFlaxflower";
farming_vegetableconf.props["Flax"].seedName = "Hydrocraft.HCFlaxseeds";
farming_vegetableconf.props["Flax"].seedPerVeg = 10;
farming_vegetableconf.props["Flax"].seedCollect = 0;
farming_vegetableconf.props["Flax"].minVeg = 9;
farming_vegetableconf.props["Flax"].maxVeg = 11;
farming_vegetableconf.props["Flax"].minVegAutorized = 9;
farming_vegetableconf.props["Flax"].maxVegAutorized = 11;
farming_vegetableconf.props["Flax"].minTemp = 8;
farming_vegetableconf.props["Flax"].bestTemp = 20;
farming_vegetableconf.props["Flax"].maxTemp = 30;
farming_vegetableconf.props["Flax"].plantWithFruit = true;
farming_vegetableconf.props["Flax"].damageFromStorm = true;
farming_vegetableconf.props["Flax"].multiHarvest = false;
farming_vegetableconf.props["Flax"].vegetableName2 = "";
farming_vegetableconf.props["Flax"].numberOfVegetables2 = 0;



-- CoffeeBeans 
farming_vegetableconf.props["CoffeeBeans"] = {};
farming_vegetableconf.props["CoffeeBeans"].seedsRequired = 5;
farming_vegetableconf.props["CoffeeBeans"].texture = "hcFarmingCoffebean06_0";
farming_vegetableconf.props["CoffeeBeans"].waterLvl = 45;
farming_vegetableconf.props["CoffeeBeans"].waterLvlMax = 100;
farming_vegetableconf.props["CoffeeBeans"].timeToGrow = ZombRand(210, 230);
farming_vegetableconf.props["CoffeeBeans"].vegetableName = "Hydrocraft.HCCoffeeBeans";
farming_vegetableconf.props["CoffeeBeans"].seedName = "Hydrocraft.HCCoffeeBeans";
farming_vegetableconf.props["CoffeeBeans"].seedPerVeg = 0;
farming_vegetableconf.props["CoffeeBeans"].seedCollect = 0;
farming_vegetableconf.props["CoffeeBeans"].minVeg = 9;
farming_vegetableconf.props["CoffeeBeans"].maxVeg = 11;
farming_vegetableconf.props["CoffeeBeans"].minVegAutorized = 9;
farming_vegetableconf.props["CoffeeBeans"].maxVegAutorized = 11;
farming_vegetableconf.props["CoffeeBeans"].minTemp = 15;
farming_vegetableconf.props["CoffeeBeans"].bestTemp = 25;
farming_vegetableconf.props["CoffeeBeans"].maxTemp = 35;
farming_vegetableconf.props["CoffeeBeans"].plantWithFruit = true;
farming_vegetableconf.props["CoffeeBeans"].damageFromStorm = true;
farming_vegetableconf.props["CoffeeBeans"].multiHarvest = false;
farming_vegetableconf.props["CoffeeBeans"].vegetableName2 = "";
farming_vegetableconf.props["CoffeeBeans"].numberOfVegetables2 = 0;



-- Sunflower 
farming_vegetableconf.props["Sunflower"] = {};
farming_vegetableconf.props["Sunflower"].seedsRequired = 5;
farming_vegetableconf.props["Sunflower"].texture = "hcFarmingSunflower06_0";
farming_vegetableconf.props["Sunflower"].waterLvl = 45;
farming_vegetableconf.props["Sunflower"].waterLvlMax = 100;
farming_vegetableconf.props["Sunflower"].timeToGrow = ZombRand(190, 200);
farming_vegetableconf.props["Sunflower"].vegetableName = "Hydrocraft.HCSunflower";
farming_vegetableconf.props["Sunflower"].seedName = "Base.SunflowerSeeds";
farming_vegetableconf.props["Sunflower"].seedPerVeg = 0;
farming_vegetableconf.props["Sunflower"].seedCollect = 15;
farming_vegetableconf.props["Sunflower"].minVeg = 3;
farming_vegetableconf.props["Sunflower"].maxVeg = 5;
farming_vegetableconf.props["Sunflower"].minVegAutorized = 9;
farming_vegetableconf.props["Sunflower"].maxVegAutorized = 11;
farming_vegetableconf.props["Sunflower"].minTemp = 15;
farming_vegetableconf.props["Sunflower"].bestTemp = 20;
farming_vegetableconf.props["Sunflower"].maxTemp = 35;
farming_vegetableconf.props["Sunflower"].plantWithFruit = true;
farming_vegetableconf.props["Sunflower"].damageFromStorm = true;
farming_vegetableconf.props["Sunflower"].multiHarvest = true;
farming_vegetableconf.props["Sunflower"].vegetableName2 = "";
farming_vegetableconf.props["Sunflower"].numberOfVegetables2 = 0;


-- SoyBeans 
farming_vegetableconf.props["SoyBeans"] = {};
farming_vegetableconf.props["SoyBeans"].seedsRequired = 1;
farming_vegetableconf.props["SoyBeans"].texture = "hcFarmingSoyBeans06_0";
farming_vegetableconf.props["SoyBeans"].waterLvl = 45;
farming_vegetableconf.props["SoyBeans"].waterLvlMax = 100;
farming_vegetableconf.props["SoyBeans"].timeToGrow = ZombRand(190, 200);
farming_vegetableconf.props["SoyBeans"].vegetableName = "Hydrocraft.HCSoyBeans";
farming_vegetableconf.props["SoyBeans"].seedName = "Hydrocraft.HCSoyBeans";
farming_vegetableconf.props["SoyBeans"].seedPerVeg = 0;
farming_vegetableconf.props["SoyBeans"].seedCollect = 0;
farming_vegetableconf.props["SoyBeans"].minVeg = 3;
farming_vegetableconf.props["SoyBeans"].maxVeg = 5;
farming_vegetableconf.props["SoyBeans"].minVegAutorized = 9;
farming_vegetableconf.props["SoyBeans"].maxVegAutorized = 11;
farming_vegetableconf.props["SoyBeans"].minTemp = 17;
farming_vegetableconf.props["SoyBeans"].bestTemp = 26;
farming_vegetableconf.props["SoyBeans"].maxTemp = 35;
farming_vegetableconf.props["SoyBeans"].plantWithFruit = true;
farming_vegetableconf.props["SoyBeans"].damageFromStorm = false;
farming_vegetableconf.props["SoyBeans"].multiHarvest = false;
farming_vegetableconf.props["SoyBeans"].vegetableName2 = "";
farming_vegetableconf.props["SoyBeans"].numberOfVegetables2 = 0;


-- Mulberries 
farming_vegetableconf.props["Mulberries"] = {};
farming_vegetableconf.props["Mulberries"].seedsRequired = 1;
farming_vegetableconf.props["Mulberries"].texture = "hcFarmingMulberries06_0";
farming_vegetableconf.props["Mulberries"].waterLvl = 45;
farming_vegetableconf.props["Mulberries"].waterLvlMax = 100;
farming_vegetableconf.props["Mulberries"].timeToGrow = ZombRand(150, 170);
farming_vegetableconf.props["Mulberries"].vegetableName = "Hydrocraft.HCMulberry";
farming_vegetableconf.props["Mulberries"].seedName = "Hydrocraft.HCPottedmulberry";
farming_vegetableconf.props["Mulberries"].gatherSeed = "Hydrocraft.HCMulberryseeds";
farming_vegetableconf.props["Mulberries"].seedPerVeg = 0;
farming_vegetableconf.props["Mulberries"].seedCollect = 10;
farming_vegetableconf.props["Mulberries"].minVeg = 7;
farming_vegetableconf.props["Mulberries"].maxVeg = 9;
farming_vegetableconf.props["Mulberries"].minVegAutorized = 9;
farming_vegetableconf.props["Mulberries"].maxVegAutorized = 11;
farming_vegetableconf.props["Mulberries"].minTemp = 3;
farming_vegetableconf.props["Mulberries"].bestTemp = 25;
farming_vegetableconf.props["Mulberries"].maxTemp = 35;
farming_vegetableconf.props["Mulberries"].plantWithFruit = false;
farming_vegetableconf.props["Mulberries"].damageFromStorm = false;
farming_vegetableconf.props["Mulberries"].multiHarvest = true;
farming_vegetableconf.props["Mulberries"].vegetableName2 = "Hydrocraft.HCMulberryleaf";
farming_vegetableconf.props["Mulberries"].numberOfVegetables2 = 5;


-- Candleberries 
farming_vegetableconf.props["Candleberries"] = {};
farming_vegetableconf.props["Candleberries"].seedsRequired = 1;
farming_vegetableconf.props["Candleberries"].texture = "hcFarmingcandleberrytree06_0";
farming_vegetableconf.props["Candleberries"].waterLvl = 45;
farming_vegetableconf.props["Candleberries"].waterLvlMax = 100;
farming_vegetableconf.props["Candleberries"].timeToGrow = ZombRand(150, 170);
farming_vegetableconf.props["Candleberries"].vegetableName = "Hydrocraft.HCCandleberry";
farming_vegetableconf.props["Candleberries"].seedName = "Hydrocraft.HCPottedcandleberry";
farming_vegetableconf.props["Candleberries"].gatherSeed = "Hydrocraft.HCCandleberryseeds";
farming_vegetableconf.props["Candleberries"].seedPerVeg = 0;
farming_vegetableconf.props["Candleberries"].seedCollect = 5;
farming_vegetableconf.props["Candleberries"].minVeg = 5;
farming_vegetableconf.props["Candleberries"].maxVeg = 10;
farming_vegetableconf.props["Candleberries"].minVegAutorized = 9;
farming_vegetableconf.props["Candleberries"].maxVegAutorized = 11;
farming_vegetableconf.props["Candleberries"].minTemp = 5;
farming_vegetableconf.props["Candleberries"].bestTemp = 20;
farming_vegetableconf.props["Candleberries"].maxTemp = 35;
farming_vegetableconf.props["Candleberries"].plantWithFruit = false;
farming_vegetableconf.props["Candleberries"].damageFromStorm = false;
farming_vegetableconf.props["Candleberries"].multiHarvest = true;
farming_vegetableconf.props["Candleberries"].vegetableName2 = "";
farming_vegetableconf.props["Candleberries"].numberOfVegetables2 = 0;


-- Lemontree 
farming_vegetableconf.props["Lemontree"] = {};
farming_vegetableconf.props["Lemontree"].seedsRequired = 1;
farming_vegetableconf.props["Lemontree"].texture = "hcFarmingLemontree06_0";
farming_vegetableconf.props["Lemontree"].waterLvl = 45;
farming_vegetableconf.props["Lemontree"].waterLvlMax = 100;
farming_vegetableconf.props["Lemontree"].timeToGrow = ZombRand(150, 170);
farming_vegetableconf.props["Lemontree"].vegetableName = "Base.Lemon";
farming_vegetableconf.props["Lemontree"].seedName = "Hydrocraft.HCPottedlemontree";
farming_vegetableconf.props["Lemontree"].gatherSeed = "Hydrocraft.HCLemonseeds";
farming_vegetableconf.props["Lemontree"].seedPerVeg = 0;
farming_vegetableconf.props["Lemontree"].seedCollect = 10;
farming_vegetableconf.props["Lemontree"].minVeg = 5;
farming_vegetableconf.props["Lemontree"].maxVeg = 10;
farming_vegetableconf.props["Lemontree"].minVegAutorized = 9;
farming_vegetableconf.props["Lemontree"].maxVegAutorized = 11;
farming_vegetableconf.props["Lemontree"].minTemp = 5;
farming_vegetableconf.props["Lemontree"].bestTemp = 20;
farming_vegetableconf.props["Lemontree"].maxTemp = 35;
farming_vegetableconf.props["Lemontree"].plantWithFruit = false;
farming_vegetableconf.props["Lemontree"].damageFromStorm = false;
farming_vegetableconf.props["Lemontree"].multiHarvest = true;
farming_vegetableconf.props["Lemontree"].vegetableName2 = "";
farming_vegetableconf.props["Lemontree"].numberOfVegetables2 = 0;




farming_vegetableconf.sprite = {}
farming_vegetableconf.sprite["Carrots"] = {
"vegetation_farming_01_32",
"vegetation_farming_01_33",
"vegetation_farming_01_34",
"vegetation_farming_01_35",
"vegetation_farming_01_36",
"vegetation_farming_01_37",
"vegetation_farming_01_38",
"vegetation_farming_01_39"
}
farming_vegetableconf.sprite["Broccoli"] = {
"vegetation_farming_01_24",
"vegetation_farming_01_25",
"vegetation_farming_01_26",
"vegetation_farming_01_27",
"vegetation_farming_01_28",
"vegetation_farming_01_30",
"vegetation_farming_01_29",
"vegetation_farming_01_31"
}
farming_vegetableconf.sprite["Radishes"] = {
"vegetation_farming_01_48",
"vegetation_farming_01_49",
"vegetation_farming_01_50",
"vegetation_farming_01_51",
"vegetation_farming_01_52",
"vegetation_farming_01_54",
"vegetation_farming_01_53",
"vegetation_farming_01_55"
}
farming_vegetableconf.sprite["Strawberry plant"] = {
"vegetation_farming_01_56",
"vegetation_farming_01_57",
"vegetation_farming_01_58",
"vegetation_farming_01_59",
"vegetation_farming_01_60",
"vegetation_farming_01_61",
"vegetation_farming_01_62",
"vegetation_farming_01_63"
}
farming_vegetableconf.sprite["Tomato"] = {
"vegetation_farming_01_64",
"vegetation_farming_01_65",
"vegetation_farming_01_66",
"vegetation_farming_01_67",
"vegetation_farming_01_68",
"vegetation_farming_01_69",
"vegetation_farming_01_70",
"vegetation_farming_01_71"
}
farming_vegetableconf.sprite["Potatoes"] = {
"vegetation_farming_01_40",
"vegetation_farming_01_41",
"vegetation_farming_01_42",
"vegetation_farming_01_43",
"vegetation_farming_01_44",
"vegetation_farming_01_46",
"vegetation_farming_01_45",
"vegetation_farming_01_47"
}
farming_vegetableconf.sprite["Cabbages"] = {
"vegetation_farming_01_16",
"vegetation_farming_01_17",
"vegetation_farming_01_18",
"vegetation_farming_01_19",
"vegetation_farming_01_20",
"vegetation_farming_01_22",
"vegetation_farming_01_21",
"vegetation_farming_01_23"
}

farming_vegetableconf.sprite["Onion"] = {
	"hcFarmingOnion00_0",
	"hcFarmingOnion01_0",
	"hcFarmingOnion02_0",
	"hcFarmingOnion03_0",
	"hcFarmingOnion04_0",
	"hcFarmingOnion05_0",
	"hcFarmingOnion06_0",
	"hcFarmingOnion07_0" 
}
farming_vegetableconf.sprite["Corn"] = {
	"vegetation_farming_01_72",
	"vegetation_farming_01_73",
	"vegetation_farming_01_74",
	"vegetation_farming_01_75",
	"vegetation_farming_01_76",
	"vegetation_farming_01_77",
	"vegetation_farming_01_78",
	"vegetation_farming_01_79"
}
farming_vegetableconf.sprite["Wheat"] = {
	"hcFarmingWheat00_0",
	"hcFarmingWheat01_0",
	"hcFarmingWheat02_0",
	"hcFarmingWheat03_0",
	"hcFarmingWheat04_0",
	"hcFarmingWheat05_0",
	"hcFarmingWheat06_0",
	"hcFarmingWheat07_0"
}

farming_vegetableconf.sprite["Hemp"] = {
	"hcFarmingHemp00_0",
	"hcFarmingHemp01_0",
	"hcFarmingHemp02_0",
	"hcFarmingHemp03_0",
	"hcFarmingHemp04_0",
	"hcFarmingHemp05_0",
	"hcFarmingHemp06_0",
	"hcFarmingHemp07_0"
}
farming_vegetableconf.sprite["Grapes"] = {
	"hcFarmingGrapes00_0",
	"hcFarmingGrapes01_0",
	"hcFarmingGrapes02_0",
	"hcFarmingGrapes03_0",
	"hcFarmingGrapes04_0",
	"hcFarmingGrapes05_0",
	"hcFarmingGrapes06_0",
	"hcFarmingGrapes07_0"
}
farming_vegetableconf.sprite["Lettuce"] = {
	"hcFarmingLettuce00_0",
	"hcFarmingLettuce01_0",
	"hcFarmingLettuce02_0",
	"hcFarmingLettuce03_0",
	"hcFarmingLettuce04_0",
	"hcFarmingLettuce05_0",
	"hcFarmingLettuce06_0",
	"hcFarmingLettuce07_0"
}	
farming_vegetableconf.sprite["Peanut"] = {
	"hcFarmingPeanut00_0",
	"hcFarmingPeanut01_0",
	"hcFarmingPeanut02_0",
	"hcFarmingPeanut03_0",
	"hcFarmingPeanut04_0",
	"hcFarmingPeanut05_0",
	"hcFarmingPeanut06_0",
	"hcFarmingPeanut07_0"
}	
farming_vegetableconf.sprite["Flax"] = {
	"hcFarmingFlax00_0",
	"hcFarmingFlax01_0",
	"hcFarmingFlax02_0",
	"hcFarmingFlax03_0",
	"hcFarmingFlax04_0",
	"hcFarmingFlax05_0",
	"hcFarmingFlax06_0",
	"hcFarmingFlax07_0" 
}	


farming_vegetableconf.sprite["CoffeeBeans"] = {
	"hcFarmingCoffebean00_0",
	"hcFarmingCoffebean01_0",
	"hcFarmingCoffebean02_0",
	"hcFarmingCoffebean03_0",
	"hcFarmingCoffebean04_0",
	"hcFarmingCoffebean05_0",
	"hcFarmingCoffebean06_0",
	"hcFarmingCoffebean07_0"
}	

farming_vegetableconf.sprite["Sunflower"] = {
	"hcFarmingSunflower00_0",
	"hcFarmingSunflower01_0",
	"hcFarmingSunflower02_0",
	"hcFarmingSunflower03_0",
	"hcFarmingSunflower04_0",
	"hcFarmingSunflower05_0",
	"hcFarmingSunflower06_0",
	"hcFarmingSunflower07_0"
}	

farming_vegetableconf.sprite["SoyBeans"] = {
	"hcFarmingSoyBeans00_0",
	"hcFarmingSoyBeans01_0",
	"hcFarmingSoyBeans02_0",
	"hcFarmingSoyBeans03_0",
	"hcFarmingSoyBeans04_0",
	"hcFarmingSoyBeans05_0",
	"hcFarmingSoyBeans06_0",
	"hcFarmingSoyBeans07_0"
}

farming_vegetableconf.sprite["Mulberries"] = {
	"hcFarmingMulberries00_0",
	"hcFarmingMulberries01_0",
	"hcFarmingMulberries02_0",
	"hcFarmingMulberries03_0",
	"hcFarmingMulberries04_0",
	"hcFarmingMulberries05_0",
	"hcFarmingMulberries06_0",
	"hcFarmingMulberries07_0"
}


farming_vegetableconf.sprite["Candleberries"] = {
	"hcFarmingcandleberrytree00_0",
	"hcFarmingcandleberrytree01_0",
	"hcFarmingcandleberrytree02_0",
	"hcFarmingcandleberrytree03_0",
	"hcFarmingcandleberrytree04_0",
	"hcFarmingcandleberrytree05_0",
	"hcFarmingcandleberrytree06_0",
	"hcFarmingcandleberrytree07_0"
}


farming_vegetableconf.sprite["Lemontree"] = {
	"hcFarmingLemontree00_0",
	"hcFarmingLemontree01_0",
	"hcFarmingLemontree02_0",
	"hcFarmingLemontree03_0",
	"hcFarmingLemontree04_0",
	"hcFarmingLemontree05_0",
	"hcFarmingLemontree06_0",
	"hcFarmingLemontree07_0"
}





farming_vegetableconf.HCgrowAllPlants = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end