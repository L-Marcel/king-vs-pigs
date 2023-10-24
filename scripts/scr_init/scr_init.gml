if(!debug_mode) {
	randomize();
};

/// @param {Real} _x
function in_time(_x) {
	return _x * game_get_speed(gamespeed_fps);
};

/// @param {Real} _x
function in_ms_time(_x) {
	return _x * game_get_speed(gamespeed_microseconds);
};