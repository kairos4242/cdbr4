// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_GotoMainMenuCallback(){
	//we might need to destroy the ZUI in here to prevent a crash, but I hope not
	room_goto(roomTest)
}