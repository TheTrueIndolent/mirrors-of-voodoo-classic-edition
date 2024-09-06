-- First time saved variable function --
local function FirstTimeSavedVariables()
	if MOVcounterLoading == nil or MOVcounterLoading ~= nil then MOVcounterLoading = 0 end
	if MOVcounterDeleting == nil or MOVcounterDeleting ~= nil then MOVcounterDeleting = 0 end
	if MOVprofile == nil then MOVprofile = {} end
	if MOVnumber == nil then MOVnumber = 0 end
	if MOVplayer == nil then
		MOVplayer = {NameText = {Position = "Top Left"},
			TimeText = {Position = "Top Right"},
		}
	end
end
-- Time Text for MirrorTimer1 --
MOVtimeText1 = MirrorTimer1:CreateFontString(nil, "OVERLAY", nil)
MOVtimeText1:SetFontObject("GameFontHighlight")
MOVtimeText1:SetHeight(MirrorTimer1Text:GetHeight())
-- Name Text for MirrorTimer1 --
MOVnameText1 = MirrorTimer1:CreateFontString(nil, "OVERLAY", nil)
MOVnameText1:SetFontObject("GameFontHighlight")
MOVnameText1:SetHeight(MirrorTimer1Text:GetHeight())
-- Time Text for MirrorTimer2 --
MOVtimeText2 = MirrorTimer2:CreateFontString(nil, "OVERLAY", nil)
MOVtimeText2:SetFontObject("GameFontHighlight")
MOVtimeText2:SetHeight(MirrorTimer2Text:GetHeight())
-- Name Text for MirrorTimer2 --
MOVnameText2 = MirrorTimer2:CreateFontString(nil, "OVERLAY", nil)
MOVnameText2:SetFontObject("GameFontHighlight")
MOVnameText2:SetHeight(MirrorTimer2Text:GetHeight())
-- Time Text for MirrorTimer3 --
MOVtimeText3 = MirrorTimer3:CreateFontString(nil, "OVERLAY", nil)
MOVtimeText3:SetFontObject("GameFontHighlight")
MOVtimeText3:SetHeight(MirrorTimer3Text:GetHeight())
-- Name Text for MirrorTimer3 --
MOVnameText3 = MirrorTimer3:CreateFontString(nil, "OVERLAY", nil)
MOVnameText3:SetFontObject("GameFontHighlight")
MOVnameText3:SetHeight(MirrorTimer3Text:GetHeight())
-- Function for Time --
local function CalculateShowTime(var1, txt)
	local seconds = mod (var1, 60)
	local minutes = mod (floor (floor(var1) / 60), 60)
	if minutes == 0 then
		txt:SetFormattedText("%.2f", seconds)
	else
		txt:SetFormattedText(minutes.. ":".. "%.0f", seconds)
	end
end
-- Postion function for the timers --
local function Positioning(self , var1, var2)
	if MOVplayer[var1]["Position"] == "Top Left" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 7, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Left" then
		var2:ClearAllPoints()
		var2:SetPoint("LEFT", self, "LEFT", 7, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Bottom Left" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 7, 0)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Top" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOM", self, "TOP", 0, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Center" then
		var2:ClearAllPoints()
		var2:SetPoint("CENTER", self, "CENTER", 0, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Bottom" then
		var2:ClearAllPoints()
		var2:SetPoint("TOP", self, "BOTTOM", 0, 0)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Top Right" then
		var2:ClearAllPoints()
		var2:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -7, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Right" then
		var2:ClearAllPoints()
		var2:SetPoint("RIGHT", self, "RIGHT", -7, 6)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Bottom Right" then
		var2:ClearAllPoints()
		var2:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", -7, 0)
		if not var2:IsShown() then var2:Show() end
	elseif MOVplayer[var1]["Position"] == "Hide" then
		var2:Hide()
	end
end
-- Hooking Time part 1 --
MirrorTimer1:HookScript("OnShow", function(self)
	MirrorTimer1Text:SetAlpha(0)
	Positioning(self , "NameText", MOVnameText1)
	MOVnameText1:SetText(MirrorTimer1Text:GetText())
	Positioning(self , "TimeText", MOVtimeText1)
end)
MirrorTimer2:HookScript("OnShow", function(self)
	MirrorTimer2Text:SetAlpha(0)
	Positioning(self , "NameText", MOVnameText2)
	MOVnameText2:SetText(MirrorTimer2Text:GetText())
	Positioning(self , "TimeText", MOVtimeText2)
end)
MirrorTimer3:HookScript("OnShow", function(self)
	MirrorTimer3Text:SetAlpha(0)
	Positioning(self , "NameText", MOVnameText3)
	MOVnameText2:SetText(MirrorTimer3Text:GetText())
	Positioning(self , "TimeText", MOVtimeText3)
end)
-- Hooking Time part 2 --
MirrorTimer1:HookScript("OnUpdate", function(self)
	CalculateShowTime(self.value, MOVtimeText1)
end)
MirrorTimer2:HookScript("OnUpdate", function(self)
	CalculateShowTime(self.value, MOVtimeText2)
end)
MirrorTimer3:HookScript("OnUpdate", function(self)
	CalculateShowTime(self.value, MOVtimeText3)
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3)
	if event == "PLAYER_LOGIN" then
		FirstTimeSavedVariables()
		MirrorTimer2:AdjustPointsOffset(0, -16)
		MirrorTimer3:AdjustPointsOffset(0, -16)
	end
end
movZlave:SetScript("OnEvent", EventsTime)
