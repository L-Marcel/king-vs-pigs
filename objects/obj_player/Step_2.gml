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
	case PLAYER_ACTION.NONE:
		break;
	default:
		break;
};