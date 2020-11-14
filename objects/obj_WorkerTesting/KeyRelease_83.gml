//build worker if CC selected
if ds_list_size(selected_list) > 0
{
	//see if there are any workers in the selected list that can build a rax
	for (i = 0; i < ds_list_size(selected_list); i++)
	{
		//check unit name against names of cc's, when we do build queue this will be changed to CC with least tasks
		objectname = object_get_name(ds_list_find_value(selected_list,i).object_index)
		if objectname == "obj_CommandCentre"
		{
			with ds_list_find_value(selected_list,i)
			{
				//build unit, in future will be add unit to build queue
				unit_to_create = obj_Worker
				state = "TrainUnit"
				exit;
			}
		}
	}
}