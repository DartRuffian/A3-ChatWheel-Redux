#include "..\script_component.hpp"
/*
 * Author: Dart
 * Opens the Chat Wheel menu, but does not populate it with any data.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cwr_chatwheel_fnc_openChatWheel;
 *
 * Public: Yes
 */

TRACE_1("fnc_openChatWheel",nil);

private _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
if (!isNull _display) exitWith {
    WARNING("Attempted to open Chat Wheel when already open.");
};

(QGVAR(layer_chatWheel) call BIS_fnc_rscLayer) cutRsc ["CWR_RscChatWheel", "PLAIN", -1, false];
_display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
private _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

[QGVAR(menuToggled), [true]] call CBA_fnc_localEvent;