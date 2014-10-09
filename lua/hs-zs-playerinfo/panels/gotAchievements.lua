local PANEL = {}

local ScrW = ScrW
local ScrH = ScrH

function PANEL:Init()
    self:SetWide(ScrW() * 0.8)
    self:SetTall(self:GetWide() / 8)
    self:SetBGColor(80, 80, 80, 200)
    self:SetPos(ScrW() / 2 - self:GetWide() / 2, ScrH() / 2 - self:GetTall() / 2)
    -- self.BaseClass.Init(self)
end
vgui.Register("HSZSAchievementPanel", PANEL, "DPanel")