movOptions0.BGtexture:SetAlpha(0.70)
movOptions0.TopTxt:SetText("It would be good when you open the |cffFF0055Options' Panel|r to close the other ones so you can watch what changes you are making!")
movOptions0.CenterTxt:SetText(C_AddOns.GetAddOnMetadata("MOV", "Title").." is an add on that enchant the default Mirrors Bars meaning the 'Breath', 'Fatigue' etc bars!|n|nPress the button below to open the options pane!")
movOptions0.BottomTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
-- button 1 Options Panel --
movOptions0Button1.Text:SetText("Options Panel")
-- enter --
movOptions0Button1:SetScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."|nClick: "..movMainColor:WrapTextInColorCode("Open the main panel of settings").."!") 
end)
-- leave --
movOptions0Button1:SetScript("OnLeave", movLeavingMenus)
-- on click --
movOptions0Button1:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		movShowMenu()
	end
end)
-- Move the Tabs --
movOptions00:RegisterForDrag("LeftButton")
movOptions00:SetScript("OnDragStart", movOptions00.StartMoving)
movOptions00:SetScript("OnDragStop", movOptions00.StopMovingOrSizing)
-- taking care of the Tabs --
movOptions00Tab1.Text:SetText("Mirrors")
movOptions00Tab2.Text:SetText("Profiles")
movOptions00Tab2.CenterTxt:SetText("Thank you for using this amazing add-on!|nYou are a |cff00CED1Funky|r and a |cffFF0055Groovy|r person!|nMay the good |cff9400D3Mojo|r be with you!")
movOptions00.BGtexture:SetGradient("VERTICAL", movNoMainColor, movMainColor)
movOptions00.BGtexture:ClearAllPoints()
movOptions00.BGtexture:SetPoint("TOPRIGHT", movOptions00, "TOPRIGHT", 0, 0)
movOptions00.BGtexture:SetPoint("BOTTOMLEFT", movOptions00Tab2, "BOTTOMLEFT", 0, -128)
-- clicking on the tabs --
for i = 1, 2, 1 do
	_G["movOptions00Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["movOptions"..i]:IsShown() then _G["movOptions"..i]:Show() end
		end
	end)
end
-- showing the tabs --
movOptions00:SetScript("OnShow", function(self)
	if not movOptions1:IsShown() then movOptions1:Show() end
end)
-- hiding the tabs --
movOptions00:HookScript("OnHide", function(self)
	for i = 1, 2, 1 do
		if _G["movOptions"..i]:IsShown() then _G["movOptions"..i]:Hide() end
	end
end)
-- Events Time --
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		self:SetParent(InterfaceOptionsFrame)
		self.name = "Mirrors of |cff9370D8Voodoo|r!"
		InterfaceOptions_AddCategory(self)
	end
end
movOptions0:SetScript("OnEvent", EventsTime)
