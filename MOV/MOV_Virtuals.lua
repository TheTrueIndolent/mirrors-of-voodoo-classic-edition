-- Colors --
movMainColor = CreateColorFromHexString("FFB0C4DE")
movHighColor = CreateColorFromHexString("FF9370D8")
movNoMainColor = CreateColorFromHexString("00B0C4DE")
movNoHighColor = CreateColorFromHexString("009370D8")
-- function for showing the menu --
function movShowMenu()
	if not movOptions00:IsShown() then
		movOptions00:Show()
	else
		movOptions00:Hide()
	end
end
-- Slash Command --
SLASH_MIRRORSOFVOODOO1, SLASH_MIRRORSOFVOODOO2 = '/mov', '/mirrorsofvoodoo'
function SlashCmdList.MIRRORSOFVOODOO(msg, editBox)
	movShowMenu()
end
-- functions for the buttons and popouts --
-- on enter --
function movEnteringMenus(self)
	GameTooltip_ClearStatusBars(GameTooltip)
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("RIGHT", self, "LEFT", 0, 0)
end
-- on leave --
function movLeavingMenus()
	GameTooltip:Hide()
end
-- click on Pop Out --
function movClickPopOut(var1, var2)
	var1:SetScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not var2:IsShown() then
				var2:Show()
				PlaySound(855, "Master")
			else
				var2:Hide()
			end
		end
	end)
end
