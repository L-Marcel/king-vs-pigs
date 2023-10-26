var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);

horizontal_speed = (_right - _left);

if(vertical_speed > 0) {
	var _enemy = instance_place(x, y + 1, obj_enemy);
	
	if(_enemy && !_enemy.hitted) {
		try_jump(false, inputs.jump, true);
		_enemy.hitted = true;
		_enemy.life -= damage / 1.5;
	};
};

event_inherited();