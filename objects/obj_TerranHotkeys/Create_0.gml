/// @description Insert description here
// You can write your code in this editor
zui_set_size(400, 216);
 
with (zui_create(0, 0, objUIWindowCaption)) {
 caption = "Terran Hotkeys";
 draggable = 1;
}

with (zui_create(12, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Build SCV";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_build_scv"
 hotkey_type = "Terran"
 
}

with (zui_create(140, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Build Marine";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_build_marine";
 hotkey_type = "Terran"
}

with (zui_create(268, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Build Barracks";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_build_barracks";
 hotkey_type = "Terran"
}

with (zui_create(12, 82, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Build Reaper";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_build_reaper";
 hotkey_type = "Terran"
}

with (zui_create(140, 82, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Reaper D8 Charge";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_reaper_d8_charge";
 hotkey_type = "Terran"
}

with (zui_create(268, 82, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Build Factory";
 callback = scr_ChangeHotkeyCallback;
 hotkey = "key_build_factory";
 hotkey_type = "Terran"
}

with (zui_create(12, 170, objUICheckbox)) {
 zui_set_anchor(0, 0);
}

with (zui_create(36, 170, objUICheckbox)) {
 zui_set_anchor(0, 0);
 value = 1;
}

with (zui_create(60, 170, objUISlider)) {
 zui_set_anchor(0, 0);
 zui_set_width(128);
 minimum = 4;
 maximum = 8;
 value = 6;
}

with (zui_create(196, 170, objUISlider)) {
 zui_set_anchor(0, 0);
 zui_set_width(192);
 minimum = 0;
 maximum = 100;
 value = 80;
}

with (zui_create(zui_get_width() * 0.5, zui_get_height() - 16, objUILabel)) {
 other.position_label = id;
}

