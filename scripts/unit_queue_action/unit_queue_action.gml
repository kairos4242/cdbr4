// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unit_queue_action(arg_state, arg_target, arg_target_x, arg_target_y, shift_held){
	if (shift_held) {
		if (state == "Idle")
		{
			state = arg_state
			if state == "CreateBuilding" building_to_create = arg_target else target = arg_target
			target_x = arg_target_x
			target_y = arg_target_y
		}
		else
		{
			//unit is busy right now, so add the action to the queue
			ds_queue_enqueue(command_queue, [arg_state, arg_target, arg_target_x, arg_target_y])
		}
	}
	else
	{
		ds_queue_clear(command_queue)
		state = arg_state
		if state == "CreateBuilding" building_to_create = arg_target else target = arg_target
		target_x = arg_target_x
		target_y = arg_target_y
	}
	
}