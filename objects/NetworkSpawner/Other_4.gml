/// @description Check if in correct room
///			     See if we are in the correct room to spawn in the manager

if (previous_room == rMainMenu)
{
	manager = instance_create_depth(x, y, "Instances", managerToSpawn);
	manager.myPort = myPort;
	manager.hostPort = hostPort;
	manager.hostIp   = hostIp;
	
	instance_destroy();
}
