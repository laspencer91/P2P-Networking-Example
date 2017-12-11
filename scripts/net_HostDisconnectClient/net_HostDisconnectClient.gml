/// @desc Disconnect a specific client
/// @param instId instance of client to dc

var _instToRemove = argument0;

ds_map_delete(NetworkManager.clientMap, string(_instToRemove.port));

// TODO Send Delete Message To All Other Clients
ds_stack_push(NetworkManager.clientIds, _instToRemove.clientId);

// Log Message
ConsoleAddMessage("Client " + string(_instToRemove.clientId) + " has disconneted.")

// Destroy the client Instance
instance_destroy(_instToRemove);