#include "..\script_component.hpp"
/*
 * Author: Dart
 * Closes the Chat Wheel menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(closeChatWheel);
 *
 * Public: Yes
 */

params [];
private ["_messagesCtrl"];
TRACE_1("fnc_closeChatWheel",nil);

_display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
if (isNull _display) exitWith {
    WARNING("Attempted to close Chat Wheel when not open.");
};

QGVAR(layer_chatWheel) cutFadeOut 0.5;
[QGVAR(menuToggled), false] call CBA_fnc_localEvent;

nil;