// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_GlobalHotkeyCallback(){
	with (zui_main()) {
		with current_hotkeys {
			zui_destroy()
		}
	current_hotkeys = zui_create(zui_get_width() * 0.5, zui_get_height() - 50, obj_GlobalHotkeys)
	}
}