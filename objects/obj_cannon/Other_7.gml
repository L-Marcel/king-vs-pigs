if(sprite_index == spr_cannon_on) {
	var _bomb = instance_create_layer(x - image_xscale * 18,y - 2, layer, obj_bomb);
	
	with(_bomb) {
		horizontal_speed = -2 * other.image_xscale;
		danger = true;
		state = BOMB_STATE.ON;
	};
	
	state = CANNON_STATE.OFF;
};