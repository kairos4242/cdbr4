player1 = instance_create_depth(0,0,0,obj_Player)
with instance_find(obj_Worker,1)
{
	controller = other.player1
}
with instance_find(obj_Worker,0)
{
	controller = other.player1	
}

selected_list = ds_list_create()
//units selected

//for drag select
select_held = false//will be true when mouse held down to drag select