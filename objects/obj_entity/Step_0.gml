var _in_ground = place_meeting(x, y + 1, obj_ground);
var _is_running = horizontal_speed != 0 && move_speed != 0;

if(_is_running && !hitted) {
	image_xscale = sign(horizontal_speed);
};
	
try_jump(_in_ground);
	
if(!_in_ground && !flying) {
	vertical_speed += gravity_force;
	if(vertical_speed > 0 && !dead) {
		sprite_index = sprite_on.fall;
	};
} else if(_in_ground && _is_running && !dead) {
	sprite_index = sprite_on.run;
} else if(!dead && life > 0) {
	sprite_index = sprite_on.idle;
};