/// @description State

switch state
{
	case "Idle": break;
	case "Move": unit_move()
	break;
	case "MoveTarget": unit_move_target()
	break;
	case "Attack": unit_attack()
	break;
	case "AttackMove": unit_attack_move()
	break;
	case "Patrol": unit_patrol()
	break;
}