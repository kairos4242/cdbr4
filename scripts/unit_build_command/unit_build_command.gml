// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unit_build_command(building_to_build, target_unit){
	//similar to building_build but for units constructing buildings
	//see building_build documentation until I do documentation for this script
	if ds_list_size(selected_list) > 0
	{
		//see if there are any workers in the selected list that can build a rax
		for (i = 0; i < ds_list_size(selected_list); i++)
		{
			//check unit name against names of workers, probably should be changed to a unit_type variable
			//for when there is more than one worker unit
			objectname = object_get_name(ds_list_find_value(selected_list,i).object_index)
			if objectname == target_unit
			{
				with ds_list_find_value(selected_list,i)
				{
					//check mineral count, if insufficient then cancel
					if controller.resources[0] < 150//placeholder for cost of building
					{
						show_debug_message("Error! Not Enough Resources!")
						unit_action_complete()
						exit;
					}
					
					//build building
					controller.resources[0] -= 150
					unit_queue_action("CreateBuilding", building_to_build, mouse_x, mouse_y, keyboard_check(vk_shift))
					exit;
				}
			}
		}
	}
}