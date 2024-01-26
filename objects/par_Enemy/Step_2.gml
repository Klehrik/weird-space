/// Enemy : Common Step

// Hull check
if (Hull <= 0) instance_destroy();

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

// Decelerate
var vec = new vec2(acc / 4, 0);
if (MoveVec.getMag() > Speed) vec.x += (MoveVec.getMag() - Speed) / 6;	// extend dec vec if over max speed limit
vec.setDir(MoveVec.getDir() - 180);										// set direction of dec vec to opposite direction
MoveVec.add(vec);
if (MoveVec.getMag() < acc / 2) MoveVec.setMag(0);						// round move vec to 0 if near 0

// Update position
x += MoveVec.x;
y += MoveVec.y;



// Weapons
if (Lock.Time <= -1 or Lock.Time > Lock.FlashTime)
{
	for (var i = 0; i < array_length(Weps); i++)
	{
		if (Weps[i].Cooldown > 0) Weps[i].Cooldown -= 1;
		else if (Weps[i].ID >= 0 and point_distance(x, y, obj_Player.x, obj_Player.y) <= global.EWeps[Weps[i].ID].Range)
		{
			Weps[i].Cooldown = global.EWeps[Weps[i].ID].Cooldown;
			enemy_weapon_shoot(x + dcos(image_angle) * Size, y - (Size / 2) - dsin(image_angle) * Size, Weps[i].ID);
	
			var vec = new vec2(global.EWeps[Weps[i].ID].Recoil, 0);
			vec.setDir(image_angle - 180);
			MoveVec.add(vec);
		}
	}
}

// Lock-on (railgun, etc.)
if (Lock.Time > -1)
{
	Lock.Time -= 1;
	if (Lock.Time <= -1) // Fire weapon
	{
		var p = instance_create_depth(x, y, 0, obj_BasicProj);
		p.image_index = 1;
		p.Team = 2;
		p.Dir = image_angle + random_range(-Lock.Spread / 2, Lock.Spread / 2);
		p.Damage = Lock.Damage;
		p.Speed = Lock.Speed;
		p.Range = Lock.Range;
		p.Col = Lock.Col;
	}
}