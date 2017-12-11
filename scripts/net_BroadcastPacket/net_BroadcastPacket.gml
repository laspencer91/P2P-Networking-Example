/// @description Broadcast a given buffer to all the clients in the room

var _bufferIndex = argument0; // Buffer To Send

for (var _i = 0; _i < instance_number(Client); _i++)
{
	var _inst = instance_find(Client, _i);
	
	net_SendPacket(_bufferIndex, _inst.ip, _inst.port);
}