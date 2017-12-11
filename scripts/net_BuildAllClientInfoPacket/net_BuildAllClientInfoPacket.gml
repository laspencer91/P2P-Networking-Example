/// @description Build a packet with all the info about all connected clients.
/// Packet Encoding:  [MessageType, myId, myName, Number_Of_Clients, ClientId[1], ClientName[1], ClientIp[1], ClientPort[1], [2]...]

// Try to estimate how many bytes are needed (prevents constant buffer resizing)
var _buffersize = (3 + string_byte_length(NetworkManagerParent.myClientName)) + instance_number(Client) * 6; 

var _sendBuffer = buffer_create(_bufferSize, buffer_grow, 1);
buffer_seek(_sendBuffer, buffer_seek_start, 0);

// Add my own information to the packet
buffer_write(_sendBuffer, buffer_u8, pType.CLIENT_INFO_UPDATE);             // Message Typ
buffer_write(_sendBuffer, buffer_u8, NetworkManagerParent.myClientId);      // Id of the client that is sending this packet
buffer_write(_sendBuffer, buffer_text, NetworkManagerParent.myClientName);  // Name of the client that is sending this packet
buffer_write(_sendBuffer, buffer_u8, instance_number(Client));				// Amount of Clients that will be in this packet

// Iterate through all instances of Client and add their information
for (var _i = 0; _i < instance_number(Client); _i++)
{
	var _clientInst_ = instance_find(Client, _i);
	
	buffer_write(_sendBuffer, buffer_u8,   _clientInst_.clientId);
	buffer_write(_sendBuffer, buffer_text, _clientInst_.clientName);
	buffer_write(_sendBuffer, buffer_text, _clientInst_.clientIp);
	buffer_write(_sendBuffer, buffer_u8,   _clientInst_.clientPort);
}

return _sendBuffer;