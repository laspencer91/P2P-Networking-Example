/// @description Check For Net Start

if (previous_room == rMainMenu)
{
	// Network Initialization
	if (state == NetState.host)
	{
		net_InitializeHost();	
	}
	else
	{
		net_InitializeClient();	
	}
}