/// Enforcer : Step

// Get weapon closest to firing
var w = 0;
var wc = 999;
for (var i = 0; i < array_length(Weps); i++)
{
	if (Weps[i].Cooldown < wc)
	{
		w = i;
		wc = Weps[i].Cooldown;
	}
}

// Calculate direction to face
if (Lock.Time <= -1 or Lock.Time >= Lock.FlashTime)
{
	var vx = obj_Player.MoveVec.x;
	var vy = obj_Player.MoveVec.y;
	var wep_spd = global.EWeps[Weps[w].ID].Speed[0];
	if (Lock.Time = Lock.FlashTime) wep_spd = Lock.Speed;	// Lock-on weapon speed
	var spd = sqrt( sqr(wep_spd) + (0.05 * wep_spd * point_distance(x, y, obj_Player.x, obj_Player.y)) );	// projectile speed

	var a = sqr(vx) + sqr(vy) - sqr(spd);
	var b = 2 * ( vx * (obj_Player.x - x) + vy * (obj_Player.y - y) );
	var c = sqr(obj_Player.x - x) + sqr(obj_Player.y - y);

	var t = solve_quadratic(a, b, c);
	if (t >= 0) image_angle = point_direction(x, y, obj_Player.x + vx * t, obj_Player.y + vy * t);
}



// Movement
var dist = point_distance(x, y, obj_Player.x, obj_Player.y);

if (dist < 40) RandMove = image_angle - 180;	// Move away from player
else if (dist > 80) RandMove = image_angle;		// Move towards player
else											// Random move
{
	if (RandTimer > 0) RandTimer -= 1;
	else
	{
		RandMove += random_range(-90, 90);
		RandTimer = irandom_range(60, 90);
	}
}

var vec = new vec2(0.1, 0);
vec.setDir(RandMove);
MoveVec.add(vec);