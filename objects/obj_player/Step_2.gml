dead = life <= 0;
if(dead) {
	image_alpha = 0;
	horizontal_speed = 0;
	with_gravity = false;
	invencible = true;
	can_attack = false;
	can_jump = false;
};

if(!global.in_transition && dead) {
	global.in_transition = true;
	layer_sequence_create("Transition", x, y, seq_dead);
	alarm[8] = in_time(6);
};

event_inherited();
viewport_follow(id);

if(
	sprite_index != sprite_on.damaged && 
	horizontal_speed == 0 && 
	vertical_speed == 0 &&
	action == PLAYER_ACTION.NONE
) {
	sprite_index = sprite_on.idle;
};

switch(action) {
	case PLAYER_ACTION.OUT:
		if(sprite_index != spr_player_out) {
			sprite_index = spr_player_out;
			image_index = 0;
		};
		
		image_xscale = 1;
		break;
	case PLAYER_ACTION.IN:
		if(sprite_index != spr_player_in) {
			sprite_index = spr_player_in;
			image_index = 0;
		};
		
		image_xscale = 1;
		break;
	case PLAYER_ACTION.ATTACK:
		break;
	case PLAYER_ACTION.NONE:
		break;
	default:
		break;
};