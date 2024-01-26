/// Enemy : Draw

// Draw ship
for (var i = 0; i < sprite_get_number(sprite_index); i++)
{
	draw_sprite_ext(sprite_index, i, round(x), round(y) + 1 - i, image_xscale, image_yscale, image_angle, c_black, 1);
	draw_sprite_ext(sprite_index, i, round(x), round(y) - i, image_xscale, image_yscale, image_angle, c_white, 1);
}

// Draw shield
var col = $4d00ff;
if (Shield > 0) draw_circle_colour(round(x) - 1, round(y) - 3, Size * 2.25, col, col, 1);

// Draw stat bars
draw_rectangle_filled(x - 6, y + 5, 12, 3, $532b1d, 1);
if (Shield > 0) draw_rectangle_filled(x - 6, y + 5, (Shield / MaxShield) * 12, 3, $ffad29, 1);
else
{
	var c = $36e400;
	if (floor(global.Tick / 20) mod 2 == 0) c = $e8f1ff;
	draw_rectangle_filled(x - 6, y + 5, 12, 3, c, 1);	
}

// Shield regen bar
var bar = (ShieldRegen.Delay / ShieldRegen.MaxDelay) * 12;
if (ShieldRegen.Delay >= ShieldRegen.MaxDelay) bar = (ShieldRegen.Time / ShieldRegen.MaxTime) * 12;
if (Shield < MaxShield) draw_rectangle_filled(x - 6, y + 9, bar, 2, $c7c3c2, 1);

// Create engine particles
create_particle(x + dcos(image_angle - 180) * Size, y - (Size / 2) - dsin(image_angle - 180) * Size,
1, { Dir: image_angle - 180 });