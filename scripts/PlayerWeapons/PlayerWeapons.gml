/// Player sdWeapons

function init_player_weapons()	// Initialize player weapon table
{
	global.Weps = [
		{ Name: "Basic Laser", Damage: 1, Speed: [1.5, 1.5], Range: 140, Count: 1, Spread: 0, Recoil: 0.8, Cooldown: 30 },
		{ Name: "Railgun", Damage: 3, Speed: [4, 4], Range: 180, Count: 1, Spread: 0, Recoil: 1.2, Cooldown: 100 },
		{ Name: "Burst", Damage: 1, Speed: [0.7, 1.5], Range: 100, Count: 8, Spread: 30, Recoil: 4, Cooldown: 120 }
	];
}

function player_weapon_shoot(x, y, ID)	// Shoot player weapon
{
	var p = instance_create_depth(x, y, 0, obj_BasicProj);
	p.Team = 1;
	p.Dir = image_angle + random_range(-global.Weps[ID].Spread / 2, global.Weps[ID].Spread / 2);
	p.Damage = global.Weps[ID].Damage;
	p.Speed = random_range(global.Weps[ID].Speed[0], global.Weps[ID].Speed[1]);
	p.Range = global.Weps[ID].Range;
	p.Col = $ffad29;
}