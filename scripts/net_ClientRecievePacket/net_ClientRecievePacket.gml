
if (recievedPType == pType.CONNECTION_CONFIRMATION)
{
	connected = true;
	myClientId = buffer_read(recievedBuffer, buffer_u8);
	alarm[11] = room_speed; // Start Heartbeat
	
	ConsoleAddMessage("Connection Successful, assigned client id: " + string(myClientId));
}
else if (recievedPType == pType.DISCONNECT)
{
	connected = false;
	ConsoleAddMessage("You have been disconnected from the server.");
}