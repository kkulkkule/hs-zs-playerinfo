include("shared.lua")
include("panels/gotAchievements.lua")

local function CreateFont(name, font, size, weight)
    if !weight then
        weight = 500
    end
    surface.CreateFont(name, {
        font = name,
        size = size,
        weight = weight
    })
end

function HSZSPlayerInfo.CreateFonts()
    CreateFont("Nanum", "나눔고딕", 16, 800)
    CreateFont("NanumSmall", "나눔고딕", 15, 500)
end

function HSZSPlayerInfo.Init()
    HSZSPlayerInfo.CreateFonts()
end

hook.Add("Initialize", "HSZSPlayerInfo.Init", HSZSPlayerInfo.Init)