#include "..\script_component.hpp"
/*
 * Author: Dart
 * Removes a message from the Chat Wheel menu.
 *
 * Arguments:
 * 0: Unique identifier of the message <STRING>
 *
 * Return Value:
 * True on success, false otherwise <BOOL>
 *
 * Example:
 * "Custom1" call FUNC(removeMessage);
 *
 * Public: Yes
 */

params [
    ["_key", "", [""]]
];
private ["_messageList", "_deleted"];
TRACE_1("fnc_removeMessage",_key);

_messageList = uiNamespace getVariable [QGVAR(messages), createHashMap];
_deleted = _messageList deleteAt _key;

!isNil "_deleted";