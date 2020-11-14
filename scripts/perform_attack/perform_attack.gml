///perform_attack(attack,target)
function perform_attack(attack, target) {

	if attack.type = "Projectile"
	{
		projectile = instance_create_depth(x,y,100,attack.projectile)
		with projectile
		{
			target = other.target	
		}
	}
	else
	{
		deal_damage(target,attack.damage,attack.splash,attack.cc,attack.attacks)
	}


}
