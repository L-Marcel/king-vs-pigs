var _collide = instance_place(x + horizontal_speed * move_speed, y, obj_ground);

if(_collide && !special_object) {
	if(horizontal_speed > 0) {
		x = _collide.bbox_left + x - bbox_right;
	} else if(horizontal_speed < 0) {
		x = _collide.bbox_right + x - bbox_left;
	};

	if(
		object_get_parent(id.object_index) != obj_entity
		&& horizontal_speed != 0
	) {
		play_sound(snd_collide);
	};
 	
	horizontal_speed = 0;
};

_collide = instance_place(x, y + vertical_speed, obj_platform);

if(_collide && !special_object) {
	if(vertical_speed > 0 && !can_down_ground && y <= _collide.y + vertical_speed) {
		y = _collide.bbox_top + y - bbox_bottom;
		
		if(can_play_plataform_sound) {
			can_play_plataform_sound = false;
			play_sound(snd_collide,,vertical_speed/4);
		};
		
		vertical_speed = 0;
	}
} else if(!_collide && !special_object) {
	can_play_plataform_sound = true;
	_collide = instance_place(x, y + vertical_speed, obj_ground);
	if(_collide) {
		if(vertical_speed > 0) {
			y = _collide.bbox_top + y - bbox_bottom;
		} else if(vertical_speed < 0) {
			y = _collide.bbox_bottom + y - bbox_top;
		};
	
		if(vertical_speed > 0) {
			play_sound(snd_collide,,vertical_speed/5);
		};
	
		vertical_speed = 0;
	};
};

x += horizontal_speed * move_speed;
y += vertical_speed;