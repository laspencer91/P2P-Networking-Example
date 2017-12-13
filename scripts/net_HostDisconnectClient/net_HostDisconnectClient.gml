/// @desc Disconnect a specific client
/// @param instId instance of client to dc

var _instToRemove = argument0;

ds_map_delete(clientMap, string(_instToRemove.port));

// TODO Send Delete Message To All Other Clients
ds_stack_push(clientIds, _instToRemove.clientId);

// Log Message
ConsoleAddMessage("Client " + string(_instToRemove.clientId) + " has disconneted.")

var discBuffer = net_CreateBuffer(pType.DISCONNECT_CLIENT, myClientId, _instToRemove.clientId, buffer_u8);
net_BroadcastPacket(discBuffer, _instToRemove.clientId);

// Destroy the client Instance
instance_destroy(_instToRemove);