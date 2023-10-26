event_inherited();

enum PIG_STATE {
	DEAD,
	IDLE,
	RUNNING,
	RUNNING_TO_BOMB,
	LIGHTING_BOMB,
	THROWING_BOMB,
	LIGHTING_CANNON,
};

state = PIG_STATE.IDLE;
interacting_with_bomb = 0;

/// @param {Real} _state
function change_state(_state) {
	state = _state;
	switch(_state) {
		case PIG_STATE.DEAD:
			break;
		case PIG_STATE.IDLE:
			horizontal_speed = 0;
			alarm[0] = in_time(2);
			break;
		case PIG_STATE.RUNNING:
			horizontal_speed = choose(-1, 1);
			image_xscale = horizontal_speed;
			alarm[0] = in_time(choose(1, 2));
			break;
		case PIG_STATE.RUNNING_TO_BOMB:
			alarm[0] = -1;
			
			var _bombs = ds_list_create();
			var _bombs_in_range = collision_line_list(x - 64,y,x + 64,y, obj_bomb, false, false, _bombs, true);

			if(_bombs_in_range > 0) {
				for(i = 0; i < _bombs_in_range - 1; i++) {
					var _bomb = _bombs[i]; 
					if(_bomb && _bomb.state == BOMB_STATE.OFF) {
						horizontal_speed = sign(_bomb.x - x) * 1.4;
						break;
					};
				};
			};
			
			break;
		case PIG_STATE.LIGHTING_BOMB:
			sprite_index = spr_enemy_pig_lighting;
			horizontal_speed = 0;
			break;
		default:
			break;
	};
};

function player_alert() {
	if(state == PIG_STATE.RUNNING || state == PIG_STATE.IDLE) {
		var _player = collision_circle(x, y, 64, obj_player, false, false);
		var _bomb = collision_circle(x, y, 64, obj_bomb, false, false);
		if(_player && _bomb) {
			change_state(PIG_STATE.RUNNING_TO_BOMB);
		};
	};
};