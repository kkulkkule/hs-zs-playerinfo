local PANEL = {}

local ScrW = ScrW
local ScrH = ScrH

function PANEL:Init()
    self:SetAlpha(0)
    self:SetBackgroundColor(Color(38, 38, 38, 255))
    self:SetWide(240)
    self:SetTall(98)
    self:SetPos(ScrW() - 240, 0)
    self:FadeIn(2)
    self:MakePopup()
    self:SetKeyboardInputEnabled(false)
    self:SetMouseInputEnabled(false)
    self:MakeBody()
    self:MakeFooter()
    -- self.BaseClass.Init(self)
end

function PANEL:MakeTitle(title)
    local p = vgui.Create("DPanel", self)
    p:SetPos(0, 0)
    p:SetWide(self:GetWide())
    p:SetTall(16)
    function p:Paint()
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
    end
    
    local l = vgui.Create("DLabel", p)
    l:SetPos(2, 2)
    l:SetWide(self:GetWide() - 4)
    l:SetTall(12)
    l:SetFont("Nanum")
    l:SetTextColor(Color(255, 255, 0, 255))
    l:SetText(title)
    l:SetContentAlignment(5)
end

function PANEL:MakeBody()
    local p = vgui.Create("DPanel", self)
    p:SetPos(0, 17)
    p:SetWide(self:GetWide())
    p:SetTall(self:GetTall() - 2 - 32)
    
    local l = vgui.Create("DLabel", p)
    l:SetPos(2, 2)
    l:SetWide(p:GetWide() - 4)
    l:SetTall(p:GetTall() - 4)
    l:Center()
    l:SetFont("NanumSmall")
    l:SetWrap(true)
    local settext = l.SetText
    l.SetText = function(self, text)
        settext(self, text)
        self:SetContentAlignment(8)
    end
    self.Body = l
    
    p:SetContentAlignment(5)
end

function PANEL:SetBody(body)
    self.Body:SetText(body)
end

function PANEL:MakeFooter()
    local p = vgui.Create("DPanel", self)
    p:SetPos(0, self:GetTall() - 16)
    p:SetWide(self:GetWide())
    p:SetTall(16)
    function p:Paint()
        surface.SetDrawColor(Color(0, 0, 0, 255))
        surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
    end
    
    local l = vgui.Create("DLabel", p)
    l:SetPos(2, 2)
    l:SetWide(self:GetWide() - 4)
    l:SetTall(12)
    l:SetFont("Nanum")
    l:SetTextColor(Color(255, 255, 0, 255))
    l:SetText("Achievement Unlocked")
    l:SetContentAlignment(5)
end

function PANEL:Paint()
    surface.SetDrawColor(self:GetBackgroundColor())
    surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
end

function PANEL:FadeIn(t, f)
    if !t then
        t = 1
    end
    self:AlphaTo(255, t, 0, f)
end

function PANEL:FadeOut(t, f)
    if !t then
        t = 1
    end
    self:AlphaTo(0, t, 0, f)
end

vgui.Register("HSZSAchievementPanel", PANEL, "DPanel")