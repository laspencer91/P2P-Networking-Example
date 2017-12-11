/// @description Save Previous Room
previous_room = room;

// TODO MAY NEED EDITING
if (connected)
{
	sendBuffer = net_CreateBuffer(pType.DISCONNECT);
	net_HostSendBuffer(connectIp, connectPort, sendBuffer);
	buffer_delete(sendBuffer);
}
