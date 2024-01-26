/// Enemy Weapons

function init_enemy_weapons()	// Initialize enemy weapon table
{
	global.EWeps = [
		{ Name: "0-gunner_basic", Type: 1, Damage: 1, Speed: [0.5, 0.5], Range: 180, Count: 1, Spread: 30, Recoil: 0.8, Cooldown: 60 },
		{ Name: "1-railgun", Type: 3, Damage: 2, Speed: [4], Range: 180, Count: 1, Spread: 15, Recoil: 1.2, Cooldown: 210 },
		{ Name: "2-shotgun", Type: 2, Damage: 1, Speed: [0.5, 0], Range: 120, Count: 3, Count2: 1, Spread: [-30, 30], Recoil: 4, Cooldown: 120 },
		{ Name: "3-proj_circle", Type: 11, Speed: [0.5], Range: 180, Recoil: 0, Cooldown: 240 },
		{ Name: "4-proj_circle_proj", Type: 12, Damage: 1, Speed: 0.25 },
		{ Name: "5-shotgun2", Type: 2, Damage: 1, Speed: [0.5, 0.1], Range: 120, Count: 3, Count2: 3, Spread: [-20, 20], Recoil: 4, Cooldown: 120 },
		{ Name: "6-shotgun3", Type: 2, Damage: 1, Speed: [0.5, 0.1], Range: 150, Count: 5, Count2: 5, Spread: [-40, 20], Recoil: 4, Cooldown: 150 },
		{ Name: "7-spawn", Type: 4, Damage: 2, Speed: [0.25], Range: 180, Spin: 1, FireRate: 20, Angles: 180, Spread: 15, Recoil: 3, Cooldown: 180 },
		{ Name: "8-spawn2", Type: 4, Damage: 2, Speed: [0.25], Range: 180, Spin: 1, FireRate: 20, Angles: 90, Spread: 15, Recoil: 3, Cooldown: 240 },
		{ Name: "9-ring", Type: 2, Damage: 1, Speed: [0.25, 0], Range: 180, Count: 30, Count2: 1, Spread: [0, 12], Recoil: 4, Cooldown: 240 },
	];
}

function enemy_weapon_shoot(x, y, ID)	// Shoot enemy weapon
{
	switch (global.EWeps[ID].Type)
	{
		case 1:	// Standard
			for (var i = 0; i < global.EWeps[ID].Count; i++)
			{
				var p = instance_create_depth(x, y, 0, obj_BasicProj);
				p.image_index = 1;
				p.Team = 2;
				p.Dir = image_angle + random_range(-global.EWeps[ID].Spread / 2, global.EWeps[ID].Spread / 2);
				p.Damage = global.EWeps[ID].Damage;
				p.Speed = random_range(global.EWeps[ID].Speed[0], global.EWeps[ID].Speed[1]);
				p.Range = global.EWeps[ID].Range;
				p.Col = $4d00ff;
			}
			break;
			
		case 2:	// Even spread
		
			// creates even spread patterns count2 number of times
			// count is used to increment dir for a spread pattern for even spread
			// count2 is used to increment speed through each spread pattern
			for (var j = 0; j < global.EWeps[ID].Count2; j++)
			{
				for (var i = 0; i < global.EWeps[ID].Count; i++)
				{
					var p = instance_create_depth(x, y, 0, obj_BasicProj);
					p.image_index = 1;
					p.Team = 2;
					p.Dir = image_angle + global.EWeps[ID].Spread[0] + (global.EWeps[ID].Spread[1] * i);
					p.Damage = global.EWeps[ID].Damage;
					p.Speed = global.EWeps[ID].Speed[0] + (global.EWeps[ID].Speed[1] * j);
					p.Range = global.EWeps[ID].Range;
					p.Col = $4d00ff;
				}
			}
			break;
			
		case 3: // Lock onto target
			Lock.Time = 90;
			Lock.Spread = global.EWeps[ID].Spread;
			Lock.Damage = global.EWeps[ID].Damage;
			Lock.Speed = global.EWeps[ID].Speed[0];
			Lock.Range = global.EWeps[ID].Range;
			Lock.Col = $4d00ff;
			break;
			
		case 4: // Basic spawner
			var p = instance_create_depth(x, y, 0, obj_ProjSpawn);
			p.image_index = 1;
			p.Team = 2;
			p.Dir = image_angle + random_range(-global.EWeps[ID].Spread / 2, global.EWeps[ID].Spread / 2);
			p.Damage = global.EWeps[ID].Damage;
			p.Speed = global.EWeps[ID].Speed[0];
			p.Range = global.EWeps[ID].Range;
			p.Col = $4d00ff;
			
			p.SpawnDirSpeed = global.EWeps[ID].Spin;	// spin speed
			p.SpawnSpeed = global.EWeps[ID].FireRate;	// spawn speed
			p.SpawnAngle = global.EWeps[ID].Angles;		// spawn angles (affects spawn count)
			break;
			
		case 11: // Proj circle
			var p = instance_create_depth(x, y, 0, obj_ProjCircle);
			p.Target = obj_Player;
			p.Speed = global.EWeps[ID].Speed[0];
			break;
			
		case 12: // Proj circle : projectiles
			for (var i = 0; i < 360; i += 18)
			{
				var _x = x + dcos(i) * Size;
				var _y = y - dsin(i) * Size;
				
				var p = instance_create_depth(_x, _y, 0, obj_BasicProj);
				p.image_index = 1;
				p.Team = 2;
				p.Dir = point_direction(_x, _y, x, y);
				p.Damage = global.EWeps[ID].Damage;
				p.Speed = global.EWeps[ID].Speed;
				p.Range = Size;
				p.Col = $4d00ff;
			}
			break;
	}
}