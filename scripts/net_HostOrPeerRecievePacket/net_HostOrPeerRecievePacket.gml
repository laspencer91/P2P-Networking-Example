/// @desc Packet Types Where The Host And The Peer Will Have Same Functionality On Reception


switch (recievedPType)
{
	case (pType.CLIENT_STATE_UPDATE):
		_updatedPeerClientId	 = buffer_read(recievedBuffer, buffer_u8);
		var _updatedPeerXPos     = buffer_read(recievedBuffer, buffer_s16);
		var _updatedPeerYPos     = buffer_read(recievedBuffer, buffer_s16);
		var _updatedPeerAngle    = buffer_read(recievedBuffer, buffer_u16);
		
		_updatedPeerUniqueKey = (string(recievedIp) + string(recievedPort));
		_updatedPeerInstance  = clientMap[? _updatedPeerUniqueKey];
		_updatedPeerPawnInst  = _updatedPeerInstance.pawn;
		
		with (_updatedPeerPawnInst)
		{
			moveToX = _updatedPeerXPos;
			moveToY = _updatedPeerYPos;
			turnTo  = _updatedPeerAngle;
		}
	break;
	
	case (pType.SPAWN_PROJECTILE):
		_clientIdSpawningProjectile	= buffer_read(recievedBuffer, buffer_u8);
		var _xPosOfProjectile = buffer_read(recievedBuffer, buffer_s16);
		var _yPosOfProjectile = buffer_read(recievedBuffer, buffer_s16);
		var _dirOfProjectile  = buffer_read(recievedBuffer, buffer_u16);
		var _teamOfProjectile = buffer_read(recievedBuffer, buffer_u8);
		
		with (instance_create_layer(_xPosOfProjectile, _yPosOfProjectile, "Instances", ProjectileClient))
		{
			speed = 10;
			direction = _dirOfProjectile;
			myTeam    = _teamOfProjectile;
			image_angle = direction;
		}
	break;
	
	case (pType.CLIENT_PROJECTILE_DAMAGE):
		show_debug_message("Damaged");
		var _clientIdReportingDamage = buffer_read(recievedBuffer, buffer_u8);
		var _clientIdToTakeDamage    = buffer_read(recievedBuffer, buffer_u8);
		var _clientInstToTakeDamage  = util_FindClientById(_clientIdToTakeDamage);
		
		if (_clientInstToTakeDamage == noone)
			_clientInstToTakeDamage = NetworkManagerParent;
		
		var _clientPawnToTakeDamage  = _clientInstToTakeDamage.pawn;
		
		// Destroy Projectile
		var _projectileToDestroy = instance_nearest(_clientPawnToTakeDamage.x, _clientPawnToTakeDamage.y, Projectile);
		instance_destroy(_projectileToDestroy);
		
		// Handle Peer Death
		_clientPawnToTakeDamage.hp -= 10;
		if (_clientPawnToTakeDamage.hp <= 0) {
			with (_clientPawnToTakeDamage)
			{
				event_user(0);	
			}
		}
		
	break;
}