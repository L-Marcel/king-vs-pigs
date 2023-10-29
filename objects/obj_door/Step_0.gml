var _player = instance_place(x, y, obj_player);

switch(state) {
	case DOOR_STATE.CLOSED:
		sprite_index = spr_door;
		
		if(_player && !start) {
			_player.can_jump = false;
			
			if(keyboard_check(_player.inputs.jump) && !global.in_transition) {
				global.in_transition = true;
				state = DOOR_STATE.OPENING;
				_player.action = PLAYER_ACTION.IN;
				layer_sequence_create("Transition", _player.x, _player.y - 14, seq_in);
			};
		} else if(!_player) {
			_player = layer_instance_get_instance(obj_player);
			_player.can_jump = true;
		};
		
		break;
	case DOOR_STATE.OPENING:
		if(sprite_index != spr_door_opening) {
			sprite_index = spr_door_opening;
			image_speed = initial_image_speed;
			image_index = 0;
		};
		
		if(image_index == image_number - 1) {
			image_speed = 0;
		};
		break;
	case DOOR_STATE.CLOSING:
		if(sprite_index != spr_door_closing) {
			sprite_index = spr_door_closing;
			image_speed = initial_image_speed;
			image_index = 0;
		};
		
		if(image_index == image_number - 1) {
			state = DOOR_STATE.CLOSED;
		};
		
		break;
	default:
		break;
};