var _next_state = choose(0, 1);

switch(_next_state) {
	case 0:
		horizontal_speed = 0;
		alarm[0] = in_time(2);
		break;
	case 1:
		horizontal_speed = choose(-1, 1);
		image_xscale = horizontal_speed;
		alarm[0] = in_time(choose(1, 2));
		break;
	default:
		break;
};