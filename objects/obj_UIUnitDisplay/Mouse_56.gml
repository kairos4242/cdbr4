/// @description Insert description here
//Handle selecting units from wireframes
//Note that right now this only works for a single row of units, needs to take ypos into account

show_debug_message("Left Released!")
if (ds_list_size(game_controller.selected_list) > 1)
{
	//more than one unit selected, so check if in bounds
	display_grid_x = floor((mouse_x - display_x - camera_get_view_x(main_camera) - (1.42 * left_bound)) / (1.42 * padding))
	display_grid_y = floor((mouse_y - display_y - camera_get_view_y(main_camera) - (1.7 * upper_bound)) / (1.6 * padding))
	if ((display_grid_x >= 0) and (display_grid_x + 1 <= ds_list_size(game_controller.selected_list)) and (display_grid_y >= 0) and (display_grid_y <= floor(ds_list_size(game_controller.selected_list) / 8)))
	{
		//we are overtop a unit, if shift is held deselect it otherwise select only it
		if (keyboard_check(vk_shift))
		{
			//deselect said unit, right now x starts counting from 0 and y from 1 but bear with me
			with ds_list_find_value(game_controller.selected_list, max(1, (units_per_row * display_grid_y) + (display_grid_x)))
			{
				selected = false
			}
			ds_list_delete(game_controller.selected_list, max(1, (units_per_row * display_grid_y) + (display_grid_x)))
		}
	}
}