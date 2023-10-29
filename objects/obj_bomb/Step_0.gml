event_inherited();

switch(state) {
	case BOMB_STATE.OFF:
		sprite_index = spr_bomb;
		break;
	case BOMB_STATE.ON:
		sprite_index = spr_bomb_on;
		explosion_in--;
		
		image_xscale /= 0.998;
		image_yscale /= 0.998;
		
		
		if(explosion_in <= 0) {
			state = BOMB_STATE.BOOM;
		};
		
		if(horizontal_speed != 0) {
			var _player = instance_place(x, y, obj_player);
			if(_player) {
				state = BOMB_STATE.BOOM;
				explosion_in = 0;
				horizontal_speed = 0;
				with_gravity = false;
			};
		};
		
		break;
	case BOMB_STATE.BOOM:
		sprite_index = spr_bomb_boom;

		if(abs(image_xscale) <= 2) {
			image_xscale /= 0.995;
			image_yscale /= 0.995;
		};
		
		var _player = instance_place(x, y, obj_player);
		if(_player) {
			with(_player) {
				if(!invencible) {
					receive_damage(other.damage, id);
				};
			};
		};
		
		break;
	default:
		break;
};

if(horizontal_speed != 0) {
	horizontal_speed /= 1.01;
};