var _in_ground = place_meeting(x, y + 1, obj_ground);

if(_in_ground && sprite_index == sprite_on.idle && horizontal_speed == 0 && alarm[0] == -1 && life > 0) {
	horizontal_speed = choose(-1, 1);
	alarm[0] = in_time(2);
};

var _wall_collide = place_meeting(x + horizontal_speed * move_speed, y, obj_ground);

if(_wall_collide) {
	horizontal_speed = -horizontal_speed;
	alarm[0] = in_time(choose(0, 1));
};

event_inherited();

player_alert();

if(hitted && state != PIG_STATE.IDLE) {
	state = PIG_STATE.IDLE;
	with_gravity = true;
};

switch(state) {
	case PIG_STATE.ATTACKING:
		if(sprite_index != sprite_on.attack) {
			sprite_index = sprite_on.attack;
		};
		
		break;
	case PIG_STATE.WILL_ATTACK:
		alarm[0] = -1;
		
		var _player = collision_circle(x, y, 60, obj_player, false, false);

		if(_player) {
			alarm[3] = -1;
			if(_player.y <= y) {
				change_state(PIG_STATE.ATTACKING);
			};
		} else if(alarm[3] == -1) {
			alarm[3] = in_time(1);
		};

		break;
	default:
		break;
};

if(!can_fall) {
	var _will_fall = !place_meeting(x + horizontal_speed * (move_speed + 24), y + 1, obj_ground);
	
	if(_will_fall) {
		change_state(PIG_STATE.IDLE);
	};
};