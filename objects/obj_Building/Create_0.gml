selected = false
//rally is the variable for whether the building has a rally point or no
rally = false
rally_type = -1
rally_x = x
rally_y = y
rally_target = -1

//building units/upgrading
build_progress = 0
object_to_build = -1
production_queue = ds_queue_create()

//control
controller = -1
type = "Building"
state = "Idle"

//Physical stats
armor = 0
hp = 1000
max_hp = 1000

//construction defaults
build_time = 100
build_time_remaining = 0