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
end

function WormWar:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameRules:SetPreGameTime( 15.0)
end

-- Evaluate the state of the game
function WormWar:OnThink()
    --玩家初始化
	
	if temp_flag == 0 then
		createunit()
		temp_flag = temp_flag + 1
	end	
	
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end

	
	return 1
end


function createunit()
    a = {"dragon_knight","dragon_knight","dragon_knight","omniknight","omniknight","omniknight","sniper","sniper","sniper"}
	p = {"pos1","pos2","pos3","pos4","pos5","pos6","pos7","pos8","pos9",}
	
	m = {"kulou","npc_dota_hero_skeleton_king","kulou","npc_dota_hero_clinkz","npc_dota_hero_clinkz","npc_dota_hero_clinkz","npc_dota_hero_pugna","npc_dota_hero_pugna","npc_dota_hero_pugna"}
	n = {"pos101","pos102","pos103","pos104","pos105","pos106","pos107","pos108","pos109"}

	for i=1,9,1 do
		print(i)
		local location_good = Entities:FindByName(nil, p[i])
		local location_bad = Entities:FindByName(nil, n[i])
		print(i)
		local position_good = location_good:GetOrigin()
		local position_bad = location_bad:GetOrigin()
		print(i)
		CreateUnitByName(a[i],position_good, true, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName(m[i],position_bad, true, nil, nil, DOTA_TEAM_BADGUYS)		
		temp_flag = temp_flag + 1
	end
	
	CreateUnitByName("npc_dota_hero_drow_ranger",Entities:FindByName(nil, "pos110"):GetOrigin(), true, nil, nil, DOTA_TEAM_BADGUYS)
	
end