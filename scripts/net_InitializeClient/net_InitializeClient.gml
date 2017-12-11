/// @desc Setup Client Things
myPort = 3223;
socket = network_create_socket_ext(network_socket_udp, myPort);

// Try to do connection stuff
bufferToSend = net_CreateBuffer(pType.CONNECT_REQUEST);
net_ClientSendBuffer(bufferToSend);
buffer_delete(bufferToSend);

alarm[0] = room_speed;

// Onn Connection Success
ConsoleAddMessage("Successfully Connected At Port " + string(connectPort) + ".");