#include "..\script_component.hpp"
/*
 * Author: Dart
 * Opens or closes the Chat Wheel, based on its current state.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if opened, false otherwise <BOOL>
 *
 * Example:
 * call FUNC(toggleChatWheel);
 *
 * Public: Yes
 */

params [];
private ["_display", "_messagesCtrl", "_opened"];
TRACE_1("fnc_toggleChatWheel",nil);

_display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
_opened = false;

if (isNull _display) then {
    call FUNC(openChatWheel);
    _opened = true;
} else {
    call FUNC(closeChatWheel);
};

_opened;