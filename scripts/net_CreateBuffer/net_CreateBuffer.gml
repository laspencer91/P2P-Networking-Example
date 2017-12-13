/// @desc Build a buffer to send, Must supply message type, then ClientId when needed, followed by 
///       a series of (value, type) patterns.
/// @arg messageType Type Packet
/// @arg clientId need if sending more than just pType
/// @arg data 
/// @arg dataType..  Repeat pattern for all information wanting to write
// Index 0: type of Message
// Index 1: client id byte_u8
// Index 2: Value of next data = "sfsfs"
// Index 3: Type of data in index 1
// Index 4: Value of Next data
// Index 5: Type of data in index 3

var _messageType = argument[0];
var _clientId    = (argument_count > 1) ? argument[1] : noone;

// Just send a packet with a message type if clientId is noone or not provided
_bufferSize = (_clientId == noone || argument_count == 1) ? 1 : 2;

// Or else we need to cycle through all of the values contained in this message

// Calculate the size needed for the buffer
for (var _i = 3; _i < argument_count; _i += 2)
{
	if (argument[_i] == buffer_text || argument[_i] == buffer_string)
		_bufferSize += string_byte_length(argument[_i - 1]);
	else
		_bufferSize += buffer_sizeof(argument[_i]);
}

// Create and write to buffer
sendBuffer = buffer_create(_bufferSize, buffer_fixed, 1);
buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, _messageType);	 // Write Packet Type

// Write our client Id if it is supplied
if (_bufferSize > 1)
	buffer_write(sendBuffer, buffer_u8, _clientId);	 // Write Packet Type

// Write out all additional values into our buffer
for (var _i = 2; _i < argument_count; _i += 2)
	buffer_write(sendBuffer, argument[_i + 1], argument[_i]);

return sendBuffer;