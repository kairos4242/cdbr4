//if building something, work on it
if object_to_build != -1
{
	build_progress++
	if build_progress == get_build_time(object_to_build)
	{
		//having it in a switch statement for now is hacky but we're rolling with it
		//build the object
		build_progress = 0
		object = instance_create_depth(x,bbox_bottom,0,object_to_build)
		with object
		{
			y += sprite_height / 2
			controller = other.controller
			if type == "Technology"
			{
				ds_list_add(controller.tech_list,name)	
			}
			//do rally
			if type == "Unit"
			{
				//check if building has rally and if so set unit state to move and coords to rally coords
				if (other.rally == true)
				{
					state = "Move"
					target_x = other.rally_x
					target_y = other.rally_y
				}
			}
		}
		//check if more stuff in queue
		if ds_queue_size(production_queue) == 0
		{
			object_to_build = -1
			state = "Idle"
		}
		else
		{
			//build the next thing in the queue
			object_to_build = ds_queue_dequeue(production_queue)
		}
	}
}