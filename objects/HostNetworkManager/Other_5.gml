/// @description Disconnect server

var _sendBuffer = net_CreateBuffer(pType.DISCONNECT);
net_BroadcastPacket(_sendBuffer);
buffer_delete(_sendBuffer);
