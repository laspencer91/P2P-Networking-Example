/// @description Draw Console

for (var i = 0; i < ds_list_size(messages); i++)
	draw_text(10, 160 - (i * 15), messages[| i]);