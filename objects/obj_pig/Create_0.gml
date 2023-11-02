event_inherited();

state = PIG_STATE.IDLE;
interacting_with_bomb = 0;
interacting_with_cannon = 0;

/// @param {Real} _state
function change_state(_state) {
	state = _state;
	
	if(will_dead || dead) {
		return;
	};
	
	if(hitted) {
		state = PIG_STATE.IDLE;
	};
	
	switch(_state) {
		case PIG_STATE.DEAD:
			will_dead = true;
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
			var _bombs_in_range = collision_line_list(x - 64,y - 2,x + 64,y, obj_bomb, false, false, _bombs, true);
			
			if(_bombs_in_range > 0) {
				for(i = 0; i < _bombs_in_range; i++) {
					var _bomb = _bombs[| i]; 
					if(!is_undefined(_bomb) && _bomb.state == BOMB_STATE.OFF && !_bomb.targeted) {
						horizontal_speed = sign(_bomb.x - x) * 1.5;
						_bomb.targeted = true;
						break;
					};
				};
			};
			
			break;
		case PIG_STATE.LIGHTING_CANNON:
			sprite_index = spr_enemy_pig_lighting;
			horizontal_speed = 0;
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
	if(!hitted && (state == PIG_STATE.RUNNING || state == PIG_STATE.IDLE)) {
		var _player = instance_find(obj_player, 0);
		var _cannon = collision_line(x - 64, y - 4, x + 64, y, obj_cannon, false, false);
		
		if(
			_cannon &&
			!_cannon.targeted &&
			!_cannon.reloading &&
			_player &&
			(
				(
					_cannon.image_xscale == -1 &&
					_cannon.x < _player.x &&
					x < _player.x
				) || (
					_cannon.image_xscale == 1 &&
					_cannon.x > _player.x &&
					x > _player.x
				)
			)
		) {
			_cannon.targeted = true;
			horizontal_speed = sign(_cannon.x - x) * 1.5;
			alarm[0] = -1;
			change_state(PIG_STATE.RUNNING_TO_CANNON);
		} else if(!_cannon && collision_circle(x, y, 70, obj_player, false, false)) {
			change_state(PIG_STATE.RUNNING_TO_BOMB);
		};
	};
};