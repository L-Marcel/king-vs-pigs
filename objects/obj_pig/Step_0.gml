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

if(!can_fall) {
	var _will_fall = !place_meeting(x + horizontal_speed * (move_speed + 19), y + 1, obj_ground);
	
	if(_will_fall) {
		horizontal_speed = choose(0, -1);
	};
};

event_inherited();

player_alert();

if(state == PIG_STATE.RUNNING_TO_BOMB) {
	var _in_colision_with_bomb = instance_place(x, y, obj_bomb);
	
	if(
		_in_colision_with_bomb
		&& _in_colision_with_bomb.state == BOMB_STATE.OFF
	) {
		horizontal_speed = 0;
		interacting_with_bomb = _in_colision_with_bomb.id;
		change_state(PIG_STATE.LIGHTING_BOMB);
	};
};