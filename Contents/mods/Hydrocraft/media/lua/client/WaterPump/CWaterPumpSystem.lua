--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "Map/CGlobalObjectSystem"

CWaterPumpSystem = CGlobalObjectSystem:derive("CWaterPumpSystem")

function CWaterPumpSystem:new()
	local o = CGlobalObjectSystem.new(self, "waterpump")
	return o
end

function CWaterPumpSystem:isValidIsoObject(isoObject)
	return instanceof(isoObject, "IsoThumpable") and isoObject:getName() == "Water Pump"
end

function CWaterPumpSystem:newLuaObject(globalObject)
	return CWaterPumpGlobalObject:new(self, globalObject)
end

CGlobalObjectSystem.RegisterSystemClass(CWaterPumpSystem)

local function DoSpecialTooltip(tooltipUI, square)
	local playerObj = getSpecificPlayer(0)
	if not playerObj or playerObj:getZ() ~= square:getZ() or
			playerObj:DistToSquared(square:getX() + 0.5, square:getY() + 0.5) > 2 * 2 then
		return
	end
	
	local pump = CWaterPumpSystem.instance:getIsoObjectOnSquare(square)
	if not pump or not pump:getModData()["waterMax"] then return end

	local smallFontHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
	tooltipUI:setHeight(6 + smallFontHgt + 6 + smallFontHgt + 12)

	local textX = 12
	local textY = 6 + smallFontHgt + 6

	local barX = textX + getTextManager():MeasureStringX(UIFont.Small, getText("IGUI_invpanel_Remaining")) + 12
	local barWid = 80
	local barHgt = 4
	local barY = textY + (smallFontHgt - barHgt) / 2 + 2

	tooltipUI:setWidth(barX + barWid + 12)
	tooltipUI:DrawTextureScaledColor(nil, 0, 0, tooltipUI:getWidth(), tooltipUI:getHeight(), 0, 0, 0, 0.75)
	tooltipUI:DrawTextCentre(getText("ContextMenu_Water_Pump"), tooltipUI:getWidth() / 2, 6, 1, 1, 1, 1)
	tooltipUI:DrawText(getText("IGUI_invpanel_Remaining") .. ":", textX, textY, 1, 1, 1, 1)

	local f = pump:getWaterAmount() / pump:getModData()["waterMax"]
	local fg = { r=0.0, g=0.6, b=0.0, a=0.7 }
	if f < 0.0 then f = 0.0 end
	if f > 1.0 then f = 1.0 end
	local done = math.floor(barWid * f)
	if f > 0 then done = math.max(done, 1) end
	tooltipUI:DrawTextureScaledColor(nil, barX, barY, done, barHgt, fg.r, fg.g, fg.b, fg.a)
	local bg = {r=0.15, g=0.15, b=0.15, a=1.0}
	tooltipUI:DrawTextureScaledColor(nil, barX + done, barY, barWid - done, barHgt, bg.r, bg.g, bg.b, bg.a)
end
