/// @description Decrease Start Timer

if (variable_instance_exists(id, "startTimer"))
{
	startTimer -= (delta_time / 1000);	
	
	if (startTimer <= 0)
	{
		with (NetworkManagerParent)
		{
			event_user(1); // START GAME!!!	
		}
		instance_destroy();
	}
}