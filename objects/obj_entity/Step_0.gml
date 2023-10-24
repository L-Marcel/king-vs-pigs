var _in_ground = place_meeting(x, y + 1, obj_ground);
var _is_running = horizontal_speed != 0 && move_speed != 0;

if(_is_running) {
	image_xscale = sign(horizontal_speed);
};
	
if(jumping && _in_ground) {
	sprite_index = sprite_on.jump;
	vertical_speed = -jump_force;
} else if(!_in_ground && !flying) {
	vertical_speed += gravity_force;
	if(vertical_speed > 0) {
		sprite_index = sprite_on.fall;
	};
} else if(_in_ground && _is_running) {
	sprite_index = sprite_on.run;
} else {
	sprite_index = sprite_on.idle;
};