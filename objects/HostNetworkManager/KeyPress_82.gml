/// @description Game Ready
var _i = 0;

// Assign all Clients spawn Point And Teams
with (Client)
{
	spawnPoint = instance_find(SpawnPoint, _i++);
	myTeam = spawnPoint.team;
	mySpawnX = spawnPoint.x;
	mySpawnY = spawnPoint.y;
	myBuffer = net_CreateBuffer(pType.SPAWN_ASSIGN,
								NetworkManagerParent.myClientId, 
								mySpawnX, buffer_u16, 
								mySpawnY, buffer_u16, 
								myTeam, buffer_u8, 
								current_time, buffer_u32);
								
	net_SendPacket(myBuffer, ip, port);
}

// Assign my Spawn Point and Team
spawnPoint = instance_find(SpawnPoint, _i++);
mySpawnX = spawnPoint.x;
mySpawnY = spawnPoint.y;
myTeam   = spawnPoint.team;

// Send my position and team to all clients
var _sendBuffer = net_CreateBuffer(pType.PEER_SPAWN_UPDATE, 
								   myClientId, 
								   mySpawnX, buffer_u16, 
								   mySpawnY, buffer_u16, 
								   myTeam, buffer_u8);
net_BroadcastPacket(_sendBuffer);
buffer_delete(_sendBuffer);

// Create GameReadyTimer
with (instance_create_layer(0, 0, "Instances", GameReadyTimer))
{
	startTimer = GAME_READY_TIMER;
}