function unit_move_target() {
	if !place_meeting(x,y,target)
	{
			mp_potential_step(target.x,target.y,move_speed,false)
	}


}
