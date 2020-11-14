function town_hall_nearest_friendly(argument0) {
	//finds the nearest friendly town hall, argument0 = controller object

	with argument0
	{
		if ds_list_size(town_halls) == 0 return -1
		else
		{
			var nearest = ds_list_find_value(town_halls,0)
			var nearest_distance = distance_to_object(nearest)
			for (i = 0; i < ds_list_size(town_halls); i++)
			{
				if distance_to_object(ds_list_find_value(town_halls,i)) < nearest_distance
				{
					nearest = ds_list_find_value(town_halls,i)
					nearest_distance = distance_to_object(ds_list_find_value(town_halls,i))
				}
			}
			return nearest
		}
	}


}
