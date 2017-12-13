/// @desc Setup Client Things
socket = network_create_socket_ext(network_socket_udp, myPort);

// Try to do connection stuff
bufferToSend = net_CreateBuffer(pType.CONNECT_REQUEST, 1, myClientName, buffer_text);
net_SendPacket(bufferToSend, hostIp, hostPort);
buffer_delete(bufferToSend);

alarm[0] = room_speed;

// Onn Connection Success
ConsoleAddMessage("Successfully Connected At Port " + string(hostPort) + ".");