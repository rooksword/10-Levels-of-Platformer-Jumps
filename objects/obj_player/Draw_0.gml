/// @desc Visual Juice - Level 10

draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(fnt_test);

draw_text(16, 16, "Press Z and X to switch between levels");
draw_text(16, 32, "Level: " + string(level));

var _str = "No jump";

switch level
{
	case 1: _str = "Stationary, fixed jump"; break;
	case 2: _str = "Stationary, smooth jump"; break;
	case 3: _str = "Simple physics"; break;
	case 4: _str = "Coyote time and input buffering"; break;
	case 5: _str = "Variable jump height"; break;
	case 6: _str = "Bounce pads and jump types"; break;
	case 7: _str = "Double jump"; break;
	case 8: _str = "Wall climb"; break;
	case 9: _str = "Wall jump"; break;
	case 10: _str = "Visual juice"; break;
}

draw_text(16, 48, _str);

if x - xprevious != 0 image_xscale = sign(x - xprevious);

if level == 10 draw_sprite_ext(sprite_index, image_index, x, y, xscale * image_xscale - abs(vsp) / 50, image_yscale, -hsp * 2, image_blend, image_alpha);
else draw_self();

xscale = lerp(xscale, 1, 0.1);