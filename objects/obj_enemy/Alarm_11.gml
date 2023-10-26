/// @description recovery
event_inherited();

if(!dead && alarm[10] == -1) {
	alarm[10] = in_time(regeneration_interval);
};