#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds a message to the Chat Wheel options.
 *
 * Arguments:
 * 0: Unique identifier for the message <STRING>
 * 1: Text displayed in the Chat Wheel <STRING>
 * 2: The message sent when this option is selected <STRING>
 * 3: Order used to sort messages in the Chat Wheel (optional, default: -1) <NUMBER>
 *    -1 will result in an order that is the number of current elements + 100.
 * 4: Overwrite existing message if it exists (optional, default: false) <BOOL>
 *
 * Return Value:
 * Whether the message was added successfully <BOOL>
 *
 * Example:
 * ["Custom1", "Custom 1", "This is my custom message", 10] call FUNC(addMessage);
 */

params [
    ["_key", "", [""]],
    ["_displayName", "", [""]],
    ["_message", "", [""]],
    ["_order", -1, [0]],
    ["_overwrite", false, [false]]
];
private ["_messageList"];
TRACE_5("fnc_addMessage",_key,_displayName,_message,_order,_overwrite);

if (_key isEqualTo "" or {_displayName isEqualTo "" or _message isEqualTo ""}) exitWith {false};

_messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];

if (_key in _messageList and {!_overwrite}) exitWith {false};

if (_order isEqualTo -1) then {
    _order = count _messageList + 100;
};

_messageList insert [[_key, [
    _displayName,
    _message,
    _order
]]];

true;