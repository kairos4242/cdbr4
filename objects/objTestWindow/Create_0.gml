zui_set_size(400, 216);
 
with (zui_create(0, 0, objUIWindowCaption)) {
 caption = "Altatrax 2";
 draggable = 1;
}

with (zui_create(12, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Campaign";
 callback = scr_PlayCallback;
 
}

with (zui_create(140, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Custom Game";
 callback = scr_PlayCallback;
}

with (zui_create(268, 38, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(120, 32);
 caption = "Settings";
 callback = scr_SettingsCallback;
}

with (zui_create(12, 82, objUIButton)) {
 zui_set_anchor(0, 0);
 zui_set_size(376, 80);
 caption = "Play!";
 callback = scr_PlayCallback;
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

