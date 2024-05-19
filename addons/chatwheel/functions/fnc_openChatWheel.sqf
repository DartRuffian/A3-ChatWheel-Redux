#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens the Chat Wheel menu, but does not populate it with any data.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(openChatWheel);
 *
 * Public: Yes
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

[QGVAR(menuToggled), [true]] call CBA_fnc_localEvent;