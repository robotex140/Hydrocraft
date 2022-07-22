

local scriptItem = nil

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

scriptItem = ScriptManager.instance:getItem("Base.Shotgun") --JS-2000 Shotgun
if scriptItem then
	scriptItem:DoParam("DisplayCategory = WepFire")
	scriptItem:DoParam("ModelWeaponPart = HCShotgunSilencer gunlight,")
	scriptItem:DoParam("Tags = HuntingShotgun")
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

scriptItem = ScriptManager.instance:getItem("Base.VarmintRifle") --MSR700 Rifle
if scriptItem then
	scriptItem:DoParam("Tags = Rifle_223")
end

scriptItem = ScriptManager.instance:getItem("Base.HuntingRifle") --MSR788 Rifle
if scriptItem then
	scriptItem:DoParam("Tags = Rifle_308")
end

scriptItem = ScriptManager.instance:getItem("Base.DoubleBarrelShotgun") --Double Barrel Shotgun
if scriptItem then
	scriptItem:DoParam("Tags = HuntingShotgun")
end

scriptItem = ScriptManager.instance:getItem("Base.AssaultRifle") --M16 Assault Rifle
if scriptItem then
	scriptItem:DoParam("Tags = Rifle_556")
end

scriptItem = ScriptManager.instance:getItem("Base.AssaultRifle2") --M14 Single Shot Assault Rifle
if scriptItem then
	scriptItem:DoParam("Tags = Rifle_308")
end



