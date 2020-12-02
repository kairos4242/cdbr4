///check_key(hotkey)
function check_key(key_to_check){
	//Note that the syntax here needs to be check_key(hotkey_struct.key)
	if is_string(key_to_check)
	{
		if (string_lettersdigits(key_to_check) == key_to_check)
		{
			//we have a single letter, return ord of that letter
			return ord(key_to_check)
		}
		else
		{
			switch key_to_check
			{
				//this is ridiculously hacky but shouldn't cause performance issues
				//and I'm not sure there's a more elegant way to do it
				//if letters are encoded instead of numbers, it means that hotkeys are human-editable
				//right from file
				//220 is forwardslash, not encoded right now
				//noting that just in case it ever causes issues in future
				case "vk_alt": return vk_alt
				case "vk_control": return vk_control
				case "vk_shift": return vk_shift
				case "vk_enter": return vk_enter
				case "vk_backspace": return vk_backspace
				case ";": return 186
				case "=": return 187
				case ",": return 188
				case "-": return 189
				case ".": return 190
				case "/": return 191
				case "`": return 192
				case "[": return 219
				case "]": return 221
				case "'": return 222
				default: break;
			}
		}
	}
}