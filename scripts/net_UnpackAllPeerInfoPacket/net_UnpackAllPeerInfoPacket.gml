/// @description Unpack the packet sent from host that contains every other connected
///				 peers information.
/// @function net_UnpackAllPeerInfoPacket

var _newClient		 = noone;
var _uniqueClientKey = string(recievedIp) + string(recievedPort);

// Read the hosts id and name
var	_recievedId   = buffer_read(recievedBuffer, buffer_u8);
var	_recievedName = buffer_read(recievedBuffer, buffer_string);

// (Sent From Host, add their information if we dont have it and create client for them)
if (!ds_map_exists(clientMap, _uniqueClientKey) && _recievedId != NetworkManagerParent.myClientId)
{
	_newClient = instance_create_layer(0, 0, "ClientLayer", Client);
	ds_map_add(clientMap, _uniqueClientKey, _newClient);
	
	_newClient.ip		    = recievedIp;
	_newClient.port		    = recievedPort;
	_newClient.clientId     = _recievedId;
	_newClient.myClientName = _recievedName;
	ConsoleAddMessage("Host Client Added At Id: " + string(_recievedId));
}
else
{
	// Need to skip those two pieces of data that hold the servers id and name
	show_debug_message("Skipping Server Information In Client Info Update Packet, already exists");
	ConsoleAddMessage("Did not create instance with id " + string(_recievedId) + " because already exists.");
}

if (buffer_tell(recievedBuffer) > buffer_get_size(recievedBuffer))
	return;
// Exit the script if the buffer doesnt contain anymore information


var numberOfClientsToRead = buffer_read(recievedBuffer, buffer_u8);

// Iterrate through remainder of packet and unload it into new instances if needed
// NOTE: That the net_AddClient script checks if the Client already exists and ignores
//       it if so.
for (var _i = 0; _i < numberOfClientsToRead; _i++)
{
	var tempId   = buffer_read(recievedBuffer, buffer_u8);
	var tempName = buffer_read(recievedBuffer, buffer_string);
	var tempIp   = buffer_read(recievedBuffer, buffer_string);
	var tempPort = buffer_read(recievedBuffer, buffer_u16);
	
	show_debug_message("Read Id: " + string(tempId) + " Read Name: " + tempName + " Read ip and port: " + tempIp + " " + string(tempPort));
	
	net_AddClient(tempIp, tempPort, tempId, tempName);
}
