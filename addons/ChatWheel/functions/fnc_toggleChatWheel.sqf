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

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
_opened = false;

if (isNull _display) then
{
    (QGVAR(layer_chatWheel) call BIS_fnc_rscLayer) cutRsc [QCLASS(RscChatWheel), "PLAIN"];
    _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

    _messagesCtrl lbSetCurSel 0;

    _opened = true;
}
else
{
    _display closeDisplay IDC_CANCEL;
};

[QGVAR(menuToggled), [_opened]] call CBA_fnc_localEvent;
_opened;