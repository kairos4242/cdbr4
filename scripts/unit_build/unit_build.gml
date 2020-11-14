function unit_build() {
	//build_target is the building to work on
	if distance_to_object(build_target) > 5
	{
		//too far away, move towards building so construction can continue
		target_x = build_target.x
		target_y = build_target.y
		unit_move()
	}
	else
	{
		with build_target
		{
			//build the building
			hp += (max_hp / build_time)
			build_time_remaining--
			if build_time_remaining == 0
			{
				//construction is done!	
				state = "Idle"
				with other
				{
					unit_action_complete()
				}
			}
		}
	}


}
