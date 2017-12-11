/// @desc Send a new packet as the client
/// @func net_HostSendBuffer(ip, port, buffer)
/// @param ip to send to
/// @param port to send to
/// @param buffer to send

network_send_udp_raw(socket, argument0, argument1, argument2, buffer_get_size(argument2));