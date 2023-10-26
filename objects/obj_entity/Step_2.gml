var _collide = instance_place(x + horizontal_speed * move_speed, y, obj_ground);

if(_collide) {
	if(horizontal_speed > 0) {
		x = _collide.bbox_left + x - bbox_right;
	} else if(horizontal_speed < 0) {
		x = _collide.bbox_right + x - bbox_left;
	};
	
	if(!dead) {
		sprite_index = sprite_on.idle;
	};
	
	horizontal_speed = 0;
};

_collide = instance_place(x, y + vertical_speed, obj_ground);

if(_collide) {
	if(vertical_speed > 0) {
		y = _collide.bbox_top + y - bbox_bottom;
	} else if(vertical_speed < 0) {
		y = _collide.bbox_bottom + y - bbox_top;
	};
	
	vertical_speed = 0;
};

x += horizontal_speed * move_speed;
y += vertical_speed;