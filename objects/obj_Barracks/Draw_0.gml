if state == "Construction"
{
	draw_sprite(spr_Barracks_Construction,0,x,y)	
}
else
{
	draw_sprite(spr_Barracks,0,x,y)	
}
if selected
{
	draw_circle(x,y,32,true)
}
if rally
{
	draw_line(x,y,rally_x,rally_y)
}