//create one tab for general hotkeys and one tab for hotkeys of each race
zui_set_size(600, 100);

with (zui_create(0, 0, objUIWindowCaption)) {
 caption = "Hotkey Categories";
 draggable = 1;
}

with (zui_create(0, 40, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Global";
 callback = scr_GlobalHotkeyCallback;
}

with (zui_create(152, 40, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Terran";
 callback = scr_TerranHotkeyCallback;
}