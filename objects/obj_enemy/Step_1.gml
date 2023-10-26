if (hitted && alarm[11] == -1) {
	if(!dead) {
		try_jump(false,,true,,1);
		
		var _knockback = random_range(-8, 8);
	
		var _collide = instance_place(x + _knockback, y, obj_ground);

		if(_collide) {
			if(_knockback > 0) {
				x = _collide.bbox_left + x - bbox_right;
			} else if(_knockback < 0) {
				x = _collide.bbox_right + x - bbox_left;
			};
		} else {
			x += _knockback;
		};
	};
	
	if(life > 0) {
		alarm[11] = in_time(invencibility_duration);
	} else if(!dead) {
		dead = true;
		alarm[10] = -1;
	};
};

if(hitted || dead) {
	horizontal_speed = 0;
};