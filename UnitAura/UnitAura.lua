--1.判断单位的buff/debuff
--if UnitAura("player"|"target", "光环名称") then xxx end

--2.判断玩家buff
--if MyBuff("buff名称") then xxx end

--3.判断玩家debuff
--if MyDebuff("debuff名称") then xxx end

--4.判断目标buff
--if TarBuff("buff名称") then xxx end

--5.判断目标debuff
--if TarDebuff("debuff名称") then xxx end
local _G = _G
local GetInventorySlotInfo = GetInventorySlotInfo

function UnitAura(unit, aura)
	auratooltip:SetOwner(UIParent, "ANCHOR_NONE")

	if (not unit) then
		unit = "player"
	end
	if (not aura) then
		return
	end

	if string.lower(unit) == "mainhand" then
		auratooltip:ClearLines()
		auratooltip:SetInventoryItem("player",GetInventorySlotInfo("MainHandSlot"))
		for i = 1, auratooltip:NumLines() do
			if string.find((_G["auratooltipTextLeft"..i]:GetText() or ""), aura) then
				return true
			end
		end
		return false
	end

	if string.lower(unit) == "offhand" then
		auratooltip:ClearLines()
		auratooltip:SetInventoryItem("player", GetInventorySlotInfo("SecondaryHandSlot"))
		for i=1, auratooltip:NumLines() do
			if string.find((_G["auratooltipTextLeft"..i]:GetText() or ""), aura) then
				return true
			end
		end
		return false
	end

	local i = 1
	while UnitBuff(unit, i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitBuff(unit, i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end

	local i = 1
	while UnitDebuff(unit, i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitDebuff(unit, i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end
end

function MyBuff(aura)
	auratooltip:SetOwner(UIParent, "ANCHOR_NONE")
	if (not aura) then
		return
	end

	if string.lower("player") == "mainhand" then
		auratooltip:ClearLines()
		auratooltip:SetInventoryItem("player",GetInventorySlotInfo("MainHandSlot"))
		for i = 1, auratooltip:NumLines() do
			if string.find((_G["auratooltipTextLeft"..i]:GetText() or ""), aura) then
				return true
			end
		end
		return false
	end

	if string.lower("player") == "offhand" then
		auratooltip:ClearLines()
		auratooltip:SetInventoryItem("player", GetInventorySlotInfo("SecondaryHandSlot"))
		for i=1, auratooltip:NumLines() do
			if string.find((_G["auratooltipTextLeft"..i]:GetText() or ""), aura) then
				return true
			end
		end
		return false
	end

	local i = 1
	while UnitBuff("player", i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitBuff("player", i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end
end

function MyDebuff(aura)
	auratooltip:SetOwner(UIParent, "ANCHOR_NONE")
	if (not aura) then
		return
	end

	local i = 1
	while UnitDebuff("player", i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitDebuff("player", i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end	
end

function TarBuff(aura)
	auratooltip:SetOwner(UIParent, "ANCHOR_NONE")
	if (not aura) then
		return
	end

	local i = 1
	while UnitBuff("target", i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitBuff("target", i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end
end

function TarDebuff(aura)
	auratooltip:SetOwner(UIParent, "ANCHOR_NONE")
	if (not aura) then
		return
	end

	local i = 1
	while UnitDebuff("target", i) do 
		auratooltip:ClearLines()
		auratooltip:SetUnitDebuff("target", i)
    if string.find(auratooltipTextLeft1:GetText(), aura) then
		return true, i
    end
    i = i + 1
	end	
end