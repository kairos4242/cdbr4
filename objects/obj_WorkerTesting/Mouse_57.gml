if ds_list_size(selected_list) == 0 exit
//split into units and buildings, move/gather units and rally buildings
split_array = split_selected(selected_list)
selected_units = split_array[0]
selected_buildings = split_array[1]

//Unit stuff

//check for collision with units
if collision_point(mouse_x,mouse_y,obj_Unit,false,true)
{
	if unit.controller == player.controller
	{
		//friendly, follow
	}
	else
	{
		//foe, attack
	}
}
//todo: check buildings + neutral stuff like rocks

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
				state = "Gather"
				resource_target = collision_point(mouse_x,mouse_y,obj_Mineral,false,false)
			}
		}
		else
		{
			with ds_list_find_value(selected_units,i)
			{
				//move towards minerals
				target_x = mouse_x
				target_y = mouse_y
				state = "Move"
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
			state = "Move"
			target_x = mouse_x
			target_y = mouse_y
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