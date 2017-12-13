/// @description Recieve Packet
/// First byte of buffer is always the type of message

recievedBuffer = async_load[? "buffer"];
recievedIp     = async_load[? "ip"];
recievedPort   = async_load[? "port"];

buffer_seek(recievedBuffer, buffer_seek_start, 0);

recievedPType = buffer_read(recievedBuffer, buffer_u8);

net_ClientRecievePacket();
net_HostOrPeerRecievePacket();

