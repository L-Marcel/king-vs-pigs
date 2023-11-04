sound_emitter = audio_emitter_create();

/// @param _sound
function play_sound(_sound, _just_one = false, _gain = 1, _start = 0){
	if(audio_is_playing(_sound) && _just_one) {
		return;
	};
	
	audio_emitter_position(sound_emitter, x, y, 0);
	audio_play_sound_on(sound_emitter, _sound, false, 1, is_player? _gain*.35:_gain*.5, _start);
};