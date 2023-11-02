if(keyboard_check_pressed(vk_f11) && start) {
	window_set_fullscreen(!window_get_fullscreen());
};

var _player = instance_place(x, y, obj_player);

switch(state) {
	case DOOR_STATE.CLOSED:
		sprite_index = spr_door;
		
		if(_player && !start) {
			if(keyboard_check(_player.inputs.jump) && !global.in_transition) {
				global.in_transition = true;
				state = DOOR_STATE.OPENING;
				_player.action = PLAYER_ACTION.IN;
				_player.x = x;
				_player.y = y;
				layer_sequence_create("Transition", _player.x, _player.y - 14, seq_in);
				alarm[1] = in_time(2);
			};
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
	case DOOR_STATE.UNLOCKING:
		if(sprite_index != spr_door_unlocking) {
			sprite_index = spr_door_unlocking;
			image_index = 0;
		};
		
		if(image_index == image_number - 1) {
			state = DOOR_STATE.CLOSED;
		};
		
		break;
	case DOOR_STATE.LOCKED:
		sprite_index = spr_door_locked;
		break;
	default:
		break;
};