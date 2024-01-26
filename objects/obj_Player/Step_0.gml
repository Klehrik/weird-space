/// Player : Step

// Hull check
if (Hull <= 0) room_restart();

// Shield regen
if (Shield < MaxShield)
{
	// Delay in shield regen after taking damage
	if (ShieldRegen.Delay < ShieldRegen.MaxDelay) ShieldRegen.Delay += 1;
	else
	{
		// Shield regen timer
		if (ShieldRegen.Time < ShieldRegen.MaxTime) ShieldRegen.Time += 1;
		else
		{
			ShieldRegen.Time = 0;
			Shield += 1;
		}
	}
}



var acc = 0.1;
var diag = 0.07071;

image_angle = point_direction(x, y, mouse_x, mouse_y);	// set image angle

// Movement
if (keyd(global.Keys.Left) and keyd(global.Keys.Up)) MoveVec.add(new vec2(-diag, -diag));
else if (keyd(global.Keys.Right) and keyd(global.Keys.Up)) MoveVec.add(new vec2(diag, -diag));
else if (keyd(global.Keys.Left) and keyd(global.Keys.Down)) MoveVec.add(new vec2(-diag, diag));
else if (keyd(global.Keys.Right) and keyd(global.Keys.Down)) MoveVec.add(new vec2(diag, diag));
else if (keyd(global.Keys.Left)) MoveVec.add(new vec2(-acc, 0));
else if (keyd(global.Keys.Right)) MoveVec.add(new vec2(acc, 0));
else if (keyd(global.Keys.Up)) MoveVec.add(new vec2(0, -acc));
else if (keyd(global.Keys.Down)) MoveVec.add(new vec2(0, acc));

// Decelerate
var vec = new vec2(acc / 4, 0);
if (MoveVec.getMag() > Speed) vec.x += (MoveVec.getMag() - Speed) / 6;	// extend dec vec if over max speed limit
vec.setDir(MoveVec.getDir() - 180);										// set direction of dec vec to opposite direction
MoveVec.add(vec);
if (MoveVec.getMag() < acc / 2) MoveVec.setMag(0);						// round move vec to 0 if near 0

// Update position
x += MoveVec.x;
y += MoveVec.y;



// Weapon 1
if (Wep1.Cooldown > 0) Wep1.Cooldown -= 1;
if (moused(mb_left) and Wep1.ID >= 0 and  Wep1.Cooldown <= 0)
{
	Wep1.Cooldown = global.Weps[Wep1.ID].Cooldown;
	for (var i = 0; i < global.Weps[Wep1.ID].Count; i++)
	{
		player_weapon_shoot(x + dcos(image_angle) * 4, y - 2 - dsin(image_angle) * 4, Wep1.ID);
	}
	var vec = new vec2(global.Weps[Wep1.ID].Recoil, 0);
	vec.setDir(image_angle - 180);
	MoveVec.add(vec);
}

// Weapon 2
if (Wep2.Cooldown > 0) Wep2.Cooldown -= 1;
if (moused(mb_right) and Wep2.ID >= 0 and Wep2.Cooldown <= 0)
{
	Wep2.Cooldown = global.Weps[Wep2.ID].Cooldown;
	for (var i = 0; i < global.Weps[Wep2.ID].Count; i++)
	{
		player_weapon_shoot(x + dcos(image_angle) * 4, y - 2 - dsin(image_angle) * 4, Wep2.ID);
	}
	var vec = new vec2(global.Weps[Wep2.ID].Recoil, 0);
	vec.setDir(image_angle - 180);
	MoveVec.add(vec);
}

// Warp
if (Warp.Cooldown > 0) Warp.Cooldown -= 1;
if (keyp(global.Keys.Warp) and Warp.Cooldown <= 0)
{
	Warp.Cooldown = Warp.MaxCooldown;
	
	var _x = x;
	var _y = y;
	x = mouse_x;
	y = mouse_y;
	MoveVec.setMag(0);	// set movement vec to 0 after warping
	
	// Create warp particles
	while (point_distance(_x, _y, mouse_x, mouse_y) > 2)
	{
		_x += dcos(image_angle) * 2;
		_y -= dsin(image_angle) * 2;
		
		create_particle(_x + dcos(image_angle - 180), _y - 2 - dsin(image_angle - 180),
		2, { Dir: image_angle - 180 });
	}
}



// CamPos
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
if (x >= cam_x + 6 and x <= cam_x + CAM_W - 6
and y >= cam_y + 6 and y <= cam_y + CAM_H - 6)
{
	CamPos.x = x;
	CamPos.y = y;
}