/// Basic Projectile : Step

// Range check
if (point_distance(x, y, ox, oy) > Range) instance_destroy();

// Move
Speed *= 1.02;
motion_set(Dir, Speed);

// Create particles
create_particle(x, y, 3, { Dir: image_angle - 180, Col: Col });