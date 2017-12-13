/// @description Draw Spawn Timer

if (variable_instance_exists(id, "startTimer"))
{
	draw_text(250, 250, "The Game Will Start IN");
	draw_text(250, 280, string(startTimer) + " Milliseconds")
}