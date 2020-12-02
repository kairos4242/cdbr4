// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_terran_hotkeys(){
	if not file_exists("terran_hotkeys.json")
	{
		//switching from ini to json, storing each race's hotkeys as a struct and then writing them to files
		terran_hotkey_struct = {
			key_build_scv: "S",
			key_build_marine: "P",
			key_build_barracks: "B",
			key_build_marauder: "J"
		}
		var terran_string = json_stringify(terran_hotkey_struct)
		var terran_file = file_text_open_write("terran_hotkeys.json")
		file_text_write_string(terran_file, terran_string)
		file_text_close(terran_file)
	}
	
	var terran_file = file_text_open_read("terran_hotkeys.json")
	var terran_string = file_text_read_string(terran_file)
	return json_parse(terran_string)
}

