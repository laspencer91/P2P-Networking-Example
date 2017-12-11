/// @description Init Network Manager

state      = NetState.none;
myPort     = 3224;
socket     =  noone;
myClientId = -1;
clientCount = 1;

// Client Related Variables
hostIp	 = noone;
hostPort = noone;

connected = false;


// Initialize Client 
alarm[1] = 2;