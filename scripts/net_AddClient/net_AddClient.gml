/// @desc Add a client to clientMap
/// @function net_AddClient(clientIp, clientPort, clientId)
/// @param clientIp of client
/// @param port of client

var _clientIp	   = argument[0];
var _clientPort    = argument[1];
var _clientId      = argument[2];
var _newClientName = "Default";

if (argument_count > 3) {
	_newClientName = argument[3];
}

var _uniqueKey = string(_clientIp) + string(_clientPort);

if (!ds_map_exists(clientMap, _uniqueKey) && _clientId != NetworkManagerParent.myClientId)
{
	// Create an instance of Client and assign it values
	var _newClientInst = instance_create_layer(0, 0, "ClientLayer", Client);
	_newClientInst.ip           = string(_clientIp);
	_newClientInst.port         = _clientPort;
	_newClientInst.clientId     = _clientId;
	_newClientInst.myClientName = _newClientName;
	
	// Create Map Entry to reference the Client instance
	clientMap[? _uniqueKey] = _newClientInst;
	ConsoleAddMessage("New Client Created: " + _uniqueKey + ", with name " + _newClientName);
}
else
{
	show_debug_message("Client Already Exists, Not Added: " + _uniqueKey + ", with name " + _newClientName);	
}