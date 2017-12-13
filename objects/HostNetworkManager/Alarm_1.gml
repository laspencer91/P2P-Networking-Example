/// @description Host - Client Purge
///              If the client hasnt sent an update in a while
///              we get rid of them!

var _deadClient = noone;

with (Client)
{
	if (current_time - lastUpdate > HOST_TIMEOUT_PERIOD)
	{
		// Nested with statement.. wtf?
		with (HostNetworkManager)
		{
			sendBuffer = net_CreateBuffer(pType.DISCONNECT);
			net_SendPacket(sendBuffer, other.ip, other.port);
			buffer_delete(sendBuffer);
		}
		_deadClient = id;
	}
}

if (_deadClient != noone)
	net_HostDisconnectClient(_deadClient);


alarm[1] = PURGE_FREQUENCY;
ConsoleAddMessage("Purging Inactive Clients....")