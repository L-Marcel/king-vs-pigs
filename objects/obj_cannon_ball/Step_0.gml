event_inherited();

var _player = instance_place(x, y, obj_player);
if(_player) {
	with(_player) {
		if(!invencible) {
			receive_damage(other.damage, id);
		};
	};
	
	instance_destroy();
};

image_angle -= 5;
if(horizontal_speed == 0) {
	instance_destroy();
};