if ds_list_size(selected_list) == 0 exit
//split into units and buildings, move/gather units and rally buildings
split_array = split_selected(selected_list)
selected_units = split_array[0]
selected_buildings = split_array[1]

//Unit stuff

//check for collision with units
if collision_point(mouse_x,mouse_y,obj_Unit,false,true)
{
	var unit_target = collision_point(mouse_x,mouse_y,obj_Unit,false,true)
	if unit_target.controller == player1
	{
		//friendly, follow
		for (i = 0; i < ds_list_size(selected_units); i++)
		{
			with ds_list_find_value(selected_units, i)
			{
				unit_queue_action("MoveTarget", unit_target, -1, -1, keyboard_check(vk_shift))
			}
		}
	}
	else
	{
		//foe, attack
		for (i = 0; i < ds_list_size(selected_units); i++)
		{
			with ds_list_find_value(selected_units, i)
			{
				unit_queue_action("Attack", unit_target, -1, -1, keyboard_check(vk_shift))
			}
		}
	}
}
//todo: check neutral stuff like rocks
else if collision_point(mouse_x, mouse_y, obj_Building, false, false)
{
	//Check for resume construction
	var building_target = collision_point(mouse_x, mouse_y, obj_Building, false, false)
	//check for friendly
	if building_target.controller == player1
	{
		//check if building complete
		if building_target.build_time_remaining == 0
		{
			//building complete, so move to it
			for (i = 0; i < ds_list_size(selected_units); i++)
			{
				with ds_list_find_value(selected_units, i)
				{
					unit_queue_action("MoveTarget", building_target, building_target.x, building_target.y, keyboard_check(vk_shift))
				}
			}
		}
		else
		{
			for (i = 0; i < ds_list_size(selected_units); i++)
			{
				if ds_list_find_value(selected_units, i).unit_type == "Worker"
				{
					with ds_list_find_value(selected_units, i)
					{
						//construct the building
						unit_queue_action("Build", -1, building_target.x, building_target.y, keyboard_check(vk_shift))
					}
				}
				else
				{
					with ds_list_find_value(selected_units, i)
					{
						//move towards building
						unit_queue_action("MoveTarget", building_target, building_target.x, building_target.y, keyboard_check(vk_shift))
					}
				}
			}
		}
	}
	else
	{
		//attack building
		for (i = 0; i < ds_list_size(selected_units); i++)
		{
			with (ds_list_find_value(selected_units, i))
			{
				unit_queue_action("Attack", building_target, -1, -1, keyboard_check(vk_shift))
			}
		}
	}
}
//mineral should be changed to obj_Resource once you create a parent for all resources
else if collision_point(mouse_x,mouse_y,obj_Mineral,false,false)
{
	//move/gather units
	for (i = 0;i < ds_list_size(selected_units); i++)
	{
		//if worker, gather, if not, move toward minerals
		if ds_list_find_value(selected_units,i).unit_type == "Worker"
		{
			with ds_list_find_value(selected_units,i)
			{
				resource_target = collision_point(mouse_x,mouse_y,obj_Mineral,false,false)
				unit_queue_action("Gather", -1, -1, -1, keyboard_check(vk_shift))
				state = "Gather"
			}
		}
		else
		{
			with ds_list_find_value(selected_units,i)
			{
				//move towards minerals
				unit_queue_action("Move", -1, mouse_x, mouse_y, keyboard_check(vk_shift))
			}
		}
	}
}
//if not clicked on any minerals or anything, just move
else if ds_list_size(selected_units) != 0
{
	for (i = 0;i < ds_list_size(selected_units); i++)
	{
		with ds_list_find_value(selected_units,i)
		{
			unit_queue_action("Move", -1, mouse_x, mouse_y, keyboard_check(vk_shift))
		}
	}
}

//Building stuff


if ds_list_size(selected_buildings) != 0
{
	//if clicked on minerals, rally to minerals
	if collision_point(mouse_x,mouse_y,obj_Mineral,false,false)
	{
		for (i = 0;i < ds_list_size(selected_buildings); i++)
		{
			with ds_list_find_value(selected_buildings,i)
			{
				if rally = true
				{
					rally_type = "GatherRally"
					rally_target = instance_position(mouse_x,mouse_y,obj_Mineral)
					rally_x = mouse_x
					rally_y = mouse_y
				}
			}
		}
	}
	//else, just rally to a point
	else
	{
		for (i = 0;i < ds_list_size(selected_buildings); i++)
		{
			with ds_list_find_value(selected_buildings,i)
			{
				if rally = true
				{
					rally_type = "MoveRally"
					rally_x = mouse_x
					rally_y = mouse_y
				}
			}
		}
	}
}