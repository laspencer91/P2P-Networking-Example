/// @description Draw Console

for (var i = 0; i < ds_list_size(messages); i++)
	draw_text(10, 160 - (i * 15), messages[| i]);
	
if (instance_exists(ClientNetworkManager))
	draw_text(300, 10, "We are not hosting. Client Id: " + string(ClientNetworkManager.myClientId));
else if (instance_exists(HostNetworkManager))
	draw_text(300, 10, "We hosting. Client Id: " + string(HostNetworkManager.myClientId));
	
if (instance_exists(Client))
	draw_text(window_get_width() - 200, 10, "Players Joined: " + string(instance_number(Client) + 1));