/// @description Client - Wait Connect Response

// Try to do connection stuff
if (!connected) 
{
	bufferToSend = net_CreateBuffer(pType.CONNECT_REQUEST);
	net_SendPacket(bufferToSend, connectIp, connectPort);
	alarm[0] = room_speed;
}