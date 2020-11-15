//load existing hotkeys
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

//setup room UI
with(zui_main()) {
	zui_destroy()//get rid of UI elements from previous room
}
with (zui_main()) {
 var window_id;
  //Terran Hotkeys
  current_hotkeys = zui_create(zui_get_width() * 0.5, zui_get_height() - 50, obj_TerranHotkeys)
  //idea here is to have tabs on the top left(corner doesnt matter) that control which hotkey group/race is currently being displayed
  //when each is pressed, the main zui window is destroyed and replaced by the one the button controls
  hotkey_tabs = zui_create(300, 64, obj_HotkeyTabs)
  exit_button = zui_create(zui_get_width() - 100, 48, objUIButton)
  with (exit_button)
  {
	  zui_set_size(100, 32)
	  callback = scr_GotoMainMenuCallback
	  caption = "Exit"
  }
}