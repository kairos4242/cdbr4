//drag select is todo, just doing point select for now

//find out what's getting selected
to_select = instance_position(mouse_x,mouse_y,obj_Unit)

//actually select it
if to_select != noone
{
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
	ds_list_add(selected_list,to_select)
	with to_select
	{
		selected = true
	}
	
}
else
{
	//not selecting a unit so test for selecting a building
	to_select = instance_position(mouse_x,mouse_y,obj_Building)
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
	ds_list_add(selected_list,to_select)
	with to_select
	{
		selected = true
	}
}