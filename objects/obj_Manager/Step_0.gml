/// Manager : Step

global.Tick += 1;

// Camera
var dist = point_distance(obj_Player.x, obj_Player.y, mouse_x, mouse_y) / 2.5;
global.Camera.xTo = obj_Player.x - (CAM_W / 2) + (dcos(obj_Player.image_angle) * dist);
global.Camera.yTo = obj_Player.y - (CAM_H / 2) - (dsin(obj_Player.image_angle) * dist);
global.Camera.x += (global.Camera.xTo - global.Camera.x) / 16;
global.Camera.y += (global.Camera.yTo - global.Camera.y) / 16;
if (abs(global.Camera.xTo - global.Camera.x) < 1) global.Camera.x = global.Camera.xTo;
if (abs(global.Camera.yTo - global.Camera.y) < 1) global.Camera.y = global.Camera.yTo;
camera_set_view_pos(view_camera[0], round(global.Camera.x), round(global.Camera.y));