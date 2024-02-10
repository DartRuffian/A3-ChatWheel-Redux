#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Closes the Chat Wheel.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(closeChatWheel);
 */

params [];
private ["_messagesCtrl"];
TRACE_1("fnc_closeChatWheel",nil);

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
if (isNull _display) exitWith {
    WARNING("Attempted to close Chat Wheel when not open.");
};

QGVAR(layer_chatWheel) cutFadeOut 0.5;
[QGVAR(menuToggled), false] call CBA_fnc_localEvent;

nil;