#include "..\script_component.hpp"
/*
 * Author: Dart
 * Logic for handling mouse wheel scrolling to select different options in the Chat Wheel.
 *
 * Arguments:
 * 0: True to scroll up one item, false to scroll down one item (optional, default: false) <BOOL>
 *
 * Return Value:
 * The selected index after scrolling <NUMBER>
 *
 * Example:
 * true call cwr_chatwheel_fnc_handleScroll
 *
 * Public: No
 */

params [["_scroll", false, [false]]];
TRACE_1("fnc_handleScroll",_scroll);

if (visibleMap) exitWith {};

private _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
private _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;
private _selectedIndex = lbCurSel _messagesCtrl;

if (_scroll) then {
    _selectedIndex = _selectedIndex + 1;
} else {
    _selectedIndex = _selectedIndex - 1;
};

_selectedIndex = CLAMP(_selectedIndex,0,lbSize _messagesCtrl);
_messagesCtrl lbSetCurSel _selectedIndex;
lbCurSel _messagesCtrl;