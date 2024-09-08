/// @desc Draw self

if x - xprevious != 0 image_xscale = sign(x - xprevious);

if level == 10 draw_sprite_ext(sprite_index, image_index, x, y, xscale * image_xscale - abs(vsp) / 50, image_yscale, -hsp * 2, image_blend, image_alpha);
else draw_self();

xscale = lerp(xscale, 1, 0.1);