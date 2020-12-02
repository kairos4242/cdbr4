// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_global_hotkeys(){
	//loads global hotkeys from file
	if not file_exists("global_hotkeys.json")
	{
		global_hotkey_struct = {
			key_controlgroup_1: "O",
			key_attack_move: "A"
		}
		var global_string = json_stringify(global_hotkey_struct)
		var global_file = file_text_open_write("global_hotkeys.json")
		file_text_write_string(global_file, global_string)
		file_text_close(global_file)
	
	}
	//load hotkeys from jsons
	var global_file = file_text_open_read("global_hotkeys.json")
	var global_string = file_text_read_string(global_file)
	return json_parse(global_string)
}

