function unit_move() {
	if (target_x != x and target_y != y)
	{
		//check state to see if worker and should be ignoring collision
		if state == "Gather" or state == "Return"
		{
				x += lengthdir_x(move_speed,point_direction(x,y,target_x,target_y))
				y += lengthdir_y(move_speed,point_direction(x,y,target_x,target_y))
		}
		else
		{
			mp_potential_step(target_x,target_y,move_speed,false)
		}
	}
	else
	{
		if (state == "Move") or (state == "AttackMove")
		{
			unit_action_complete()
		}
	}


}
