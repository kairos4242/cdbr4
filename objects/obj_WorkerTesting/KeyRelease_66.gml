//build barracks at mouse position
if ds_list_size(selected_list) > 0
{
	//see if there are any workers in the selected list that can build a rax
	for (i = 0; i < ds_list_size(selected_list); i++)
	{
		//check unit name against names of workers, probably should be changed to a unit_type variable
		//for when there is more than one worker unit
		objectname = object_get_name(ds_list_find_value(selected_list,i).object_index)
		if objectname == "obj_Worker"
		{
			with ds_list_find_value(selected_list,i)
			{
				//build rax
				target_x = mouse_x
				target_y = mouse_y
				building_to_create = obj_Barracks
				state = "CreateBuilding"
				exit;
			}
		}
	}
}