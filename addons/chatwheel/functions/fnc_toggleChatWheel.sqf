#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens or closes the Chat Wheel, depending on the current state.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if the menu was opened, false if closed
 *
 * Example:
 * call FUNC(toggleChatWheel);
 */

params [];
private ["_display", "_messagesCtrl", "_opened"];
TRACE_1("fnc_toggleChatWheel",nil);

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_opened = false;

if (isNull _display) then {
    call FUNC(openChatWheel);
    _opened = true;
} else {
    call FUNC(closeChatWheel);
};

_opened;