/// @param {Real} _width
/// @param {Real} _height
/// @param {Real} _scale
function ajust_resolution(_width = 1280, _height = 720, _scale = 2) {
	global.width = _width;
	global.height = _height;
	
	global.view_scale = _scale;
	global.view_width = global.width / global.view_scale;
	global.view_height = global.height / global.view_scale;
	
	window_set_size(global.width, global.height);
	surface_resize(application_surface, global.width, global.height);
	display_set_gui_size(global.view_width, global.view_height);
	window_center();
};

function viewport_enable(){
	view_enabled = true;
	view_visible[0] = true;
}

function viewport_follow(_obj) {
	camera_set_view_size(view_camera[0], global.view_width, global.view_height);
	if(instance_exists(_obj)) {
		var _camera = view_camera[0];
		
		var _camera_width = global.view_width / 1;
		var _camera_height = global.view_height / 1;
		
		var _x = _obj.x - (_camera_width/2);
		var _y = _obj.y - (_camera_height/2);
		
		_x = clamp(_x, 0, room_width - _camera_width);
		_y = clamp(_y, 0, room_height - _camera_height);
		
		var _cx = camera_get_view_x(_camera);
		var _cy = camera_get_view_y(_camera);
		
		var _vx = lerp(_cx, _x, 0.2);
		var _vy = lerp(_cy, _y, 0.2);
		
		camera_set_view_pos(
			_camera,
			_vx,
			_vy
		);
	};
};