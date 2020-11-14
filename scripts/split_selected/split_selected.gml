function split_selected(argument0) {
	//splits selected list into list of buildings and list of units, returns both as an array
	//argument0 is the list to sort
	list_to_sort = ds_list_create()
	ds_list_copy(list_to_sort,argument0)
	var list_buildings = ds_list_create()
	var list_units = ds_list_create()
	for (i = 0; i < ds_list_size(list_to_sort); i++)
	{
		var current = ds_list_find_value(list_to_sort,i)
		show_debug_message(object_get_name(object_get_parent(current.object_index)))
		show_debug_message(object_get_parent(current.object_index))
		if object_get_name(object_get_parent(current.object_index)) == "obj_Unit"
		{
			//its a unit, add it to the units list
			ds_list_add(list_units,current)
		
		}
		else if object_get_name(object_get_parent(current.object_index)) == "obj_Building"
		{
			ds_list_add(list_buildings,current)	
		}
		//if anything fits into neither category then it won't show up on the sorted list
		//can't see this causing issues but something to keep in mind just in case
	}
	return_array[0] = list_units
	return_array[1] = list_buildings
	return return_array


}
