/// @desc Send a udp packet to specific user
/// @function net_SendPacket
/// @param buffer to send
/// @param IP to send to
/// @param PORT to send to

network_send_udp_raw(NetworkManagerParent.socket, argument1, argument2, argument0, buffer_get_size(argument0));