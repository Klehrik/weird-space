/// Background : Draw

depth = 9000;

// Draw stars
for (var i = 0; i < ds_list_size(global.Stars); i++)
{
	// Loop star
	if (global.Stars[| i][0] < camera_get_view_x(view_camera[0])) global.Stars[| i][0] += CAM_W;
	if (global.Stars[| i][0] > camera_get_view_x(view_camera[0]) + CAM_W) global.Stars[| i][0] -= CAM_W;
	if (global.Stars[| i][1] < camera_get_view_y(view_camera[0])) global.Stars[| i][1] += CAM_H;
	if (global.Stars[| i][1] > camera_get_view_y(view_camera[0]) + CAM_H) global.Stars[| i][1] -= CAM_H;
	
	// Draw star
	var s = global.Stars[| i];
	draw_point_colour(s[0], s[1], s[2]);
}

// Draw particles
for (var i = 0; i < ds_list_size(global.Particles); i++)
{
	var p = global.Particles[| i];
	p.Step();
	p.Draw();
}

// Enemy Lock-on
with (par_Enemy)
{
	if (Lock.Time >= Lock.FlashTime)
	{
		var vx = obj_Player.MoveVec.x;
		var vy = obj_Player.MoveVec.y;
		var wep_spd = Lock.Speed;	// Lock-on weapon speed
		var spd = sqrt( sqr(wep_spd) + (0.05 * wep_spd * point_distance(x, y, obj_Player.x, obj_Player.y)) );	// projectile speed

		var a = sqr(vx) + sqr(vy) - sqr(spd);
		var b = 2 * ( vx * (obj_Player.x - x) + vy * (obj_Player.y - y) );
		var c = sqr(obj_Player.x - x) + sqr(obj_Player.y - y);

		var t = solve_quadratic(a, b, c);
		if (t >= 0)
		{
			var dir = point_direction(x, y, obj_Player.x + vx * t, obj_Player.y + vy * t);
			var c = Lock.Col;
			draw_line_colour(x, y, x + dcos(dir) * Lock.Range, y - dsin(dir) * Lock.Range, c, c);
		}
	}
	else if (Lock.Time >= 0 and Lock.Time < Lock.FlashTime)
	{
		var c = Lock.Col;
		if (floor(global.Tick / 4) mod 2 == 0) c = $e8f1ff;
		draw_line_colour(x, y, x + dcos(image_angle) * Lock.Range, y - dsin(image_angle) * Lock.Range, c, c);
	}
}