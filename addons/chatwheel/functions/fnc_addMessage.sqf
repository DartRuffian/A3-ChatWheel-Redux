#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds a message to the Chat Wheel menu.
 *
 * Arguments:
 * 0: Unique identifier for the message <STRING>
 * 1: Text displayed in the Chat Wheel <STRING>
 * 2: The message sent when this option is selected <STRING>
 * 3: The order to sort the message by (optional, default: -1 will put message at the end of the list). <NUMBER>
 *    -1 will result in an order that is the number of current elements + 100.
 * 4: Overwrite existing message if present (optional, default: false) <BOOL>
 *
 * Return Value:
 * True on success, false otherwise <BOOL>
 *
 * Example:
 * ["Custom1", "Custom 1", "This is my custom message", 10] call cwr_chatwheel_fnc_addMessage;
 *
 * Public: Yes
 */

params [
    ["_key", "", [""]],
    ["_displayName", "", [""]],
    ["_message", "", [""]],
    ["_order", -1, [0]],
    ["_overwrite", false, [false]]
];
TRACE_5("fnc_addMessage",_key,_displayName,_message,_order,_overwrite);

if (_key == "" or {_displayName == ""} or {_message = ""}) exitWith { false };

private _messageList = uiNamespace getVariable [QGVAR(messages), createHashMap];

if (_key in _messageList and {!_overwrite}) exitWith {false};

if (_order == -1) then {
    _order = count _messageList;
};

_messageList insert [[_key, [
    _displayName,
    _message,
    _order
]]];

true;