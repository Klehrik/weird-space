/// Proj Circle : Draw

depth = 100;

if (Target != noone)
{
	Size += 1/3;
	Speed *= 1.01;
	move_towards_point(Target.x, Target.y, Speed);
	
	if (point_distance(x, y, Target.x, Target.y) <= Speed * 3 and Size >= 20)
	{
		enemy_weapon_shoot(x, y, 4);
		instance_destroy();
	}
}

draw_circle_colour(x, y, Size, Col, Col, 1);