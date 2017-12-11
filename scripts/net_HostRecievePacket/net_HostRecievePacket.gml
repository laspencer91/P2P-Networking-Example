
switch (recievedPType)
{
	case (pType.CONNECT_REQUEST):
		var _newClientId = net_PopClientId();
	
		if (_newClientId > -1 && !ds_map_exists(clientMap, string(recievedPort)))
		{
			net_AddClient(recievedIp, recievedPort, _newClientId);
			
			sendBuffer = net_CreateBuffer(pType.CONNECTION_CONFIRMATION, _newClientId); 
			net_SendPacket(sendBuffer, recievedIp, recievedPort);
			buffer_delete(sendBuffer);
		}
		else
		{
			sendBuffer = net_CreateBuffer(pType.CONNECTION_DENIED); // Server is full
			net_SendPacket(sendBuffer, recievedIp, recievedPort);
			buffer_delete(sendBuffer);
		}
	break;
	
	case (pType.CLIENT_HEARTBEAT):
		var _updateInstance = clientMap[? net_GenerateClientKey()];
		_updateInstance.lastUpdate = current_time;
		ConsoleAddMessage("Heartbeat Recieved From Client " + string(_updateInstance.clientId))
	break;
	
	case (pType.DISCONNECT):
		net_HostDisconnectClient(clientMap[? string(recievedPort)]);
	break;
}