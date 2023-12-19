#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Selects a message from the Chat Wheel to then be processed and sent.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CWR_ChatWheel_fnc_selectMessage;
 */

params [];
private ["_display", "_messagesCtrl", "_selectedIndex", "_className", "_messageData"];

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

if (isNull _display or isNull _messagesCtrl) exitWith {WARNING("Attempted to send message while display was not open")};

_selectedIndex = lbCurSel _messagesCtrl;
_className = _messagesCtrl lbData _selectedIndex;

_messageData =
{
    if (_x#0 isEqualTo _className) exitWith {_x;};
} forEach (uiNamespace getVariable [QGVAR(messages), []]);
_messageData params ["_className", "_displayName", "_message", "_order"];

_message call FUNC(sendMessage);