function unit_attack() {
	if !instance_exists(target)
	{
		unit_action_complete()
	}
	if distance_to_object(target) > /*attack.range todo later when attacks are a thing*/ 100
	{
		mp_potential_step(target.x,target.y,move_speed,false)
	}
	else
	{
		if (attacks[0].current_cooldown = 0)
		{
			attacks[0].current_cooldown = attacks[0].cooldown
			perform_attack(attacks[0], target)
		}
	}


}
