/// @description Change the net state and goto gameplay room

if (argument0 == NetState.host)
{
	NetworkSpawner.myPort = get_integer("What Port Do You Want To Host On?", 3224);
	NetworkSpawner.managerToSpawn = HostNetworkManager;
}
else
{
	NetworkSpawner.hostIp   = get_string("What is the IP You would like to connect to? ", "127.0.0.1");
	NetworkSpawner.hostPort = get_integer("What Port Do You Want To Connect To?", 3224);
	NetworkSpawner.myPort   = get_integer("What Port Do You Want To Send Data From?", 3223);
	NetworkSpawner.managerToSpawn = ClientNetworkManager;
}

room_goto(rGamePlay);
