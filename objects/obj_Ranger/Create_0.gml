/// Ranger : Init

Size = sprite_width / 2;

MoveVec = new vec2(0, 0);
Speed = 0.4;

RandMove = 0;
RandTimer = 0;

Hull = 1;
Shield = 6;
MaxShield = 6;
ShieldRegen = {
    Delay: 420,
    MaxDelay: 420,
    Time: 120,
    MaxTime: 120
}

Weps = [
	{ ID: 1, Cooldown: irandom_range(60, 90) }
];
Lock = {
	Time: -1,
	FlashTime: 30,
	Spread: 0,
	Damage: 0,
	Speed: 0,
	Range: 0,
	Col: $4d00ff
}