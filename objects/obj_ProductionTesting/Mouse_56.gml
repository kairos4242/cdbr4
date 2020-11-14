//doing drag select now, how exciting!

//find out what's getting selected
to_select = collision_rectangle_list(min(box_x, mouse_x), min(box_y, mouse_y), max(box_x, mouse_x), max(box_y, mouse_y), obj_Unit, false, true, collision_list, false)
var already_deselected = 0//variable to check whether to deselect all previous

//actually select it
if to_select > 0
{
	already_deselected = 1
	//if shift not held_deselect all previous
	if not (keyboard_check_direct(vk_lshift) or keyboard_check_direct(vk_rshift))
	{
		for (i = 0;i < ds_list_size(selected_list); i++)
		{
			with ds_list_find_value(selected_list,i)
			{
				selected = false
			}
		}
		ds_list_clear(selected_list)
	}
	for (i = 0; i < ds_list_size(collision_list); i++)
	{
		current_select = ds_list_find_value(collision_list, i)
		//iterate through and add each to selection
		if current_select.selected = true
		{
			//already selected, if list size greater than 1, deselect
			if ds_list_size(selected_list) > 1
			{
				ds_list_delete(selected_list, ds_list_find_index(selected_list, current_select))
				with current_select selected = false
			}
		}
		else if (current_select.controller = player1) and (current_select.selected = false)
		{
			ds_list_add(selected_list,current_select)
			with current_select
			{
				selected = true
			}
		}
	}
	ds_list_clear(collision_list)
	
}
//now done checking for units, so check for buildings
to_select = collision_rectangle_list(min(box_x, mouse_x), min(box_y, mouse_y), max(box_x, mouse_x), max(box_y, mouse_y), obj_Building, false, true, collision_list, false)

if to_select > 0
{	
	//if shift not held_deselect all previous
	if (not (keyboard_check_direct(vk_lshift) or keyboard_check_direct(vk_rshift))) and (not already_deselected)
	{
		for (i = 0;i < ds_list_size(selected_list); i++)
		{
			with ds_list_find_value(selected_list,i)
			{
				selected = false
			}
		}
		ds_list_clear(selected_list)
	}
	//add all selected buildings to selection list
	for (i = 0; i < ds_list_size(collision_list); i++)
	{
		current_select = ds_list_find_value(collision_list, i)
		if current_select.selected = true
		{
			//already selected, if list size greater than 1, deselect
			
			if ds_list_size(selected_list) > 1
			{
				ds_list_delete(selected_list, ds_list_find_index(selected_list, current_select))
				with current_select selected = false
			}
		}
		else if (current_select.controller = player1) and (current_select.selected = false)
		{
			ds_list_add(selected_list,current_select)
			with current_select
			{
				selected = true
			}
		}
	}
	ds_list_clear(collision_list)
}