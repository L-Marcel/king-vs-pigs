event_inherited();
viewport_follow(id);

if(
	sprite_index != sprite_on.damaged && 
	horizontal_speed == 0 && 
	vertical_speed == 0
) {
	sprite_index = sprite_on.idle;
};