

local scriptItem = ScriptManager.instance:getItem("Base.PillsBeta")
if scriptItem then
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCPillbox")
	--scriptItem:DoParam("DisplayCategory = Drugs")  --Vanilla: DisplayCategory = FirstAid, so don't change?
end


scriptItem = ScriptManager.instance:getItem("Base.IronSight")
if scriptItem then
	scriptItem:DoParam("MountOn = Hydrocraft.HCUzi; HuntingRifle; VarmintRifle; Pistol; Pistol2; Pistol3; Revolver; Revolver_Long; AssaultRifle; AssaultRifle2,")
end

scriptItem = ScriptManager.instance:getItem("Base.GunLight")
if scriptItem then
	scriptItem:DoParam("MountOn = Hydrocraft.HCUzi;Pistol; Pistol2; Pistol3,")
end

scriptItem = ScriptManager.instance:getItem("Base.RedDot")
if scriptItem then
	scriptItem:DoParam("MountOn = Hydrocraft.HCUzi;Pistol; Pistol2; Pistol3; Revolver; Revolver_Long; AssaultRifle; AssaultRifle2; HuntingRifle; VarmintRifle,")
end

scriptItem = ScriptManager.instance:getItem("Base.Shotgun")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = HCShotgunSilencer gunlight,")
end

scriptItem = ScriptManager.instance:getItem("Base.Revolver_Short")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.Revolver_Long")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.Revolver")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.Pistol3")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.Pistol2")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.Pistol")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = Hydrocraft.HCUziSilencer Hydrocraft.HCUziSilencer,")
end

scriptItem = ScriptManager.instance:getItem("Base.MetalPipe")
if scriptItem then
	--scriptItem:DoParam("DisplayName = Aluminum Pipe") --why are we declaring it to be aluminum?
	--scriptItem:DoParam("DisplayCategory = CraftMetal") --why? vanilla is Weapon
	scriptItem:DoParam("DisplayCategory = WepMelee") --original value is Weapon
end

scriptItem = ScriptManager.instance:getItem("Base.Pipe")
if scriptItem then
	--scriptItem:DoParam("DisplayName	= PVC Pipe") --why change it? + risk of breaking tranlations?
	--scriptItem:DoParam("Icon = HCPVCpipe") --ditto
	scriptItem:DoParam("DisplayCategory = CraftMisc")
end

scriptItem = ScriptManager.instance:getItem("Base.SheetMetal")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = CraftMetal")
	--scriptItem:DoParam("DisplayName = Aluminum Sheet") --why?
end

scriptItem = ScriptManager.instance:getItem("Base.SmallSheetMetal")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = CraftMetal")
	--scriptItem:DoParam("DisplayName = Small Aluminum Sheet") --why?
	--scriptItem:DoParam("Icon = HCMetalboard") --why?
end

scriptItem = ScriptManager.instance:getItem("Base.PaintWhite")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why?  Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintGrey")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintBlack")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintPurple")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintBlue")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintLightBlue")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintCyan")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintTurquoise")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintGreen")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintYellow")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintLightBrown")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintBrown")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintOrange")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintRed")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.PaintPink")
if scriptItem then
	--scriptItem:DoParam("UseDelta = 0.25")--why?
	--scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCPaintcan")--why? Vanilla: ReplaceOnDeplete = PaintbucketEmpty,
end

scriptItem = ScriptManager.instance:getItem("Base.Cigarettes")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = Drugs")
	--scriptItem:DoParam("RequireInHandOrInventory = Matches/Lighter") --maybe do this?
	scriptItem:DoParam("OnEat = HCOnEat_Cigarettes")--HC function, which calls vanilla function and then gives a butt if desired by sandbox
	scriptItem:DoParam("CustomEatSound = HC_LightUp")
end

scriptItem = ScriptManager.instance:getItem("Base.Scotchtape")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = Craft")
	scriptItem:DoParam("Type = Drainable")
	scriptItem:DoParam("UseDelta = 0.25")
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCScotchtapeempty")
end

scriptItem = ScriptManager.instance:getItem("Base.Woodglue")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = CraftCarp")
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCWoodglueempty")
end

scriptItem = ScriptManager.instance:getItem("Base.Glue")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = CraftCarp")
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCGlueempty")
end

scriptItem = ScriptManager.instance:getItem("Base.Battery")
if scriptItem then
	--scriptItem:DoParam("Weight = 0.6")--why? vanilla is 0.1
	--scriptItem:DoParam("Icon = HCBattery")--why?
	scriptItem:DoParam("DisplayCategory = CraftElec")
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCBatterydead")
end

scriptItem = ScriptManager.instance:getItem("Base.Lighter")
if scriptItem then
	--scriptItem:DoParam("UseWhileEquipped = FALSE")--why?  Vanilla is TRUE
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCLighterempty")
end

scriptItem = ScriptManager.instance:getItem("Base.PropaneTank")
if scriptItem then
	scriptItem:DoParam("KeepOnDeplete = TRUE")
	scriptItem:DoParam("DisplayCategory = Fuel")
end

scriptItem = ScriptManager.instance:getItem("Base.Fertilizer")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = SurFarm")
	scriptItem:DoParam("ReplaceOnDeplete = EmptySandbag")
end

scriptItem = ScriptManager.instance:getItem("Base.Coffee2")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodB")
	scriptItem:DoParam("ReplaceOnDeplete = EmptySandbag")
end

scriptItem = ScriptManager.instance:getItem("Base.Sugar")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = Cooking")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCSugarempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Rice")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = Cooking")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCRiceempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Flour")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = Cooking")
	--scriptItem:DoParam("UseDelta = 0.25") --why?
	scriptItem:DoParam("ReplaceOnDeplete = Hydrocraft.HCFlourempty")
end

scriptItem = ScriptManager.instance:getItem("Base.Yoghurt")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCYoghurtempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Tofu")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCJar") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Milk")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCMilkempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.IcecreamMelted")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCIcecreamempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Icecream")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCIcecreamempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.TVDinner")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCTVDinnerpackage")
end

scriptItem = ScriptManager.instance:getItem("Base.Ketchup")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodS")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCKetchupempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Mustard")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodS")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCMustardempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Vinegar")
if scriptItem then
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCVinegarempty") --should this be ReplaceOnDeplete?
end

scriptItem = ScriptManager.instance:getItem("Base.Pop3")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodB")
	--scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCPop3trash") --vanilla is ReplaceOnUse = Pop3Empty, so don't change?
end

scriptItem = ScriptManager.instance:getItem("Base.Pop2")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodB")
	--scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCPop2trash") --vanilla is ReplaceOnUse = Pop2Empty, so don't change?
end

scriptItem = ScriptManager.instance:getItem("Base.Pop")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodB")
	--scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCPoptrash") --vanilla is ReplaceOnUse = PopEmpty, so don't change?
end

scriptItem = ScriptManager.instance:getItem("Base.SunflowerSeeds")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
end

scriptItem = ScriptManager.instance:getItem("Base.Peanuts")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
end

scriptItem = ScriptManager.instance:getItem("Base.PeanutButter")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCJar")
end

scriptItem = ScriptManager.instance:getItem("Base.MintCandy")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCMintcandytrash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.Chocolate")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCChocolatetrash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.Salt")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodS")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCSaltshakerempty")
end

scriptItem = ScriptManager.instance:getItem("Base.Crisps4")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCrisps4trash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.Crisps3")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCrisps3trash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.Crisps2")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCrisps2trash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.Crisps")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodN")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCrispstrash") --can we get rid of these trash items?
end

scriptItem = ScriptManager.instance:getItem("Base.CannedBologneseOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedbologneseempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedChiliOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedchiliempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.DogfoodOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCDogfoodempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.TunaTinOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCTunatinempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.TinnedSoupOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCTinnedsoupempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.OpenBeans")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCBeansempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedTomatoOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedtomatoempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedSardinesOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedsardinesempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedPotatoOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedpotatoempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedPeasOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedpeasempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedMushroomSoupOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedmushroomsoupempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedCornOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedcornempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedCarrotsOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedcarrotsempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("Base.CannedCornedBeefOpen")
if scriptItem then
	scriptItem:DoParam("DisplayCategory = FoodP")
	scriptItem:DoParam("ReplaceOnUse = Hydrocraft.HCCannedcornedbeefempty") --Vanilla is: ReplaceOnUse = TinCanEmpty
end

scriptItem = ScriptManager.instance:getItem("farming.Potato")
if scriptItem then
	scriptItem:DoParam("Tags = Potato")
end

--SmithingMag1, SmithingMag2, SmithingMag3, SmithingMag4
--MetalworkMag1, MetalworkMag2, MetalworkMag3, MetalworkMag4

















