var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);

jumping = keyboard_check_pressed(inputs.jump);
horizontal_speed = (_right - _left);

event_inherited();