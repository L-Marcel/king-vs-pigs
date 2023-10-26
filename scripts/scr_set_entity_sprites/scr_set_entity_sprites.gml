/// @param {String} _spr_name
function scr_set_entity_sprites(_spr_name){
	_idle = asset_get_index("spr_" + _spr_name + "_idle");
	var _fall = asset_get_index("spr_" + _spr_name + "_falling");
	var _jump = asset_get_index("spr_" + _spr_name + "_jumping");
	var _run = asset_get_index("spr_" + _spr_name + "_running");
	var _attack = asset_get_index("spr_" + _spr_name + "_attacking");
	var _damaged = asset_get_index("spr_" + _spr_name + "_damaged");
	var _dead = asset_get_index("spr_" + _spr_name + "_dead");
	
	/// @param {Real} _sprite
	function idle_if_not_exists(_sprite) {
		if(_sprite == -1) {
			return _idle;
		};
		
		return _sprite;
	};
	
	return {
		idle: _idle,
		fall: idle_if_not_exists(_fall),
		jump: idle_if_not_exists(_jump),
		run: idle_if_not_exists(_run),
		attack: idle_if_not_exists(_attack),
		damaged: idle_if_not_exists(_damaged),
		dead: idle_if_not_exists(_dead),
	};
}