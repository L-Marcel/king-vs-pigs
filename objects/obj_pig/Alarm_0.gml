/// @description change state

var _next_state = choose(1, 2);
	
if(life <= 0 || hitted) {
	_next_state = 0;
};
	
switch(_next_state) {
	case 0:
		break;
	case 1:
		horizontal_speed = 0;
		alarm[0] = in_time(2);
		break;
	case 2:
		horizontal_speed = choose(-1, 1);
		image_xscale = horizontal_speed;
		alarm[0] = in_time(choose(1, 2));
		break;
	default:
		break;
};