/// @description Build a packet with all the info about all connected clients.
/// Packet Encoding:  [MessageType, myId, myName, Number_Of_Clients, ClientId[1], ClientName[1], ClientIp[1], ClientPort[1], [2]...]

var _sendBuffer = buffer_create(1, buffer_grow, 1);
buffer_seek(_sendBuffer, buffer_seek_start, 0);

// Add my own information to the packet
buffer_write(_sendBuffer, buffer_u8,   pType.CLIENT_INFO_UPDATE);           // Message Type
buffer_write(_sendBuffer, buffer_u8,   NetworkManagerParent.myClientId);    // Id of the client that is sending this packet
buffer_write(_sendBuffer, buffer_string, NetworkManagerParent.myClientName);  // Name of the client that is sending this packet
buffer_write(_sendBuffer, buffer_u8,   instance_number(Client));			// Amount of Clients that will be in this packet

// Iterate through all instances of Client and add their information into the buffer
for (var _i = 0; _i < instance_number(Client); _i++)
{
	var _clientInst_ = instance_find(Client, _i);
	
	buffer_write(_sendBuffer, buffer_u8,   _clientInst_.clientId);
	buffer_write(_sendBuffer, buffer_string, _clientInst_.myClientName);
	buffer_write(_sendBuffer, buffer_string, _clientInst_.ip);
	buffer_write(_sendBuffer, buffer_u16,   _clientInst_.port);
}

return _sendBuffer;