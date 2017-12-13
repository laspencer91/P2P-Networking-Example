/// @description Disconnect
// TODO MAY NEED EDITING
if (connected)
{
	sendBuffer = net_CreateBuffer(pType.DISCONNECT);
	net_SendPacket(sendBuffer, hostIp, hostPort);
	buffer_delete(sendBuffer);
	
	connected = false;
}
