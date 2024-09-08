/// @desc Variables

level = 0;
move = 0;

// Level 0

spd = 3; // Maximum horizontal speed
hsp = 0; // Current horizontal velocity

// Level 1

jump_stationary = 0;         // How long has the player been jumping
jump_stationary_max = 60;    // How long until the player should fall
jump_stationary_height = 32; // Distance to be telported up

// Level 3

vsp = 0;    // Current vertical velocity
jspd = 5;   // Jump strength
grav = 0.3; // Gravity

// Level 4

coyote_time_max = 10;          // How many frames the player can be in the air for and stil jump
coyote_time = coyote_time_max; // The timer for our coyote time

buffer = 10;                   // How many frames we can hit the jump button before hitting the ground
key_jump = 0;                  // = 10 when the jump key is pressed, = 0 when we can no longer jump

// Level 5

jump_decay = 0.8;

// Level 6

enum jump_types
{
	NORMAL,
	BOUNCE
}

jump_type = jump_types.NORMAL;

// Level 7

jump_capacity_max = 2;
jump_capacity = jump_capacity_max;

// Level 9

wall_jump_spd = 6;
wall_jump_dir = 0;
wall_jump_freeze = 0;
wall_jump_freeze_max = 20;

// Level 10

xscale = 1;