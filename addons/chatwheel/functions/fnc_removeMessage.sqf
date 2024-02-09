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
 * "Custom1" call FUNC(removeMessage);
 */

params [
    ["_key", "", [""]]
];
private ["_messageList", "_deleted"];
TRACE_1("fnc_removeMessage",_key);

_messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];
_deleted = _messageList deleteAt _key;

!isNil "_deleted";