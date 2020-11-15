// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ChangeHotkeyCallback(){
	//not sure of the best way to implement this, for now going to go with an event listener object
	event_listener = instance_create(0, 0, obj_HotkeyListener)
	with (event_listener)
	{
		parent = other
	}
}