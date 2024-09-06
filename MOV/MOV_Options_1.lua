-- taking care of the panel --
movOptions1:ClearAllPoints()
movOptions1:SetPoint("TOPLEFT", movOptions00, "TOPLEFT", 0, 0)
movOptions1.BGtexture:SetAlpha(1)
movOptions1.TopTxt:SetText("Mirror Bar's Options!")
movOptions1.CenterTxt:Hide()
movOptions1.BottomTxt:Hide()
movOptions1.BottomLeftTxt:Hide()
movOptions1Box1.TitleTxt:SetText("Name & Time of the Mirror")
-- Checking the Saved Variables --
local function CheckSavedVariables()
	movOptions1Box1PopOut1:SetText(MOVplayer["NameText"]["Position"])
	movOptions1Box1PopOut2:SetText(MOVplayer["TimeText"]["Position"])
end
-- function for the pop buttons --
local function ClickPopButton(var1, var2, self)
	MOVplayer[var1]["Position"] = self:GetText()
	var2:SetText(self:GetText())
	var2.Popout:Hide()
	PlaySound(858, "Master")
end
-- Box 1 Mirror's Name & Time --
-- pop out 1 Mirror's Name --
-- enter --
movOptions1Box1PopOut1:HookScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(C_AddOns.GetAddOnMetadata("MOV", "Title").."|nWhere do you want|nthe Mirror's Name to be shown?") 
end)
-- leave --
movOptions1Box1PopOut1:HookScript("OnLeave", movLeavingMenus)
-- drop down --
movClickPopOut(movOptions1Box1PopOut1, movOptions1Box1PopOut1Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["movOptions1Box1PopOut1Choice"..i]:SetParent(movOptions1Box1PopOut1Choice0)
	_G["movOptions1Box1PopOut1Choice"..i]:SetPoint("TOP", _G["movOptions1Box1PopOut1Choice"..k], "BOTTOM", 0, 0)
	_G["movOptions1Box1PopOut1Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			MOVplayer["NameText"]["Position"] = self.Text:GetText()
			movOptions1Box1PopOut1.Text:SetText(self:GetText())
			movOptions1Box1PopOut1Choice0:Hide()
		end
	end)
end
movOptions1Box1PopOut1Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		MOVplayer["NameText"]["Position"] = self.Text:GetText()
		movOptions1Box1PopOut1.Text:SetText(self:GetText())
		movOptions1Box1PopOut1Choice0:Hide()
	end
end)
-- naming --
movOptions1Box1PopOut1Choice0.Text:SetText("Top Left")
movOptions1Box1PopOut1Choice1.Text:SetText("Left")
movOptions1Box1PopOut1Choice2.Text:SetText("Bottom Left")
movOptions1Box1PopOut1Choice3.Text:SetText("Top")
movOptions1Box1PopOut1Choice4.Text:SetText("Center")
movOptions1Box1PopOut1Choice5.Text:SetText("Bottom")
movOptions1Box1PopOut1Choice6.Text:SetText("Top Right")
movOptions1Box1PopOut1Choice7.Text:SetText("Right")
movOptions1Box1PopOut1Choice8.Text:SetText("Bottom Right")
movOptions1Box1PopOut1Choice9.Text:SetText("Hide")
-- pop out 2 Mirror's Time --
-- enter --
movOptions1Box1PopOut2:HookScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(C_AddOns.GetAddOnMetadata("MOV", "Title").."|nWhere do you want|nthe Mirror's Time to be shown?")
end)
-- leave --
movOptions1Box1PopOut2:HookScript("OnLeave", movLeavingMenus)
-- drop down --
movClickPopOut(movOptions1Box1PopOut2, movOptions1Box1PopOut2Choice0)
-- sort & clicking --
for i = 1, 9, 1 do
	local k = i - 1
	_G["movOptions1Box1PopOut2Choice"..i]:SetParent(movOptions1Box1PopOut2Choice0)
	_G["movOptions1Box1PopOut2Choice"..i]:SetPoint("TOP", _G["movOptions1Box1PopOut2Choice"..k], "BOTTOM", 0, 0)
	_G["movOptions1Box1PopOut2Choice"..k]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			MOVplayer["TimeText"]["Position"] = self.Text:GetText()
			movOptions1Box1PopOut2.Text:SetText(self:GetText())
			movOptions1Box1PopOut2Choice0:Hide()
		end
	end)
end
movOptions1Box1PopOut2Choice9:HookScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		MOVplayer["TimeText"]["Position"] = self.Text:GetText()
		movOptions1Box1PopOut2.Text:SetText(self:GetText())
		movOptions1Box1PopOut2Choice0:Hide()
	end
end)
-- naming --
movOptions1Box1PopOut2Choice0.Text:SetText("Top Left")
movOptions1Box1PopOut2Choice1.Text:SetText("Left")
movOptions1Box1PopOut2Choice2.Text:SetText("Bottom Left")
movOptions1Box1PopOut2Choice3.Text:SetText("Top")
movOptions1Box1PopOut2Choice4.Text:SetText("Center")
movOptions1Box1PopOut2Choice5.Text:SetText("Bottom")
movOptions1Box1PopOut2Choice6.Text:SetText("Top Right")
movOptions1Box1PopOut2Choice7.Text:SetText("Right")
movOptions1Box1PopOut2Choice8.Text:SetText("Bottom Right")
movOptions1Box1PopOut2Choice9.Text:SetText("Hide")
-- Showing the panel --
movOptions1:SetScript("OnShow", function(self)
	CheckSavedVariables()
	if movOptions2:IsShown() then movOptions2:Hide() end
	movOptions00Tab1.Text:SetTextColor(movHighColor:GetRGB())
	movOptions00Tab2.Text:SetTextColor(movMainColor:GetRGB())
end)
