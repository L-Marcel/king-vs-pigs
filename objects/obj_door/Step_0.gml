if(start && !audio_is_playing(snd_music_0) && !audio_is_playing(snd_music_1)) {
	var _id = choose(0,1);
	_id = asset_get_index($"snd_music_{_id}");
	audio_play_sound(_id, 1, false, 0.7);
};

if(keyboard_check_pressed(vk_f11) && start) {
	window_set_fullscreen(!window_get_fullscreen());
};

var _player = instance_place(x, y, obj_player);

switch(state) {
	case DOOR_STATE.CLOSED:
		sprite_index = spr_door;
		
		if(_player && !start) {
			if(keyboard_check(_player.inputs.jump) && _player.vertical_speed == 0 && !global.in_transition) {
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
			play_sound(snd_machine);
			sprite_index = spr_door_opening;
			image_speed = initial_image_speed;
			image_index = 0;
		};
		
		if(image_index == image_number - 1) {
			image_speed = 0;
		};
		
		break;
	case DOOR_STATE.UNLOCKING:
		play_sound(snd_door_unlocking,true,1,1);
	
		if(sprite_index != spr_door_unlocking) {
			sprite_index = spr_door_unlocking;
			image_index = 0;
		};
		
		if(image_index == image_number - 2) {
			state = DOOR_STATE.CLOSED;
		};
		
		break;
	case DOOR_STATE.LOCKED:
		sprite_index = spr_door_locked;
		break;
	default:
		break;
};