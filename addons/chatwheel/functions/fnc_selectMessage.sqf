#include "..\script_component.hpp"
/*
 * Author: Dart
 * Selects a message from the Chat Wheel to then be processed and sent.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cwr_chatwheel_fnc_selectMessage;
 *
 * Public: No
 */

TRACE_1("fnc_selectMessage",nil);

private _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
private _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

if (isNull _display or {isNull _messagesCtrl}) exitWith {
    WARNING("Attempted to send message while display was not open");
};

private _selectedIndex = lbCurSel _messagesCtrl;
private _className = _messagesCtrl lbData _selectedIndex;

private _messageList = uiNamespace getVariable [QGVAR(messages), createHashMap];
(_messageList get _className) params ["_displayName", "_message", "_order"];

[_message, player, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;