function Level1()
{
	if jump_stationary == 0
	{
		if keyboard_check_pressed(vk_up)
		{
			audio_play_sound(snd_jump, 10, false);
	
			y -= jump_stationary_height;
			jump_stationary = jump_stationary_max;
		}
	}
	else
	{
		hsp = 0;
	
		jump_stationary--;
	
		if jump_stationary == 1
		{
			if !audio_is_playing(snd_land) audio_play_sound(snd_land, 10, false);
	
			y += jump_stationary_height;
		}
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