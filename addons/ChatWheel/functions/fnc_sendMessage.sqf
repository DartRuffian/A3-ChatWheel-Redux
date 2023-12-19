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

params [["_rawMessage", "", [""]]];
private ["_author"];

if (_rawMessage isEqualTo "") exitWith {};

_message = _rawMessage /*call FUNC(processTags)*/;

_author = player;
[_author, _message] remoteExecCall ["sideChat", side _author];
[QGVAR(messageSent), [_author, _message, _rawMessage]] call CBA_fnc_localEvent;