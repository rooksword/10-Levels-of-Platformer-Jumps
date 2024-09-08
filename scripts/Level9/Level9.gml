function Level9()
{
	if keyboard_check_pressed(vk_up) key_jump = buffer;
	if key_jump > 0 key_jump--;

	// Jump

	function Jump(_multiplier)
	{
		audio_play_sound(snd_jump, 10, false);
		
		vsp = -jspd * _multiplier;
		key_jump = 0;
		jump_capacity--;
	}

	vsp += grav;

	if place_meeting(x, y + 1, obj_collision)
	{
		var _inst = instance_place(x, y + 1, obj_collision);

		if coyote_time < coyote_time_max
		{
			if !audio_is_playing(snd_land) audio_play_sound(snd_land, 10, false);
		
			coyote_time = coyote_time_max;
		}
	
		if jump_capacity < jump_capacity_max
		{
			jump_capacity = jump_capacity_max;
		}
	
		if _inst.object_index == obj_bounce
		{
			Jump(1.5);
		
			jump_type = jump_types.BOUNCE;
		}
		else if _inst.object_index == obj_wall
		{
			jump_type = jump_types.NORMAL;
		}
	}
	else if coyote_time > 0
	{
		coyote_time--;
	}

	var _wall_jump = 0;
	if place_meeting(x + 1, y, obj_wall) _wall_jump = 1;
	else if place_meeting(x - 1, y, obj_wall) _wall_jump = -1;
	
	var _can_jump = (coyote_time > 0 and jump_type == jump_types.NORMAL) or jump_capacity > 0 or _wall_jump != 0;

	if key_jump > 0 and _can_jump
	{
		Jump(1);
		
		if _wall_jump != 0 and !place_meeting(x, y + 1, obj_collision)
		{
			jump_capacity++;
			
			wall_jump_dir = _wall_jump;
			wall_jump_freeze = wall_jump_freeze_max;
			
			hsp = wall_jump_spd * -_wall_jump;
		}
	
		if jump_type != jump_types.NORMAL
		{
			jump_type = jump_types.NORMAL;
		}
	}

	if jump_type == jump_types.NORMAL and vsp < 0 and !keyboard_check(vk_up)
	{
		vsp *= jump_decay;
	}

	// Collision

	if place_meeting(x + hsp, y, obj_collision)
	{
	    while !place_meeting(x + sign(hsp), y, obj_collision)
	    {
	        x += sign(hsp);
	    }
	    hsp = 0;
	}
	x += hsp;

	if place_meeting(x, y + vsp, obj_collision)
	{
	    while !place_meeting(x, y + sign(vsp), obj_collision)
	    {
	        y += sign(vsp);
	    }
	    vsp = 0;
	}
	y += vsp;
}