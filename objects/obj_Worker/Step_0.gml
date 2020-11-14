/// @description Insert description here
// You can write your code in this editor
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
	case "Gather": unit_gather()
	break;
	case "Return": unit_return()
	break;
	case "CreateBuilding": unit_create_building()
	break;
	case "Build": unit_build()
	break;
}