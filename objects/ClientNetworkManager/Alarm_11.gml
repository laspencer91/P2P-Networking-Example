/// @description Client - Perform Heartbeat

if (connected)
{
	sendBuffer = net_CreateBuffer(pType.CLIENT_HEARTBEAT);
	net_SendPacket(sendBuffer, hostIp, hostPort);
	buffer_delete(sendBuffer);

	alarm[11] = room_speed * 2;
}