// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_key(key_to_load){
	//simple function to convert strings to keys
	if is_string(key_to_load)
	{
		if string_length(key_to_load) == 1
		{
			//we have a single letter, return ord of that letter
			return ord(key_to_load)
		}
		else
		{
			switch key_to_load
			{
				//this is ridiculously hacky but shouldn't cause performance issues
				//and I'm not sure there's a more elegant way to do it
				default: break;
				case "vk_alt": return vk_alt
				case "vk_control": return vk_control
				case "vk_shift": return vk_shift
				case "vk_enter": return vk_enter
				case "vk_backspace": return vk_backspace
			}
		}
	}
}