/// Particles

function create_particle(_x, _y, type, data)
{
	var p = -1;
	
	switch (type)
	{
		case 1:	p = new make_part_engine(_x, _y, data); break;		// Engine
		case 2:	p = new make_part_warp(_x, _y, data); break;		// Warp drive
		case 3:	p = new make_part_proj(_x, _y, data); break;		// Basic projectile
	}
	
	if (p != -1) ds_list_add(global.Particles, p);
}

function make_part_engine(_x, _y, data) constructor
{
	x = _x;
	y = _y;
	
	Life = 24;
	Dir = data.Dir + random_range(-150, 150);
	Speed = random_range(0.2, 0.3);
	Size = irandom_range(1, 3);
	
	static Step = function()
	{
		Life -= 1;
		if (Life <= 0) Destroy();
				
		Speed *= 0.98;
		x += dcos(Dir) * Speed;
		y -= dsin(Dir) * Speed;
	}
	
	static Draw = function()
	{
		var col = $27ecff;
		if (Life < 10) col = $532b1d;
		else if (Life < 16) col = $3652ab;
		else if (Life < 20) col = $00a3ff;
		draw_circle_colour(x, y, Size, col, col, 0);
	}
	
	static Destroy = function()
	{
		ds_list_delete(global.Particles, ds_list_find_index(global.Particles, self));
	}
}

function make_part_warp(_x, _y, data) constructor
{
	x = _x;
	y = _y;
	
	Life = 25;
	Dir = data.Dir + random_range(-75, 75);
	Speed = random_range(0.2, 0.3);
	Size = irandom_range(1, 3);
	
	static Step = function()
	{
		Life -= 1;
		if (Life <= 0) Destroy();
				
		Speed *= 0.98;
		x += dcos(Dir) * Speed;
		y -= dsin(Dir) * Speed;
	}
	
	static Draw = function()
	{
		var col = $e8f1ff;
		if (Life < 9) col = $532b1d;
		else if (Life < 15) col = $9c7683;
		else if (Life < 20) col = $ffad29;
		draw_circle_colour(x, y, Size, col, col, 0);
	}
	
	static Destroy = function()
	{
		ds_list_delete(global.Particles, ds_list_find_index(global.Particles, self));
	}
}

function make_part_proj(_x, _y, data) constructor
{
	x = _x - 1;		// -1 because it is off centered for some reason
	y = _y - 1;
	
	Life = 7;
	Dir = data.Dir + random_range(-75, 75);
	Speed = random_range(0.1, 0.2);
	Size = irandom_range(1, 3);
	Col = data.Col;
	
	static Step = function()
	{
		Life -= 1;
		if (Life <= 0) Destroy();
				
		Speed *= 0.98;
		x += dcos(Dir) * Speed;
		y -= dsin(Dir) * Speed;
	}
	
	static Draw = function()
	{
		var col = $e8f1ff;
		if (Life <= 3) col = Col;
		draw_circle_colour(x, y, Size, col, col, 0);
	}
	
	static Destroy = function()
	{
		ds_list_delete(global.Particles, ds_list_find_index(global.Particles, self));
	}
}
