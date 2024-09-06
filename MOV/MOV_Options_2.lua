-- taking care of the panel --
movOptions2:ClearAllPoints()
movOptions2:SetPoint("TOPLEFT", movOptions00, "TOPLEFT", 0, 0)
movOptions2.BGtexture:SetAlpha(1)
movOptions2.TopTxt:SetText("Create, load, and delete profiles!")
movOptions2.CenterTxt:Hide()
movOptions2.BottomTxt:Hide()
movOptions2.BottomLeftTxt:Hide()
-- taking of the box --
movOptions2Box1.TitleTxt:SetText("Create a profile!")
-- takeing care the rest boxes --
for i = 2, 3, 1 do
	_G["movOptions2Box"..i]:SetPoint("TOP", _G["movOptions2Box"..i-1], "BOTTOM", 0, 0)
end
movOptions2Box2.TitleTxt:SetText("Load a profile!")
movOptions2Box3.TitleTxt:SetText("Delete a profile!")
movOptions2Box3.CenterTxt:SetText(movHighColor:WrapTextInColorCode("Note: ").."When you "..movHighColor:WrapTextInColorCode("SAVE")..", "..movHighColor:WrapTextInColorCode("LOAD")..", or "..movHighColor:WrapTextInColorCode("DELETE").." a Profile, the UI will be RELOADED!")
-- some variables --
local NameExist = false
-- finding keys --
local function FindingKeys()
	local Keys = 0
	for k, v in pairs(MOVprofile) do
		Keys = Keys + 1
	end
	MOVnumber = Keys
end
-- coping the tables --
local function CopyTable(k)
	MOVplayer = MOVprofile[k]["player"]
end
-- deleting keys --
local function DeletingKeys(self)
	for k, v in pairs(MOVprofile) do
		if k == self:GetText() then
		MOVprofile[k] = nil
		end
	end
end
-- functions for loading the profiles --
local function LoadingProfiles()
	if MOVcounterLoading == 0 and MOVnumber > 0 then
		for k, v in pairs(MOVprofile) do
			MOVcounterLoading = MOVcounterLoading + 1
			local button = CreateFrame("Button" , "movOptions2Box2PopOut1Choice"..MOVcounterLoading, movOptions2Box2PopOut1Choice0, "movPopOutButton")
			_G["movOptions2Box2PopOut1Choice"..MOVcounterLoading]:SetPoint("TOP","movOptions2Box2PopOut1Choice"..MOVcounterLoading - 1, "BOTTOM", 0, 0)
			_G["movOptions2Box2PopOut1Choice"..MOVcounterLoading].Text:SetText(k)
			_G["movOptions2Box2PopOut1Choice"..MOVcounterLoading]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					CopyTable(k)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- functions for deleting the profiles --
local function DeletingProfiles()
	if MOVcounterDeleting == 0 and MOVnumber > 0 then
		for k, v in pairs(MOVprofile) do
			MOVcounterDeleting = MOVcounterDeleting + 1
			local button = CreateFrame("Button" , "movOptions2Box3PopOut1Choice"..MOVcounterDeleting, movOptions2Box3PopOut1Choice0, "movPopOutButton")
			_G["movOptions2Box3PopOut1Choice"..MOVcounterDeleting]:SetPoint("TOP","movOptions2Box3PopOut1Choice"..MOVcounterDeleting - 1, "BOTTOM", 0, 0)
			_G["movOptions2Box3PopOut1Choice"..MOVcounterDeleting].Text:SetText(k)
			_G["movOptions2Box3PopOut1Choice"..MOVcounterDeleting]:SetScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					DeletingKeys(self)
					C_UI.Reload()
				end
			end)
		end
	end
end
-- taking care of the edit box create a profile --
-- width and height --
local fontFile, height, flags = movOptions2Box1EditBox1.WritingLine:GetFont()
movOptions2Box1EditBox1.WritingLine:SetHeight(height)
movOptions2Box1EditBox1:SetWidth(movOptions2Box1:GetWidth()*0.65)
movOptions2Box1EditBox1:SetHeight(movOptions2Box1EditBox1.WritingLine:GetHeight()*1.75)
movOptions2Box1EditBox1.WritingLine:SetWidth(movOptions2Box1EditBox1:GetWidth()*0.95)
-- entering, leaving --
movOptions2Box1EditBox1.WritingLine:HookScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."|nWrite a name for your profile in the Edit Box and|npress enter to save your settings/options!") 
end)
movOptions2Box1EditBox1.WritingLine:HookScript("OnLeave", movLeavingMenus)
-- pressing enter --
movOptions2Box1EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		local name = self:GetText()
		for k, v in pairs(MOVprofile) do
			if k == name then
				NameExist = true
			else
				NameExist = false
			end
			if NameExist then
				local movTime = GameTime_GetTime(false)
				DEFAULT_CHAT_FRAME:AddMessage(movTime.." ["..movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."] This Profile already exist please try another name!")
				return
			end
		end
		MOVnumber = MOVnumber + 1
		MOVprofile[name] = {player = MOVplayer, }
		C_UI.Reload()
	else
		local movTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(movTime.." ["..movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."] Please enter a name for your profile!")
	end
end)
-- Box 1, Load a profile --
-- Popout 1, Load --
movOptions2Box2PopOut1:SetWidth(movOptions2Box2:GetWidth()*0.65)
-- enter --
movOptions2Box2PopOut1:SetScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."|nSelect one of the profiles to be "..movHighColor:WrapTextInColorCode("LOADED!")) 
end)
-- leave --
movOptions2Box2PopOut1:SetScript("OnLeave", movLeavingMenus)
-- drop down --
movClickPopOut(movOptions2Box2PopOut1, movOptions2Box2PopOut1Choice0)
-- click --
movOptions2Box2PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local movTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(movTime.." ["..movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."] I did nothing, I literally do nothing as button!")
		movOptions2Box2PopOut1Choice0:Hide()
	end
end)
-- naming --
movOptions2Box2PopOut1Choice0.Text:SetText("Nothing")
-- Box 2, Delete a profile --
-- Popout 1, Delete --
movOptions2Box3PopOut1:SetWidth(movOptions2Box3:GetWidth()*0.65)
-- enter --
movOptions2Box3PopOut1:SetScript("OnEnter", function(self)
	movEnteringMenus(self)
	GameTooltip:SetText(movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."|nSelect one of the profiles to be "..movHighColor:WrapTextInColorCode("DELETED!")) 
end)
-- leave --
movOptions2Box3PopOut1:SetScript("OnLeave", movLeavingMenus)
-- drop down --
movClickPopOut(movOptions2Box3PopOut1, movOptions2Box3PopOut1Choice0)
-- click --
movOptions2Box3PopOut1Choice0:SetScript("OnClick", function(self, button, down)
	if button == "LeftButton" and down == false then
		local movTime = GameTime_GetTime(false)
		DEFAULT_CHAT_FRAME:AddMessage(movTime.." ["..movMainColor:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("MOV", "Title")).."] I did nothing, I literally do nothing as button!")
		movOptions2Box3PopOut1Choice0:Hide()
	end
end)
-- naming --
movOptions2Box3PopOut1Choice0.Text:SetText("Nothing")
-- Showing the panel --
movOptions2:HookScript("OnShow", function(self)
	FindingKeys()
	LoadingProfiles()
	DeletingProfiles()
	movOptions2Box2PopOut1.Text:SetText("Click me")
	movOptions2Box3PopOut1.Text:SetText("Click me")
	if movOptions1:IsShown() then movOptions1:Hide() end
	movOptions00Tab1.Text:SetTextColor(movMainColor:GetRGB())
	movOptions00Tab2.Text:SetTextColor(movHighColor:GetRGB())
end)