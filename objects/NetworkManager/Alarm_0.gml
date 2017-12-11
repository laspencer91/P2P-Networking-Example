/// @description Client - Wait Connect Response

// Try to do connection stuff
if (!connected) 
{
	bufferToSend = net_CreateBuffer(pType.CONNECT_REQUEST);
	net_ClientSendBuffer(bufferToSend);
	alarm[0] = room_speed;
}