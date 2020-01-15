-- Generated from template
-- require('playerinit')

if WormWar == nil then
	WormWar = class({})
end

temp_flag=0

function Precache( context )
	print("BEGIN TO PRECACHE RESOURCE")

end


function Activate()
	GameRules.AddonTemplate = WormWar()
	GameRules.AddonTemplate:InitGameMode()
	GameRules:SetCustomGameSetupAutoLaunchDelay( 10 )
	GameRules:SetPreGameTime(10)
end

function WormWar:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(WormWar,"OnGameRulesStateChange"), self)
	ListenToGameEvent("npc_spawned", Dynamic_Wrap(WormWar, "OnNPCSpawned"), self)
end

-- Evaluate the state of the game
function WormWar:OnThink()
    --玩家初始化
	return 1
end


function WormWar:OnGameRulesStateChange( keys )
        print("OnGameRulesStateChange")

        --获取游戏进度
        local newState = GameRules:State_Get()

        --游戏开始
        if newState==DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                createunit()
        end
end


function createunit()
    a = {"dragon_knight","dragon_knight","dragon_knight","none","omniknight","none","sniper","sniper","sniper"}
	p = {"pos1","pos2","pos3","pos4","pos5","pos6","pos7","pos8","pos9",}
	
	m = {"kulou","kulouking","kulou","pugna","drow_ranger","pugna","clinkz","clinkz","clinkz"}
	n = {"pos101","pos102","pos103","pos104","pos105","pos106","pos107","pos108","pos109"}

	good = {"pos_good1","pos_good2","pos_good3","pos_good1","pos_good2","pos_good3","pos_good1","pos_good2","pos_good3"}
	bad = {"pos_bad1","pos_bad2","pos_bad3","pos_bad1","pos_bad2","pos_bad3","pos_bad1","pos_bad2","pos_bad3"}

	for i=1,9,1 do
		print(i)
		local location_good = Entities:FindByName(nil, p[i])
		local location_bad = Entities:FindByName(nil, n[i])
		print(i)
		local position_good = location_good:GetOrigin()
		local position_bad = location_bad:GetOrigin()
		print(i)
		local goodguy = CreateUnitByName(a[i],position_good, true, nil, nil, DOTA_TEAM_GOODGUYS)
		goodguy:SetMustReachEachGoalEntity(true)
		goodguy:SetInitialGoalEntity(Entities:FindByName(nil,good[i]))
		local badguy = CreateUnitByName(m[i],position_bad, true, nil, nil, DOTA_TEAM_BADGUYS)	
		badguy:SetMustReachEachGoalEntity(true)
		badguy:SetInitialGoalEntity(Entities:FindByName(nil,bad[i]))
		temp_flag = temp_flag + 1
	end
	

end



function WormWar:OnNPCSpawned( keys )
  local spawnedUnit = EntIndexToHScript( keys.entindex )
  if spawnedUnit:IsHero() then
    local level = spawnedUnit:GetLevel()
	spawnedUnit:HeroLevelUp(true)
    spawnedUnit:HeroLevelUp(true)
	spawnedUnit:HeroLevelUp(true)
	spawnedUnit:HeroLevelUp(true)
	spawnedUnit:HeroLevelUp(true)
  end
end

	