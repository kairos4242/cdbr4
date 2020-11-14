//roll for spawn positions
spawn_positions = [[1368, 912], [4104,912]]
spawn_roll = irandom(1)
player_spawn = spawn_positions[spawn_roll]
opponent_spawn = spawn_positions[not spawn_roll]

//create player, town hall, six workers
player1 = instance_create_depth(0,0,0,obj_Player)
main1 = instance_create_layer(player_spawn[0], player_spawn[1], "Instances", obj_CommandCentre)
with main1
{
	controller = other.player1
}
ds_list_add(player1.town_halls, main1)
for (i = 0; i < 6; i++)
{
	with (instance_create_layer(player_spawn[0] - (72 - 24 * i), player_spawn[1] + 200, "Instances", obj_Worker))
	{
		controller = other.player1
	}
}

//create opponent, opponent town hall, six workers
player2 = instance_create_depth(0, 0, 0, obj_AIPlayer)
main2 = instance_create_layer(opponent_spawn[0], opponent_spawn[1], "Instances", obj_CommandCentre)
with main2
{
	controller = other.player2
}
ds_list_add(player2.town_halls, main2)
for (i = 0; i < 6; i++)
{
	with (instance_create_layer(opponent_spawn[0] - (72 - 24 * i), opponent_spawn[1] + 200, "Instances", obj_Worker))
	{
		controller = other.player1
	}
}

selected_list = ds_list_create()
collision_list = ds_list_create()
//units selected

//for drag select
select_held = false//will be true when mouse held down to drag select


//ZUI stuff
with(zui_main()) {
	zui_destroy()//get rid of UI elements from previous room
}
with (zui_main()) {
 var window_id;
 name_label = zui_create(zui_get_width() * 0.5, zui_get_height() - 50, objUILabel)
 other.name_label = name_label;
 with (name_label) {
  caption = "Scale";
  color = $ffffff;
 }
  minerals = zui_create(zui_get_width() * 0.5, 50, objUILabel)
  other.minerals = minerals
  with (minerals) {
	  caption = "Scale";
	  color = $ffffff;
  }
}

//Non-ZUI UI Stuff
unit_display = instance_create_layer(0, 0, "Instances", obj_UIUnitDisplay)
with (unit_display)
{
	game_controller = other
}
//create camera centred on main
main_camera = camera_create_view(main1.x - (display_get_width() / 2), main1.y - (display_get_height() / 2), 2736, 1824)
view_camera[0] = main_camera
camera_speed = 30//rate at which moving mouse to edge scrolls camera

//Control Groups
control_group_1 = ds_list_create()

//Hotkeys
if not file_exists("game_settings.ini")
{
	//create ini with default hotkeys
	//NOTE: must write to file as capitals, otherwise ord() in load_key() will not work
	ini_open("game_settings.ini")
	ini_write_string("hotkeys", "key_build_scv", "S")
	ini_write_string("hotkeys", "key_build_marine", "P")
	ini_write_string("hotkeys", "key_controlgroup_1", "O")
	ini_write_string("hotkeys", "key_build_barracks", "B")
	ini_write_string("hotkeys", "key_attack_move", "A")
}
//load settings from game_settings.ini
ini_open("game_settings.ini")
hotkeys = ds_map_create()
hotkeys[? "key_build_scv"] = load_key(ini_read_string("hotkeys", "key_build_scv", "S"))
hotkeys[? "key_build_marine"] = load_key(ini_read_string("hotkeys", "key_build_marine", "P"))
hotkeys[? "key_controlgroup_1"] = load_key(ini_read_string("hotkeys", "key_controlgroup_1", "O"))
hotkeys[? "key_build_barracks"] = load_key(ini_read_string("hotkeys", "key_build_barracks", "B"))
hotkeys[? "key_attack_move"] = load_key(ini_read_string("hotkeys", "key_attack_move", "A"))