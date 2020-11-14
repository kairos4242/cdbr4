function unit_gather() {
	//Gather script for workers, resource_held = resource to gather
	//two possible approaches to architecture, either find nearest friendly town hall from list of all friendly town halls, or list of all town halls
	//when script is called, always set resource target to -1 first
	if resource_count != 0
	{
		state = "Return"
		unit_return()
	}
	else if resource_target == -1
	{
		resource_check = resource_nearest_unoccupied(obj_Mineral)//this should be changed once there are multiple resources
		if resource_check == -1
		{
			//if no other patches open, wait for existing one to open up
		}
		else
		{
			resource_target = resource_check	
		}
	}
	else
	{
		if distance_to_object(resource_target) < 5
		{
			if resource_target.occupied != id && resource_target.occupied != 0
			{
				//whoops, somebody took this one, time to find a new patch
				resource_target = -1
				exit;
			}
			//mine resource, resource mine time is countdown to resource yield
			resource_target.occupied = id
			resource_target.mine_time--
			if resource_target.mine_time <= 0
			{
				//take away resources
				var takeaway = (resource_target.yield * resource_multiplier)
				resource_target.count -= takeaway
				resource_count += takeaway
				resource_held = resource_target.type
				resource_target.occupied = false
				if resource_target.count <= 0
				{
					instance_destroy(resource_target)
					resource_target = -1
				}
				else
				{
					//reset mine time so another worker can use
					resource_target.mine_time = resource_target.mine_time_default
				}
			}
		}
		else
		{
			//move towards resource
			target_x = resource_target.x
			target_y = resource_target.y
			unit_move()
		}
	}


}
