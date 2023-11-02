var _time = get_timer() / 1000000;
for(var _i = 0; _i < max_life / 2; _i++) {
	if((life / 2) >= _i + 0.5) {
		draw_sprite(
			(life / 2) >= _i + 1? spr_heart:spr_heart_small, 
			8 * _time, 5 + 15 * (_i + 1), 20
		);
	};
};