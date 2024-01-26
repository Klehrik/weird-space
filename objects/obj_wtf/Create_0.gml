/// wtf : Init

Size = sprite_width / 2;

MoveVec = new vec2(0, 0);
Speed = 0.5;

RandMove = 0;
RandTimer = 0;

Hull = 20;
Shield = 30;
MaxShield = 30;
ShieldRegen = {
    Delay: 300,
    MaxDelay: 300,
    Time: 60,
    MaxTime: 60
}

Weps = [
	//{ ID: 1, Cooldown: irandom_range(60, 90) },
	//{ ID: 0, Cooldown: irandom_range(60, 90) },
	//{ ID: 3, Cooldown: irandom_range(60, 90) }
	{ ID: 0, Cooldown: irandom_range(60, 90) },
	{ ID: 1, Cooldown: irandom_range(60, 90) },
	{ ID: 3, Cooldown: irandom_range(60, 90) },
	{ ID: 6, Cooldown: irandom_range(60, 90) },
	{ ID: 8, Cooldown: irandom_range(60, 90) },
	{ ID: 9, Cooldown: irandom_range(60, 90) },
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