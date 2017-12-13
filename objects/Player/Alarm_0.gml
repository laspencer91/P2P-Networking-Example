/// @description Send State Update Packet

// Write And Send Packet
buffer_seek(UPDATE_BUFFER, buffer_seek_start, 0);
buffer_write(UPDATE_BUFFER, buffer_u8, pType.CLIENT_STATE_UPDATE);
buffer_write(UPDATE_BUFFER, buffer_u8, owner.myClientId);
buffer_write(UPDATE_BUFFER, buffer_s16, x);
buffer_write(UPDATE_BUFFER, buffer_s16, y);
buffer_write(UPDATE_BUFFER, buffer_u16, image_angle);

with (Client)
{
	net_SendPacket(other.UPDATE_BUFFER, ip, port);
}
// Reset Alarm
alarm[0] = PACKET_UPDATE_TIME;