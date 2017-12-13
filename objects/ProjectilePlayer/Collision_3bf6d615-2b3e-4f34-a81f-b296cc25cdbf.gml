/// @description Damage Pawn

if (other.myTeam == myTeam)
	return;

var clientHit = other.owner;
other.hp -= 10;

_bulletDamageBuffer = net_CreateBuffer(pType.CLIENT_PROJECTILE_DAMAGE, 
									   NetworkManagerParent.myClientId,
									   clientHit.clientId, buffer_u8);
									   
net_BroadcastPacket(_bulletDamageBuffer);

if (other.hp <= 0)
	instance_destroy(other);

instance_destroy();
