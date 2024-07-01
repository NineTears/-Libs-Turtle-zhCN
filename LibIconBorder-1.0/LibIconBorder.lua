--来自modui的图标边框
local sections  = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT", "TOP", "BOTTOM", "LEFT", "RIGHT"}

LibIconBorder = function(self, offset)
    if type(self) ~= "table" or not self.CreateTexture or self.borderTextures then return end

	local t = {}
	offset = offset or 0

	for i = 1, 8 do
		local section = sections[i]
		local x = self:CreateTexture(nil, "OVERLAY", nil, 1)
		x:SetTexture("Interface\\AddOns\\!Libs\\LibIconBorder-1.0\\texture\\border-"..section..".tga")
		t[sections[i]] = x
	end

	t.TOPLEFT:SetWidth(8)
	t.TOPLEFT:SetHeight(8)
	t.TOPLEFT:SetPoint("BOTTOMRIGHT", self, "TOPLEFT", 4 + offset, -4 - offset)

	t.TOPRIGHT:SetWidth(8)
	t.TOPRIGHT:SetHeight(8)
	t.TOPRIGHT:SetPoint("BOTTOMLEFT", self, "TOPRIGHT", -4 - offset, -4 - offset)

	t.BOTTOMLEFT:SetWidth(8)
	t.BOTTOMLEFT:SetHeight(8)
	t.BOTTOMLEFT:SetPoint("TOPRIGHT", self, "BOTTOMLEFT", 4 + offset, 4 + offset)

	t.BOTTOMRIGHT:SetWidth(8)
	t.BOTTOMRIGHT:SetHeight(8)
	t.BOTTOMRIGHT:SetPoint("TOPLEFT", self, "BOTTOMRIGHT", -4 - offset, 4 + offset)

	t.TOP:SetHeight(8)
	t.TOP:SetPoint("TOPLEFT", t.TOPLEFT, "TOPRIGHT", 0, 0)
	t.TOP:SetPoint("TOPRIGHT", t.TOPRIGHT, "TOPLEFT", 0, 0)

	t.BOTTOM:SetHeight(8)
	t.BOTTOM:SetPoint("BOTTOMLEFT", t.BOTTOMLEFT, "BOTTOMRIGHT", 0, 0)
	t.BOTTOM:SetPoint("BOTTOMRIGHT", t.BOTTOMRIGHT, "BOTTOMLEFT", 0, 0)

	t.LEFT:SetWidth(8)
	t.LEFT:SetPoint("TOPLEFT", t.TOPLEFT, "BOTTOMLEFT", 0, 0)
	t.LEFT:SetPoint("BOTTOMLEFT", t.BOTTOMLEFT, "TOPLEFT", 0, 0)

	t.RIGHT:SetWidth(8)
	t.RIGHT:SetPoint("TOPRIGHT", t.TOPRIGHT, "BOTTOMRIGHT", 0, 0)
	t.RIGHT:SetPoint("BOTTOMRIGHT", t.BOTTOMRIGHT, "TOPRIGHT", 0, 0)

	self.borderTextures = t
end