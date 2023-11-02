/// @description create attack wave
if(state == PIG_STATE.ATTACKING) {
	var _impulse_x = attack_direction_impulse * 0.7;
	var _impulse_y = (y - _player.y) * 0.8;
	var _collide = instance_place(x + _impulse_x, y, obj_ground);

	if(_collide) {
		if(_impulse_x > 0) {
			x = _collide.bbox_left + x - bbox_right;
		} else if(_impulse_x < 0) {
			x = _collide.bbox_right + x - bbox_left;
		};
	} else {
		x += _impulse_x;
	};
	
	_collide = instance_place(x, y - _impulse_y, obj_ground);

	if(_collide) {
		if(_impulse_y > 0) {
			y = _collide.bbox_top + y - bbox_bottom;
		} else if(_impulse_y < 0) {
			y = _collide.bbox_bottom + y - bbox_top;
		};
	} else {
		y -= _impulse_y;
	};

	var _attack_wave = instance_create_layer(x, y, layer, obj_pig_attack_wave);
	_attack_wave.image_xscale = image_xscale;
	_attack_wave.damage = damage * 2;
};