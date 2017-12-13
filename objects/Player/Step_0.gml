/// @desc Move Player

x += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 5;
y += (keyboard_check(vk_down) - keyboard_check(vk_up)) * 5;

image_angle = point_direction(x, y, mouse_x, mouse_y);