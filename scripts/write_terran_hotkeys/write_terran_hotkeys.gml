// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function write_terran_hotkeys(hotkey_struct){
	//writes terran hotkeys to hotkey file
	//maybe this doesn't need to be a separate function from global
	//maybe instead we can just add an argument for which hotkey file to modify
	//but that's an optimization for another day
	var terran_string = json_stringify(hotkey_struct)
	var terran_file = file_text_open_write("terran_hotkeys.json")
	file_text_write_string(terran_file, terran_string)
	file_text_close(terran_file)
}