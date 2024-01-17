#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens the Chat Wheel
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CWR_ChatWheel_fnc_openChatWheel;
 */

params [];
private ["_display", "_messagesCtrl"];
TRACE_1("fnc_openChatWheel",nil);

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
if (!isNull _display) exitWith {
    WARNING("Attempted to open Chat Wheel when already open.");
};

(QGVAR(layer_chatWheel) call BIS_fnc_rscLayer) cutRsc [QCLASS(RscChatWheel), "PLAIN", -1, false];
_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

// Small delay needed before an element can be selected
[
    {
        private ["_display", "_messagesCtrl"];
        _display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
        _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

        _messagesCtrl lbSetCurSel 0;
    },
    nil,
    0.01
] call CBA_fnc_waitAndExecute;
[QGVAR(menuToggled), [true]] call CBA_fnc_localEvent;