left_pressed = -keyboard_check_pressed(vk_left)
right_pressed = keyboard_check_pressed(vk_right)
up_pressed = -keyboard_check_pressed(vk_up)
down_pressed = keyboard_check_pressed(vk_down)

units_index += left_pressed + right_pressed
controller_index += up_pressed + down_pressed
//Fancy mod replacement since GML can't do negative mod
units_length = array_length_1d(units)
controller_length = array_length_1d(controller)
units_index = (units_index % units_length + units_length) % units_length
controller_index = (controller_index % controller_length + controller_length) % controller_length