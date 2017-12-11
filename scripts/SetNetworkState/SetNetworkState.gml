/// @description Change the net state and goto gameplay room

NetworkManager.state = argument0;

if (argument0 == NetState.host)
	NetworkManager.myPort = get_integer("What Port Do You Want To Host On?", NetworkManager.myPort);
else
{
	NetworkManager.connectIp   = get_string("What is the IP You would like to connect to? ", "127.0.0.1");
	NetworkManager.connectPort = get_integer("What Port Do You Want To Connect To?", NetworkManager.connectPort);
}

room_goto(rGamePlay);
