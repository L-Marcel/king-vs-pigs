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