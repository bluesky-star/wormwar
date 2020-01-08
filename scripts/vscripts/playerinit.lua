

function createunit()
    a = {"niu","niu","huoren","yang","niu","huoren","yang","niu","huoren"}
	p = {"pos1","pos2","pos3"}

	for i=0,3,1 do
		local location_ent = Entities:FindByName(nil, p[i])
		local position = location_ent:GetOrigin()
		CreateUnitByName(a[i],position, true, nil, nil, DOTA_TEAM_NEUTRALS)	
	end
	
end



