switch(state) {
	case SWITCH_STATE.LEFT:
		sprite_index = spr_switch_left;
		break;
	case SWITCH_STATE.CHANGING:
		if(sprite_index != spr_switch_changing) {
			image_index = 0;
			sprite_index = spr_switch_changing;
		};
		break;
	case SWITCH_STATE.RIGHT:
		sprite_index = spr_switch_right;
		break;
	default:
		break;
};