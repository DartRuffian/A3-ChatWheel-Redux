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
private ["_display"];

_display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];

if (isNull _display) then
{
    (QGVAR(layer_chatWheel) call BIS_fnc_rscLayer) cutRsc [QCLASS(RscChatWheel), "PLAIN"];
}
else
{
    _display closeDisplay IDC_CANCEL;
};