/// Manager : Init

depth = -10000;

randomize();

#macro CAM_W camera_get_view_width(view_camera[0])
#macro CAM_H camera_get_view_height(view_camera[0])
surface_resize(application_surface, CAM_W, CAM_H);

draw_set_font(fnt_PICO8);
draw_set_circle_precision(64);

global.Tick = 0;

global.Keys = {
	Left: ord("A"),
	Right: ord("D"),
	Up: ord("W"),
	Down: ord("S"),
	Warp: vk_space
}

global.Camera = {
	x: 0,
	y: 0,
	xTo: 0,
	yTo: 0
}

global.Particles = ds_list_create();
global.Stars = ds_list_create();

for (var i = 0; i < 25; i++)	// Create stars
{
	ds_list_add(global.Stars, [random_range(0, CAM_W), random_range(0, CAM_H), choose($c7c3c2, $9c7683)]);
}

// Init weapon tables
init_player_weapons();
init_enemy_weapons();

hitboxes = -1;