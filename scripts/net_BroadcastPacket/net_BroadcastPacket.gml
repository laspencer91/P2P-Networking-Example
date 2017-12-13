/// @description Broadcast a given buffer to all the clients in the room
/// @function net_BroadcastPacket
/// @param buffer Buffer to send

var _bufferIndex = argument[0]; // Buffer To Send
var _targetClientId = -1;      // Default to a value that cant be true

// Set a client to skip sending to if a client id is provided
if (argument_count > 1)
	_targetClientId = argument[1];

// Iterate through all Clients in the room and send the data to them
for (var _i = 0; _i < instance_number(Client); _i++)
{
	var _inst = instance_find(Client, _i);
	
	if (_targetClientId == _inst.clientId)
		continue;							// Skip sending to this client
		
	net_SendPacket(_bufferIndex, _inst.ip, _inst.port);
}