// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

audio_falloff_set_model(audio_falloff_exponent_distance_clamped);
audio_listener_orientation(0,1,0,0,0,1);

///// @param _sound
//function play_sound(_sound, _emitter){
//	audio_emitter_position(_emitter, x, y, 0);
//	audio_play_sound_on(_emitter, _sound, false, 1);
//};