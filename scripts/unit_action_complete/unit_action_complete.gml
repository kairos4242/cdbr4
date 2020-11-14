// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unit_action_complete(){
	//check if there are other commands in the queue
	if ds_queue_size(command_queue) == 0
	{
		state = "Idle"
		exit;
	}
	else
	{
		//perform the next action in the queue
		state_change = ds_queue_dequeue(command_queue)
		state = state_change[0]
		if state_change[1] != -1 target = state_change[1]
		if state_change[2] != -1 target_x = state_change[2]
		if state_change[3] != -1 target_y = state_change[3]
		if state == "CreateBuilding" building_to_create = state_change[1]
	}
}