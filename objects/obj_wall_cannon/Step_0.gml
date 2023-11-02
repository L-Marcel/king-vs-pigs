switch(state) {
	case CANNON_STATE.OFF:
		sprite_index = spr_wall_cannon;
		break;
	case CANNON_STATE.ON:
		if(sprite_index != spr_wall_cannon_on) {
			play_sound(snd_wall_cannon_shoot);
			sprite_index = spr_wall_cannon_on;
			image_index = 0;
		};
		break;
	default:
		break;
};

if(alarm == -1 && reloading) {
	alarm[0] = in_time(interval);
};

fire();

if(sprite_index == spr_wall_cannon_on && image_index == image_number - 1) {
	var _ball = instance_create_layer(x - image_xscale * 18,y - 6, layer, obj_cannon_ball);
	
	with(_ball) {
		horizontal_speed = -1.8 * other.image_xscale;
		state = BOMB_STATE.ON;
	};
	
	state = CANNON_STATE.OFF;
};