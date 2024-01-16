#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Takes a processed message and sends it.
 *
 * Arguments:
 * 0: The message to send, optionally with [tags] <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["A message, optionally with [tags]"] call CWR_ChatWheel_fnc_sendMessage;
 */

params [
    ["_rawMessage", "", [""]],
    ["_channel", "side", [""]],
    ["_author", player, [objNull]]
];
private ["_target"];
TRACE_3("fnc_sendMessage",_rawMessage,_channel,_author);

if (_rawMessage isEqualTo "") exitWith {};

_message = _rawMessage call FUNC(processTags);

_target = switch (_channel) do {
    case "group": {["groupChat", group _author]};
    default {["sideChat", side _author]};
};

[_author, _message] remoteExecCall _target;
[QGVAR(messageSent), [_author, _message, _rawMessage]] call CBA_fnc_localEvent;
INFO_2("%1 is sending message: %2",_author,_message);