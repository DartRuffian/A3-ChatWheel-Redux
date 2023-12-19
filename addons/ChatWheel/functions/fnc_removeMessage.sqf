#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Removes a message from the Chat Wheel options.
 *
 * Arguments:
 * 0: Unique identifier of the message <STRING>
 *
 * Return Value:
 * Whether the message was removed successfully <BOOL>
 *
 * Example:
 * "Custom1" call CWR_ChatWheel_fnc_removeMessage;
 */

params [
    ["_key", "", [""]]
];
private ["_messageList"];
TRACE_1("fnc_removeMessage", _key);

_messageList = GETUVAR(GVAR(messages),createHashmap);

if (_key in _messageList) then {
    _messageList deleteAt _key;
    true;
} else
{
    false;
};