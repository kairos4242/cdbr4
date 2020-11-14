//update ui
with (name_label)
{
	if ds_list_size(other.selected_list) == 0
	{
		caption = "Nothing selected";
	}
	else
	{
		caption = "";
		for (i = 0; i < ds_list_size(other.selected_list);i++)
		{
			caption += ("," + ds_list_find_value(other.selected_list,i).name);
		}
		caption = string_delete(caption,1,1);
	}
}

with (minerals)
{
	caption = other.player1.resources[0]
}

//check for update camera position
if display_mouse_get_x() == display_get_width() - 1
{
	//move cam right
	camera_set_view_pos(main_camera, camera_get_view_x(main_camera) + camera_speed, camera_get_view_y(main_camera))
}
if display_mouse_get_x() == 0
{
	//move cam left
	camera_set_view_pos(main_camera, camera_get_view_x(main_camera) - camera_speed, camera_get_view_y(main_camera))
}
if display_mouse_get_y() == display_get_height() - 1
{
	//move cam up
	camera_set_view_pos(main_camera, camera_get_view_x(main_camera), camera_get_view_y(main_camera) + camera_speed)
}
if display_mouse_get_y() == 0
{
	//move cam down
	camera_set_view_pos(main_camera, camera_get_view_x(main_camera), camera_get_view_y(main_camera) - camera_speed)
}


//Hotkey checks
//not sure whether to do this with separate scripts like key_build_scv_pressed()
//or to just put them straight inside the if statement
//as of right now going to go with putting code inside if statements
if keyboard_check_released(hotkeys[? "key_build_scv"])
{
	building_build(obj_Worker, "obj_CommandCentre")
}
if keyboard_check_released(hotkeys[? "key_build_marine"])
{
	building_build(obj_Marine, "obj_Barracks")
}
if keyboard_check_released(hotkeys[? "key_controlgroup_1"])
{
	if keyboard_check(vk_control)
	{
		//add units to control group 1 if not already inside
		for (i = 0; i < ds_list_size(selected_list); i++)
		{
			unit_to_add = ds_list_find_value(selected_list, i)
			if (ds_list_find_index(control_group_1, unit_to_add) == -1)
			{
				//add unit
				ds_list_insert(control_group_1, 0, unit_to_add)
			}
		}
	
	}
	else if keyboard_check(vk_shift)
	{
		//replace control group with current selection
		ds_list_copy(control_group_1, selected_list)
	}
	else
	{
		//deselect all current units
		for (i = 0; i < ds_list_size(selected_list); i++)
		{
			with ds_list_find_value(selected_list, i)
			{
				selected = false
			}
		}
		//select control group units
		ds_list_copy(selected_list, control_group_1)
		for (i = 0; i < ds_list_size(selected_list); i++)
		{
			with ds_list_find_value(selected_list, i)
			{
				selected = true
			}
		}
	}
}
if keyboard_check_released(hotkeys[? "key_build_barracks"])
{
	unit_build_command(obj_Barracks, "obj_Worker")
}
if keyboard_check_released(hotkeys[? "key_attack_move"])
{
	//split array into units and buildings, only attack move with units
	split_array = split_selected(selected_list)
	selected_units = split_array[0]

	for (i = 0; i < ds_list_size(selected_units); i++)
	{
		with (ds_list_find_value(selected_units, i))
		{
			unit_queue_action("AttackMove", -1, mouse_x, mouse_y, keyboard_check_direct(vk_shift))
		}
	}
}