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

params [["_message", "", [""]]];
private ["_author"];

if (_message isEqualTo "") exitWith {};

// _message = _message call FUNC(processTags);

_author = player;
[_author, _message] remoteExecCall ["sideChat", side _author];