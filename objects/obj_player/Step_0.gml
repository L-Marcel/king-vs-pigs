var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);

horizontal_speed = (_right - _left);

var _jumpped_in_a_head = false;
if(vertical_speed > 0) {
	var _enemy = instance_place(x, y + 1, obj_enemy);
	
	if(_enemy && !_enemy.hitted) {
		_jumpped_in_a_head = true;
		try_jump(false, inputs.jump, true);
		_enemy.hitted = true;
		_enemy.life -= damage / 1.5;
	};
};

event_inherited();

var _enemy = instance_place(x, y, obj_enemy);

if(!invencible && !hitted && _enemy && !_jumpped_in_a_head && !_enemy.dead) {
	receive_damage(_enemy.damage);
} else if(hitted) {
	sprite_index = sprite_on.damaged;
	
	with_gravity = false;
	horizontal_speed = 0;
	if(alarm[11] == -1) {
		alarm[11] = in_time(invencibility_duration * .15);
	};
} else if(!hitted && invencible && alarm[10] == -1) {
	alarm[10] = in_time(invencibility_duration * .85);
};