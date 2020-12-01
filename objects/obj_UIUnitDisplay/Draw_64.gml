/// @description Draw unit selection box
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
window_width = window_get_width()
window_height = window_get_height()
left_bound = (window_width / 2) - (500)
right_bound = (window_width / 2) + 500
upper_bound = window_height - 350
lower_bound = window_height
draw_rectangle(left_bound, upper_bound, right_bound, lower_bound, false)
draw_set_color(c_white)
draw_text(64, window_height / 2, display_grid_x)
draw_text(64, window_height / 2 + 64, display_grid_y)


//check if one thing selected and if so display the full shebang about it
if (ds_list_size(game_controller.selected_list) == 1)
{
	selected_unit = ds_list_find_value(game_controller.selected_list, 0)
	//display image
	draw_sprite_stretched(wireframe_head, 0, left_bound + 50, (upper_bound + lower_bound) / 2 - 100, 200, 200)//temp, will be changed to the individual wireframe of the selected unit
	
	//display unit information
	draw_set_halign(fa_right)
	draw_set_font(fnt_Glitch36)
	draw_text(right_bound - 100, upper_bound + 50, selected_unit.name)
	draw_set_font(fnt_Glitch18)
	draw_text(right_bound - 100, upper_bound + 100, selected_unit.type)
	draw_set_halign(fa_center)
	draw_text(left_bound + 150, lower_bound - 50, string(selected_unit.hp) + " / " + string(selected_unit.max_hp))
	draw_set_font(fnt_UI)
	//TODO: add tooltips and images for attack and armor and shield
}

else
{
	//display each unit in boxes like starcraft
	display_x = 50
	display_y = 50
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	for (i = 0; i < ds_list_size(game_controller.selected_list); i++)
	{
		//display unit in box
		selected_unit = ds_list_find_value(game_controller.selected_list, i)
		//draw_text(0, 0, string(display_x + (64 * (i % 8))) + " " + string(display_y + (64 * floor(i / 8))))
		draw_text(left_bound + display_x + (padding * (i % units_per_row)),upper_bound + display_y + (padding * floor(i / units_per_row)), string_char_at(selected_unit.name, 1))
	}
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
}