/// @desc Remove Client from clientMap and Game
/// @func net_RemoveClient(clientIp, port)
/// @param clientIp of client
/// @param port of client
/// @param clientId to remove

var _clientIp	= argument0;
var _clientPort = argument1;
var _clientId   = argument2;

var _uniqueKey = string(_clientIp) + string(_clientPort);

if (ds_map_exists(clientMap, _uniqueKey))
{
	var _clientToRemove = ds_map_find_value(clientMap, _uniqueKey);
	
	instance_destroy(_clientToRemove);
	ds_map_delete(clientMap, _uniqueKey);
}