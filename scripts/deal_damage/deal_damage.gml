///deal_damage(target,damage,splash_damage,attack_cc,number_attacks)
function deal_damage(target, damage, splash_damage, attack_cc, attacks) {
	//placeholder = argument0 + argument1 + argument3//bc gonna use these later
	for (i = 0;i < attacks;i++)
	{
		//we'll deal with splash and cc and divine shield and everything else later, for now just want this up and running
	
		adjusted_damage = damage - target.armor
		target.hp -= adjusted_damage
		if target.hp <= 0
		{
			instance_destroy(target)
			exit
		}
	}


}
