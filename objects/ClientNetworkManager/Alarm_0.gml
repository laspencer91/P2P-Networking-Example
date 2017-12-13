/// @description Client - Wait Connect Response

// Try to do connection stuff
if (!connected) 
{
	bufferToSend = net_CreateBuffer(pType.CONNECT_REQUEST, myClientName, buffer_text);
	net_SendPacket(bufferToSend, hostIp, hostPort);
	alarm[0] = room_speed;
}