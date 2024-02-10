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
 * call FUNC(selectMessage);
 *
 * Public: No
 */

params [];
private ["_display", "_messagesCtrl", "_selectedIndex", "_messageList", "_className"];
TRACE_1("fnc_selectMessage",nil);

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

if (isNull _display or isNull _messagesCtrl) exitWith {
    WARNING("Attempted to send message while display was not open");
};

_selectedIndex = lbCurSel _messagesCtrl;
_className = _messagesCtrl lbData _selectedIndex;

_messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];
(_messageList get _className) params ["_displayName", "_message", "_order"];

[_message, player, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;