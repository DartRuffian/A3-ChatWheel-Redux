#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Closes the Chat Wheel menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cwr_chatwheel_fnc_closeChatWheel;
 *
 * Public: Yes
 */

params [];
TRACE_1("fnc_closeChatWheel",nil);

private _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
if (isNull _display) exitWith {
    WARNING("Attempted to close Chat Wheel when not open.");
};

QGVAR(layer_chatWheel) cutFadeOut 0.5;
[QGVAR(menuToggled), false] call CBA_fnc_localEvent;

nil;