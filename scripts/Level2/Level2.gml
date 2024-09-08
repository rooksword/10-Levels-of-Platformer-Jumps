function Level2()
{
	if jump_stationary == 0
	{
		if keyboard_check_pressed(vk_up)
		and place_meeting(x, y + 2, obj_collision)
		and !place_meeting(x, y - jump_stationary_height, obj_collision)
		{
			audio_play_sound(snd_jump, 10, false);
	
			jump_stationary = jump_stationary_max;
		}
	}
	else
	{
		hsp = 0;
	
		if jump_stationary > jump_stationary_max / 2
		{
			y -= 2;
		}
		else
		{
			y += 2;
		}
	
		if jump_stationary == 1
		{
			if !audio_is_playing(snd_land) audio_play_sound(snd_land, 10, false);
		}
	
		jump_stationary--;
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
}