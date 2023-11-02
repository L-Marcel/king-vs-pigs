event_inherited();

state = PIG_STATE.IDLE;
can_attack = true;
attack_interval = 2;
initial_move_speed = move_speed;
attack_direction_impulse = 0;

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
		case PIG_STATE.WILL_ATTACK:
			if(!hitted) {
				horizontal_speed = sign(interacting_with_player.x - x);
			};
			
			break;
		case PIG_STATE.ATTACKING:
			with_gravity = false;
			var _player = instance_find(obj_player, 0);
			
			if(_player.x != x) {
				image_xscale = sign(_player.x - x);
				attack_direction_impulse = _player.x - x;
			};
			
			can_attack = false;
			alarm[1] = in_time(attack_interval);
			alarm[2] = in_time(.4);
			sprite_index = sprite_on.attack
			image_index = 0;
			horizontal_speed = 0;
			with_gravity = false;
			break;
		default:
			break;
	};
};

function player_alert() {
	if(state == PIG_STATE.RUNNING || state == PIG_STATE.IDLE) {
		_player = collision_circle(x, y, 180, obj_player, false, false);
		if(_player && !_player.dead && can_attack) {
			interacting_with_player = _player.id;
			can_fall = true;
			change_state(PIG_STATE.WILL_ATTACK);
		};
	};
};