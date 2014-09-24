HSZSPlayerInfo.DB = {}

local db = HSZSPlayerInfo.DB

function db.Query(s)
    sql.Begin()
        sql.Query(s)
    sql.Commit()
    return sql.LastError()
end

function db.TableExists(s)
    local exists
    sql.Begin()
        exists = sql.TableExists(s)
    sql.Commit()
    return exists
end

db.Exists = db.TableExists

function db.Init()
    if !db.Exists("HSZSPlayerInfo") then // 테이블이 존재치 않는다면
        print("TABLE CREATED FOR HSZS PLAYERINFO: " ..
            db.Query(
                "CREATE TABLE HSZSPlayerInfo(uid INTEGER PRIMARY KEY ASC NOT NULL, nick TEXT NOT NULL, level INTEGER NOT NULL DEFAULT 0, exp INTEGER NOT NULL DEFAULT 0)"
                // uid, 닉네임, 레벨, 경험치
            )
        )
    end
    
    if !db.Exists("HSZSPlayerAchievementsInfo") then
        print("TABLE CREATED FOR HSZS ACHIEVEMENTS INFO: " .. 
            db.Query(
                "CREATE TABLE HSZSPlayerAchievementsInfo(" ..
                    "uid INTEGER, " ..
                    "serverConnected INTEGER DEFAULT 0, " .. // 서버 접속 횟수
                    "playtime INTEGER DEFAULT 0, " .. // 플레이타임
                    "worthCount INTEGER DEFAULT 0, " .. // 워쓰샵 구매 횟수
                    "pointCount INTEGER DEFAULT 0, " .. // 포인트샵 구매 횟수
                    "pointSpent INTEGER DEFAULT 0, " .. // 포인트 사용량
                    "killZombie INTEGER DEFAULT 0, " .. // 좀비 킬 횟수
                    "killHuman INTEGER DEFAULT 0, " .. // 인간 킬 횟수
                    "damageZombie INTEGER DEFAULT 0, " .. // 좀비에게 준 데미지
                    "damageHuman INTEGER DEFAULT 0, " .. // 인간에게 준 데미지
                    "killBoss INTEGER DEFAULT 0, " .. // 보스좀비를 죽인 횟수
                    "damageBarricade INTEGER DEFAULT 0, " .. // 바리케이드에 가한 데미지
                    "repairBarricade INTEGER DEFAULT 0, " .. // 바리케이드를 수리한 양
                    "putArsenalCrate INTEGER DEFAULT 0, " .. // 상점상자를 설치한 횟수
                    "putResupplyBox INTEGER DEFAULT 0, " .. // 보급상자를 설치한 횟수
                    "putTurret INTEGER DEFAULT 0, " .. // 터렛을 설치한 횟수
                    "killWithTurret INTEGER DEFAULT 0, " .. // 터렛으로 처치한 횟수
                    "humanHealAllied INTEGER DEFAULT 0, " .. // 인간이 아군을 회복시킨 양
                    "humanHealSelf INTEGER DEFAULT 0, " .. // 인간이 스스로 회복한 양
                    "zombieHealAllied INTEGER DEFAULT 0, " .. // 본매쉬가 아군을 회복시킨 양
                    "zombieHealSelf INTEGER DEFAULT 0, " .. // 본매쉬가 스스로 회복한 양
                    "hitHuman INTEGER DEFAULT 0, " .. // 인간을 공격한 횟수
                    "suicided INTEGER DEFAULT 0, " .. // 자살한 횟수
                    "killedByHuman INTEGER DEFAULT 0, " .. // 인간에게 죽은 횟수
                    "killedByZombie INTEGER DEFAULT 0, " .. // 좀비에게 죽은 횟수
                    "usedGrenade INTEGER DEFAULT 0, " .. // 수류탄을 사용한 횟수
                    "usedC4 INTEGER DEFAULT 0, " .. // C4를 사용한 횟수
                    "waveEnded INTEGER DEFAULT 0, " .. // 웨이브를 끝마친 횟수
                    "roundEnded INTEGER DEFAULT 0, " .. // 라운드를 끝마친 횟수
                    "FOREIGN KEY(uid) REFERENCES HSZSPlayerInfo(uid)" ..
                ")"
            )
        )
    end
end

db.Init()