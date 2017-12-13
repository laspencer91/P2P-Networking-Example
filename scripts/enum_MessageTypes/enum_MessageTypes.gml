enum pType {
	CONNECT_REQUEST = 0,		// Request from client to establish a connection
	CONNECTION_CONFIRMATION = 1,// Sent from server when connection is success
	CONNECTION_DENIED = 2,		// Sent from server when it denies a client connect
	CLIENT_HEARTBEAT = 3,		// Send from client to keep connection alive
	DISCONNECT = 4,				// Disconnect client this is sent to
	DISCONNECT_CLIENT = 5,		// Disconnect specified client
	CLIENT_INFO_UPDATE = 6,  	// The message contains info about a client
	SPAWN_ASSIGN = 7,			// Spawn Point and Team Assignment Incoming
	PEER_SPAWN_UPDATE = 8,		// Peer Spawn Point And Team Assignment Update
	CLIENT_STATE_UPDATE = 9,    // Sending or Recieving a Peers Updated State
	SPAWN_PROJECTILE = 10,		// Message To Spawn A Projectil
	CLIENT_PROJECTILE_DAMAGE = 11
}