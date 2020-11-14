function resource_nearest_unoccupied(argument0) {
	resource_list = ds_list_create()
	collision_rectangle_list(x - 200, y - 200, x + 200, y + 200, argument0,false,true,resource_list,true)
	for (i = 0;i < ds_list_size(resource_list); i++)
	{
			if ds_list_find_value(resource_list,i).occupied = false
			{
				return ds_list_find_value(resource_list,i)
			}
	}
	//if can't find any unoccupied resource, return -1
	return -1


}
