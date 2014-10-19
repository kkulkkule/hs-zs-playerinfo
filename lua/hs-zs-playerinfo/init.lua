include("shared.lua")
include("db.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("panels/gotAchievements.lua")

function HSZSPlayerInfo.Init()
    HSZSPlayerInfo.AddResources()
    HSZSPlayerInfo.DB.Init()
end

function HSZSPlayerInfo.AddResources()
    resource.AddFile("resource/fonts/NanumGothic.ttf")
    resource.AddFile("resource/fonts/NanumGothicBold.ttf")
    resource.AddFile("resource/fonts/NanumGothicExtraBold.ttf")
end
hook.Add("Initialize", "HSZSPlayerInfo.Init", HSZSPlayerInfo.Init)