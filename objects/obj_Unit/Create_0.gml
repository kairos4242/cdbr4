/// @description Initialization for all ships

target_x = x
target_y = y
target = -1
selected = false
state = "Idle"
move_speed = 4
controller = 0
sight_range = 1000

armor = 0
hp = 40
max_hp = 40
attacks[0] = instance_create(0,0,obj_FusionCutters)

type = "Unit"
unit_type = "Fighter"

command_queue = ds_queue_create()