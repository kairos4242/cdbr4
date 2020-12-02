// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function write_global_hotkeys(){
	//see terran file for docs
	var global_string = json_stringify(hotkey_struct)
	var global_file = file_text_open_write("global_hotkeys.json")
	file_text_write_string(global_file, global_string)
	file_text_close(global_file)
}