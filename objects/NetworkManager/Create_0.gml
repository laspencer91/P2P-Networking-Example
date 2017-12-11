/// @description Init Network Manager

// Shared Variables
previous_room = noone;

enum NetState {
	none,
	host,
	client
}

state      = NetState.none;
myPort     = 3224;
socket     =  noone;
myClientId = -1;

// Hosts Variables
MAX_PLAYER = 10;
clientIds = ds_stack_create();
clientMap = ds_map_create();   // Key = "Clients Port", value = "Client Instance Id"

for(i = 10 - 1; i > -1; i--)
	ds_stack_push(clientIds, i);

// Client Related Variables
connectIp	= "127.0.0.1";
connectPort = 3223;

connected = false;