function Level3()
{
	vsp += grav;

	if keyboard_check_pressed(vk_up) and place_meeting(x, y + 1, obj_collision)
	{
		audio_play_sound(snd_jump, 10, false);

	    vsp = -jspd;
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
	
		if vsp > grav * 5 if !audio_is_playing(snd_land) audio_play_sound(snd_land, 10, false);
	
	    vsp = 0;
	}
	y += vsp;
}