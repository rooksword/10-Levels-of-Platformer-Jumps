function Level5()
{
	if keyboard_check_pressed(vk_up) key_jump = buffer;
	if key_jump > 0 key_jump--;

	// Jump

	vsp += grav;

	if place_meeting(x, y + 1, obj_collision)
	{
		if coyote_time < coyote_time_max
		{
			if !audio_is_playing(snd_land) audio_play_sound(snd_land, 10, false);
		
			coyote_time = coyote_time_max;
		}
	}
	else if coyote_time > 0
	{
		coyote_time--;
	}

	if key_jump > 0 and coyote_time > 0
	{
		audio_play_sound(snd_jump, 10, false);

	    vsp = -jspd;
		key_jump = 0;
	}

	if vsp < 0 and !keyboard_check(vk_up)
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