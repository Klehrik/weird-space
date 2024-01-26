/// Projectile : Draw

depth = -100;

draw_sprite_ext(spr_Glow, 0, x, y, (sprite_width * 2.5) / 64, (sprite_height * 2.5) / 64, 0, Col, 1);
draw_self();