#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Adds a message to the Chat Wheel options.
 *
 * Arguments:
 * 0: Unique identifier for the message <STRING>
 * 1: Text displayed in the Chat Wheel <STRING>
 * 2: The message sent when this option is displayed <STRING>
 * 3: Order used to sort messages in the Chat Wheel (optional, default: -1) <NUMBER>
 *    -1 will result in an order that is the number of current elements + 100.
 *
 * Return Value:
 * Whether the message was added successfully <BOOL>
 *
 * Example:
 * ["Custom1", "Custom 1", "This is my custom message", 10] call CWR_ChatWheel_fnc_addMessage;
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

_messageList = GETUVAR(GVAR(messages),createHashmap);

if (_key in _messageList and {!_overwrite}) exitWith {false};

if (_order isEqualTo -1) then {
    _order = count _messageList + 100;
};

_messageList insert [[
    _key,
    [
        _displayName,
        _message,
        _order
    ]
]];

true;