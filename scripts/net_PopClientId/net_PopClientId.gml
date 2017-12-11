/// @desc Retrieve A Client Id, if none are available return -1

if (ds_stack_empty(clientIds))
	return -1;
	
return ds_stack_pop(clientIds);