/// @description Init Network Manager

// Shared Variables
state      = NetState.none;
myPort     = 3224;
socket     = noone;
myClientId = -1;

// Hosts Variables
MAX_PLAYER = 6;
clientCount = 1;

clientIds = ds_stack_create();
clientMap = ds_map_create();   // Key = Clients "Ip + Port", value = "Client Instance Id"

for(i = MAX_PLAYER - 1; i > -1; i--)
	ds_stack_push(clientIds, i);

// Initialize host after create event, this is so that the
// Network Spawner has time to reset some of the relevent values
alarm[0] = 2;
