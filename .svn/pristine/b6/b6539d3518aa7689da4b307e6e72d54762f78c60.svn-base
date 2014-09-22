if (GM and GM.Name ~= "Zombie Survival") or (GAMEMODE and GAMEMODE.Name ~= "Zombie Survival") then
  return
end

if SERVER then
  resource.AddFile("sound/zombiesurvival/sfx/hitsound/hitsound.wav")
  util.AddNetworkString("hitsound")
  
  hook.Add("EntityTakeDamage", "HitSoundHonsal", function(pl, dmginfo)
    if IsValid(pl) and pl:IsPlayer() then
      if pl:Team() == TEAM_ZOMBIE then
        local attacker = dmginfo:GetAttacker()
        if IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
          local maxdmg = nil
          local infl = dmginfo:GetInflictor()
          local wep = infl == attacker and attacker:GetActiveWeapon() or infl
          if IsValid(wep) and wep.Primary and wep.Primary.Damage then
            maxdmg = weapons.GetStored(wep:GetClass()).Primary.Damage * 2
          end
          net.Start("hitsound")
            net.WriteFloat(dmginfo:GetDamage() / (maxdmg or 1))
          net.Send(attacker)
        end
      end
    end
  end)
end

if CLIENT then
  net.Receive("hitsound", function(len)
    local ratio = net.ReadFloat()
    local vol = math.Clamp(100 * ratio, 0, 511)
    LocalPlayer():EmitSound("zombiesurvival/sfx/hitsound/hitsound.wav", vol, 100 * math.Rand(0.5, 1.2))
  end)
end