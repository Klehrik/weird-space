/// 2D Vector Library
/// Klehrik


// [Functions - vec2]

// new vec2(x, y);
// * Creates a new Vec2.


// getDir();
// * Returns the direction of the vector.

// getMag();
// * Returns the magnitude of the vector.


// add(v2);
// * Adds another vec2 to the vector.

// normalize();
// * Normalizes the vector.

// setDir(dir);
// * Sets the direction of the vector to a specified angle (in degrees).

// setMag(len);
// * Sets the magnitude of the vector to a specified length.


function vec2(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	
	
	static getDir = function()
	{
		return point_direction(0, 0, x, y);
	}
	
	static getMag = function()
	{
		return point_distance(0, 0, x, y);
	}
	
	
	
	static add = function(vec)
	{
		x += vec.x;
		y += vec.y;
	}
	
	static normalize = function()
	{
		var m = point_distance(0, 0, x, y);
		if (m != 0)
		{
			x /= m;
			y /= m;
		}
	}
	
	static setDir = function(dir)
	{
		var m = point_distance(0, 0, x, y);
		x = dcos(dir) * m;
		y = -dsin(dir) * m;
	}
	
	static setMag = function(len)
	{
		var m = point_distance(0, 0, x, y);
		if (m != 0)
		{
			x /= m;
			y /= m;
		}
		
		x *= len;
		y *= len;
	}
}