/// @desc Setup Host Things

socket = network_create_socket_ext(network_socket_udp, myPort);
myClientId = net_PopClientId();
alarm[1] = PURGE_FREQUENCY;
ConsoleAddMessage("Host has been initialized on port " + string(myPort) + ".");
ConsoleAddMessage("Hosts Client Id Is  " + string(myClientId) + ".");

