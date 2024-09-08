function Level0()
{
	// Collision

	if place_meeting(x + hsp, y, obj_collision)
	{
	    while !place_meeting(x+sign(hsp),y, obj_collision)
	    {
	        x += sign(hsp);
	    }
	    hsp = 0;
	}
	x += hsp;
}