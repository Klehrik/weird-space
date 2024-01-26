/// Misc

function keyd(key) { return keyboard_check(key); }
function keyp(key) { return keyboard_check_pressed(key); }
function moused(button) { return mouse_check_button(button); }
function mousep(button) { return mouse_check_button_pressed(button); }

function draw_rectangle_filled(x, y, xscale, yscale, col, alpha) // built in draw_rectangle is inconsistent between desktop and HTML
{
	draw_sprite_ext(spr_Pixel, 0, x, y, xscale, yscale, 0, col, alpha);
}

function solve_quadratic(a, b, c)
{
	// Check discriminant
	if sqr(b) - (4 * a * c) >= 0
	{
		// Solve both roots
		var x1 = (-b + sqrt(sqr(b) - (4 * a * c))) / (2 * a);
		var x2 = (-b - sqrt(sqr(b) - (4 * a * c))) / (2 * a);
		
		// Return the smallest non-negative root
		if x1 < 0 or (x2 < x1 and x2 >= 0) x1 = x2;
		return x1;
	}
	else return -1;
}