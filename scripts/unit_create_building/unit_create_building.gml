function unit_create_building() {
	//actually throwing down a barracks/depot/whatever instead of just working on an existing one
	//target_x,target_y is the location for the building
	//building_to_create is the object index of the building to make

	mask = object_get_sprite(building_to_create)
	ydist = sprite_get_height(mask) / 2
	xdist = sprite_get_width(mask) / 2
	if collision_rectangle(target_x - xdist,target_y - ydist,target_x + xdist,target_y + ydist,obj_Worker,false,false) != id
	{
			unit_move()
	}
	else
	{
		//check to see if building can be legally placed
		show_debug_message(collision_rectangle(target_x - xdist,target_y - ydist,target_x + xdist,target_y + ydist,obj_Building,false,false))
		if (collision_rectangle(target_x - xdist,target_y - ydist,target_x + xdist,target_y + ydist,obj_Building,false,false) == noone) and (collision_rectangle(target_x - xdist,target_y - ydist,target_x + xdist,target_y + ydist,obj_Unit,false,true) == noone)
		{
			//building can be legally placed, start construction
			var building = instance_create_layer(target_x,target_y,"Instances",building_to_create)
			with building
			{
				state = "Construction"
				controller = other.controller
				hp += (max_hp / build_time)
				build_time_remaining--
			}
			state = "Build"
			build_target = building
		}
		else
		{
			unit_action_complete()
			show_debug_message("Error! Building cannot be legally placed there.")
		}
	}


}
