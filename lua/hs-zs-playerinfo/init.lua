include("shared.lua")
include("db.lua")

AddCSLuaFile("cl_init.lua")

function HSZSPlayerInfo.Init()
    HSZSPlayerInfo.DB.Init()
end
hook.Add("Initialize", "HSZSPlayerInfo.Init", HSZSPlayerInfo.Init)