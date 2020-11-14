draw_self()
if selected
{
	draw_circle(x,y,16,true)	
}
draw_text(x, y - 32, state)
draw_healthbar(x, y - 48, x + sprite_width, y - 40, (hp / max_hp) * 100, c_gray, c_red, c_green, 0, true, true)