/// @function building_build(thing_to_build, target_building)
/// @param {index} thing_to_build the object_index of the object or tech to build/research
/// @param {string} target_building the string name of the building type that can build this thing

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function building_build(thing_to_build, target_building){
	//this function is meant to replace the old system of having ProductionTesting copy paste the same code again and again
	//it should hopefully allow for easy hotkeys and cleaner code
	
	if ds_list_size(selected_list) > 0
	{
		//see if there are any CCs in the selected list that can build a worker
		for (i = 0; i < ds_list_size(selected_list); i++)
		{
			//check unit name against name of thing to build
			objectname = object_get_name(ds_list_find_value(selected_list,i).object_index)
			if objectname == target_building
			{
				with ds_list_find_value(selected_list,i)
				{
					//if building is idle, build unit
					if state == "Idle"
					{
						//if controller does not have enough resources throw an error
						if controller.resources[0] < 50
						{
							show_debug_message("Error! Not enough resources!")
							exit;
						}
						object_to_build = thing_to_build
						state = "TrainUnit"
						controller.resources[0] -= 50//50 is temp, eventually will be cost of unit
					}
					else
					{
						//add to queue
						ds_queue_enqueue(production_queue, thing_to_build)
					}
					exit;//what this exit does here is ensure each building_build only builds one unit from one building
					//instead of one unit from every building
				}
			}
		}
	}
}