var _in_ground = place_meeting(x, y + 1, obj_ground);

if(_in_ground && horizontal_speed == 0 && alarm[0] == -1) {
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