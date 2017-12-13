/// @desc Handle data depending on the recieved packet type

switch(recievedPType)
{
	// A Message telling me my connection was successful has arrived
	case (pType.CONNECTION_CONFIRMATION):
		connected = true;
		myClientId = buffer_read(recievedBuffer, buffer_u8);
		alarm[11] = room_speed; // Start Heartbeat
	
		ConsoleAddMessage("Connection Successful, assigned client id: " + string(myClientId));
	break;
	
	// A Message Telling Me To Disconnect Is Coming In
	case (pType.DISCONNECT):
		connected = false;
		with (Client) { instance_destroy(); }
		ConsoleAddMessage("You have been disconnected from the server.");
	break;
	
	// Information about new clients is coming in (IP, Name, Port, Etc)
	case (pType.CLIENT_INFO_UPDATE):
		net_UnpackAllPeerInfoPacket();
	break;
	
	// A Specific client is being disconnected
	case (pType.DISCONNECT_CLIENT):
		var _sendersClientId      = buffer_read(recievedBuffer, buffer_u8);		// Not used here, but have to read it
		var _disconnectedClientId = buffer_read(recievedBuffer, buffer_u8);		// Clients ID to disconnecte
		var _clientToRemove		  = util_FindClientById(_disconnectedClientId); // InstanceId to remove
		
		if (_clientToRemove != noone)
		{
			var _clientToRemoveName   = string(_clientToRemove.ip) + string(_clientToRemove.port);	// ClientsUniqueKey
			ds_map_delete(clientMap, _clientToRemoveName);
			instance_destroy(_clientToRemove);
			ConsoleAddMessage("Client id: " + string(_disconnectedClientId) + " has been disconnected.");
		}
	break;
	
	// My Spawn And Team Assignment Incoming
	case (pType.SPAWN_ASSIGN):
		var _sendersClientId = buffer_read(recievedBuffer, buffer_u8);
		mySpawnX  = buffer_read(recievedBuffer, buffer_u16);
		mySpawnY  = buffer_read(recievedBuffer, buffer_u16);
		myTeam    = buffer_read(recievedBuffer, buffer_u8);
		var readyPacketSentTime = buffer_read(recievedBuffer, buffer_u32)
		
		var _sendBuffer = net_CreateBuffer(pType.PEER_SPAWN_UPDATE, myClientId, mySpawnX, buffer_u16, mySpawnY, buffer_u16, myTeam, buffer_u8);
		net_BroadcastPacket(_sendBuffer);
		buffer_delete(_sendBuffer);
		
		var t_startTimer = GAME_READY_TIMER;
		with (instance_create_layer(0, 0, "Instances", GameReadyTimer))
		{
			startTimer = t_startTimer;
		}
	break;
	
	// Peers Spawn and Team Assignment Incoming
	case (pType.PEER_SPAWN_UPDATE):
		var _sendersClientId = buffer_read(recievedBuffer, buffer_u8);
		var _sendersInstId   = util_FindClientById(_sendersClientId);
		
		_sendersInstId.mySpawnX  = buffer_read(recievedBuffer, buffer_u16);
		_sendersInstId.mySpawnY  = buffer_read(recievedBuffer, buffer_u16);
		_sendersInstId.myTeam    = buffer_read(recievedBuffer, buffer_u8);
	break;
}