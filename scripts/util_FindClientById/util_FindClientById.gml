/// @desc Given a client id return the Client instance id
/// @function util_FindClientById(id)
/// @param id clientId to find

var _idToSearchFor = argument0;

with (Client)
{
	if (clientId == _idToSearchFor)
		return id;
}

return noone;