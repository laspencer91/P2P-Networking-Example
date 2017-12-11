/// @desc Build a buffer to send
/// @arg messageType Type of Network Packet To Send
// Index 0: type of Message
// Index 1: Value of next data = "sfsfs"
// Index 2: Type of data in index 1
// Index 3: Value of Next data
// Index 4: Type of data in index 3

var _messageType = argument[0];

var _bufferSize = 1;

// Calculate the size needed for the buffer
for (var _i = 2; _i < argument_count; _i += 2)
{
	if (argument[_i] == buffer_text || argument[_i] == buffer_string)
		_bufferSize += string_byte_length(argument[_i - 1])
	else
		_bufferSize += buffer_sizeof(argument[_i]);
}

// Create and write to buffer
sendBuffer = buffer_create(_bufferSize, buffer_fixed, 1);
buffer_seek(sendBuffer, buffer_seek_start, 0);
buffer_write(sendBuffer, buffer_u8, _messageType);	 // Write Packet Type

for (var _i = 1; _i < argument_count; _i += 2)
	buffer_write(sendBuffer, argument[_i + 1], argument[_i]);

return sendBuffer;