/// @description Insert description here
// You can write your code in this editor

//having to write them all out is ugly and hacky, surely there has to be a better way
if (keyboard_check_pressed(vk_anykey))
{
	//set the parent's hotkey and print a message to the console saying you did
	if parent == -1 exit
	ini_open("game_settings.ini")
	keypress = string_upper(keyboard_lastchar)
	show_debug_message(string_upper(keypress))
	if ini_key_exists("hotkeys", parent.hotkey)
	{
		ini_key_delete("hotkeys", parent.hotkey)
	}
	ini_write_string("hotkeys", parent.hotkey, keypress)
	ini_close()
	instance_destroy()
}