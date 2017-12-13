/// @description Initialize Object To Spawn
/// This object will spawn the correct Network Manager based
/// on whether a decision has been made to be a host or just join

enum NetState {
	none,
	host,
	client
}

managerToSpawn = noone;
previous_room = noone;   // Main Menu
hostPort = noone;
hostIp   = noone;
myPort   = noone;

displayName = "Cool Player";