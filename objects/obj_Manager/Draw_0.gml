/// Manager : Draw

// Enemy indicators
with (par_Enemy)
{
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	
	// Check if outside view
	if (x < cam_x - Size or x > cam_x + CAM_W + Size
	or y < cam_y - Size or y > cam_y + CAM_H + Size)
	{
		var _x = x;
		var _y = y;
		var dir = point_direction(x, y, obj_Player.CamPos.x, obj_Player.CamPos.y);
			
		// Loop pointer from current location
		while (_x < cam_x + 6 or _x > cam_x + CAM_W - 6
		or _y < cam_y + 6 or _y > cam_y + CAM_H - 6)
		{
			_x += dcos(dir);
			_y -= dsin(dir);

			if (point_distance(_x, _y, obj_Player.CamPos.x, obj_Player.CamPos.y) < 2) break;
		}
			
		// Draw indicator
		var s = 3;	// size
		var c = $4d00ff;
		draw_triangle_colour(_x + dcos(dir - 180) * s, _y - dsin(dir - 180) * s,
		_x + dcos(dir - 75) * s, _y - dsin(dir - 75) * s,
		_x + dcos(dir + 75) * s, _y - dsin(dir + 75) * s,
		c, c, c, 0);
	}
}

// Draw cursor
var dir = point_direction(obj_Player.x, obj_Player.y, mouse_x, mouse_y);
var dist = point_distance(obj_Player.x, obj_Player.y, mouse_x, mouse_y) * 0.8;
draw_sprite(spr_Cursor, 1, obj_Player.x + dcos(dir) * dist, obj_Player.y - dsin(dir) * dist);
draw_sprite(spr_Cursor, 0, mouse_x, mouse_y);

// debug
draw_text(camera_get_view_x(view_camera[0]) + 2, camera_get_view_y(view_camera[0]) + 2, fps);
draw_text(camera_get_view_x(view_camera[0]) + 2, camera_get_view_y(view_camera[0]) + 9, instance_count);

if (keyp(ord("H"))) hitboxes *= -1;
if (hitboxes >= 1)
{
	with (all)
	{
		draw_set_alpha(0.5);
		var c = c_red;
		draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c, c, c, c, 0);
		draw_set_alpha(1);
	}
}