/// Projectile Spawn : Step

// Range check
if (point_distance(x, y, ox, oy) > Range) instance_destroy();

// Move
Speed *= 1.01;
motion_set(Dir, Speed);

// Create particles
create_particle(x, y, 3, { Dir: image_angle - 180, Col: Col });

// Spawn projectiles
//SpawnDir = 0;
//SpawnDirSpeed = 0;
//SpawnSpeed = 1000;
//SpawnAngle = 90;

SpawnDir += SpawnDirSpeed;

if (global.Tick mod SpawnSpeed == 0)
{
	for (var i = 0; i < 360; i += SpawnAngle)
	{
		var p = instance_create_depth(x, y, 0, obj_BasicProj);
		p.image_index = 1;
		p.Team = 2;
		p.Dir = SpawnDir - i;
		p.Damage = Damage / 2;
		p.Speed = Speed;
		p.Range = Range / 2;
		p.Col = $4d00ff;
	}
}