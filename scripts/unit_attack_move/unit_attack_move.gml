function unit_attack_move() {
	//Seek enemies

	enemies = ds_list_create()
	enemies_found = collision_rectangle_list(x - sight_range,y - sight_range, x + sight_range, y + sight_range,obj_Unit,false,true,enemies,true)
	if enemies_found > 0
	{
		found = false
		i = 0
		while (found == false) and (i < ds_list_size(enemies))
		{
			obj = ds_list_find_value(enemies,i)
			if obj.controller != controller
			{
				found = true
			}
			else
			{
				i++
			}
		}
		if found == true
		{
			//enemy in range
			target = obj
			unit_attack()
			exit;
		}
		
	}
	//next, check for buildings
	ds_list_clear(enemies)
	enemies_found = collision_rectangle_list(x - sight_range,y - sight_range, x + sight_range, y + sight_range,obj_Building,false,true,enemies,true)
	if enemies_found > 0
	{
		found = false
		i = 0
		while (found == false) and (i < ds_list_size(enemies))
		{
			obj = ds_list_find_value(enemies,i)
			if obj.controller != controller
			{
				found = true
			}
			else
			{
				i++
			}
		}
		if found == true
		{
			//enemy in range
			target = obj
			unit_attack()
			exit;
		}
		else
		{
			//only friendlies in sight, so move
			unit_move()
			exit;
		}
		
	}
	//If no enemy units in range, move towards target
	else
	{
		unit_move()
	}



}
