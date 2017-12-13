/// @description Initialize Player

hp = 100;

PACKETS_PER_SECOND = 10;
PACKET_UPDATE_TIME = room_speed / PACKETS_PER_SECOND;
UPDATE_BUFFER	   = noone;

alarm[0] = PACKET_UPDATE_TIME;

alarm[1] = 2; // Initiailize Finalized Stats