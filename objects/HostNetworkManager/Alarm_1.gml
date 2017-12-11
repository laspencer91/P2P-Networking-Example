/// @description Host - Client Purge
///              If the client hasnt sent an update in a while
///              we get rid of them!

if (instance_exists(Client))
{
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
			net_HostDisconnectClient(id);
		}
	}
}
alarm[1] = PURGE_FREQUENCY;
ConsoleAddMessage("Purging....")