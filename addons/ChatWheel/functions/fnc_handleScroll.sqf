#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Logic for handling mouse wheel scrolling to select different options in the Chat Wheel.
 *
 * Arguments:
 * 0: True to scroll up one item, false to scroll down one item (optional, default: false) <BOOL>
 *
 * Return Value:
 * The selected index after scrolling <NUMBER>
 *
 * Example:
 * true call CWR_ChatWheel_fnc_handleScroll
 */

params [["_scroll", false, [false]]];
private ["_display", "_messagesCtrl", "_selectedIndex"];
TRACE_1("fnc_handleScroll", _scroll);

if (visibleMap) exitWith {};

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

_selectedIndex = lbCurSel _messagesCtrl;

if (_scroll) then {
    _selectedIndex = _selectedIndex + 1;
} else {
    _selectedIndex = _selectedIndex - 1;
};

_selectedIndex = [_selectedIndex, 0, lbSize _messagesCtrl] call BIS_fnc_clamp;
_messagesCtrl lbSetCurSel _selectedIndex;
lbCurSel _messagesCtrl;