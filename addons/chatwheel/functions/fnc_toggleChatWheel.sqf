#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens or closes the Chat Wheel
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if the menu was opened, false if closed
 *
 * Example:
 * call CWR_ChatWheel_fnc_toggleChatWheel;
 */

params [];
private ["_display", "_messagesCtrl", "_opened"];
TRACE_1("fnc_toggleChatWheel", nil);

_display = GETUVAR(CLASS(RscChatWheel),displayNull);
_opened = false;

if (isNull _display) then {
    call FUNC(openChatWheel);
    _opened = true;
} else {
    call FUNC(closeChatWheel);
};

_opened;