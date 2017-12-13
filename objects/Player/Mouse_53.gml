/// @description Shoot
inst = instance_create_layer(x, y, "Instances", ProjectilePlayer)

with (inst)
{
	speed = 10;
	direction = point_direction(x, y, mouse_x, mouse_y);
	image_angle = direction;
	myTeam = other.myTeam;
}

// Send spawn projectile packet
_bulletSpawnBuffer = net_CreateBuffer(pType.SPAWN_PROJECTILE, 
									  owner.myClientId, 
									  x, buffer_s16,
									  y, buffer_s16,
									  inst.direction, buffer_u16,
									  myTeam, buffer_u8);
									  
net_BroadcastPacket(_bulletSpawnBuffer);

buffer_delete(_bulletSpawnBuffer);