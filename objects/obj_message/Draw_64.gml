if(view_camera[0]) {
	draw_set_font(fnt_default);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	//var _width = global.view_width;
	//var _height = global.view_height;
	
	//var _x = (_width + camera_get_view_x(view_camera[0])) / 2;
	//var _y = (_height + camera_get_view_y(view_camera[1])) / 2;

	draw_text(x, y, text);
};