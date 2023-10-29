damage = 0;
impact = 1.5;
image_alpha = 0;
alarm[0] = in_time(.13);

hitted_objects = ds_list_create();

/// @param {Id.Instance} _id
function obj_not_hitted(_id) {
	for(var _i = 0; _i < ds_list_size(hitted_objects); _i++) {
		var _obj = hitted_objects[| _i];
		if(!is_undefined(_obj) && _obj.id == _id) {
			return false;
		};
	};
	
	return true;
};