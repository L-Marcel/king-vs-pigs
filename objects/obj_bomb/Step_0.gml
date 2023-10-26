event_inherited();

switch(state) {
	case BOMB_STATE.OFF:
		sprite_index = spr_bomb;
		break;
	case BOMB_STATE.ON:
		sprite_index = spr_bomb_on;
		explosion_in--;
		
		if(explosion_in <= 0) {
			state = BOMB_STATE.BOOM;
		};
		break;
	case BOMB_STATE.BOOM:
		sprite_index = spr_bomb_boom;
		
		var _player = instance_place(x, y, obj_player);
		if(_player) {
			with(_player) {
				receive_damage(2, _player.id);
			};
		};
		break;
	default:
		break;
};