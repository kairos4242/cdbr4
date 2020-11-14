/// @description Create instance
summon = instance_create_depth(mouse_x,mouse_y,50,asset_get_index(units[units_index]))
with summon
{
	controller = other.controller[other.controller_index]
	state = "AttackMove"
	target_x = room_width / 2
	target_y = room_height / 2
}