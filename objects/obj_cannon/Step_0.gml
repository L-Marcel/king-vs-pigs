switch(state) {
	case CANNON_STATE.OFF:
		sprite_index = spr_cannon;
		break;
	case CANNON_STATE.ON:
		if(sprite_index != spr_cannon_on) {
			sprite_index = spr_cannon_on;
			image_index = 0;
		};
		break;
	default:
		break;
};

if(alarm == -1 && reloading) {
	alarm[0] = in_time(min_interval);
};

if(sprite_index == spr_cannon_on && image_index == image_number - 1) {
	var _bomb = instance_create_layer(x - image_xscale * 18,y - 2, layer, obj_bomb);
	
	with(_bomb) {
		image_xscale = other.image_xscale;
		horizontal_speed = -(0.8 + random_range(0, 1)) * other.image_xscale;
		state = BOMB_STATE.ON;
	};
	
	state = CANNON_STATE.OFF;
};