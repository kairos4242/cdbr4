function unit_return() {
	//other half of gather, gonna use list of friendly town halls for sake of performance

	nearest_friendly = town_hall_nearest_friendly(controller)
	if distance_to_object(nearest_friendly) < 5
	{
		//return resources
		controller.resources[resource_held] += resource_count
		resource_count = 0
		resource_held = -1
		state = "Gather"
	}
	else
	{
		//move towards nearest town hall
		target_x = nearest_friendly.x
		target_y = nearest_friendly.y
		unit_move()
	}


}
