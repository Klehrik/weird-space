/// Player : Init

MoveVec = new vec2(0, 0);
Speed = 0.7;

Hull = 1;
Shield = 10;
MaxShield = 10;
ShieldRegen = {
	Delay: 420,
	MaxDelay: 420,
	Time: 120,
	MaxTime: 120
}

Wep1 = { ID: 1, Cooldown: 0 }
Wep2 = { ID: 2, Cooldown: 0 }
Warp = {
	Cooldown: 0,
	MaxCooldown: 120
}

CamPos = {	// last saved position within the camera
	x: x,
	y: y
}