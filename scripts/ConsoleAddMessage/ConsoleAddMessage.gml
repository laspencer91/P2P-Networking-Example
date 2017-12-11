/// @desc	Add a new message to our console

var _message = string(argument0);

var _consoleMessages = Console.messages;

ds_list_insert(_consoleMessages, 0, _message);

if (ds_list_size(_consoleMessages) > Console.MAX_MESSAGES)
	ds_list_delete(_consoleMessages, ds_list_size(_consoleMessages) - 1);
