/// @desc Movement

#region Switch level

if keyboard_check_pressed(ord("X"))
{
	if level < 10 level++;
	else level = 0;
}

if keyboard_check_pressed(ord("Z"))
{
	if level > 0 level--;
	else level = 10;
}

#endregion

#region Input

var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);

move = _right - _left;

#endregion

#region From Level 9

if wall_jump_freeze > 0
{
	if move == wall_jump_dir move = 0;
	
	wall_jump_freeze--;
}

#endregion

#region Animation

if !place_meeting(x, y + 2, obj_collision) image_index = 1;
else if move == 0 image_index = 0;

#endregion

#region Calculate horizontal velocity

hsp = lerp(hsp, move * spd, 0.25);

#endregion

switch level
{
	case 0: Level0(); break;
	case 1: Level1(); break;
	case 2: Level2(); break;
	case 3: Level3(); break;
	case 4: Level4(); break;
	case 5: Level5(); break;
	case 6: Level6(); break;
	case 7: Level7(); break;
	case 8: Level8(); break;
	case 9: Level9(); break;
	case 10: Level10(); break;
}