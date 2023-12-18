#include "..\script_component.hpp"
/*
* Author: DartRuffian
* Takes messages stored in CWR_ChatWheel_messages from uiNamespace and populates the message listbox control.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call CWR_ChatWheel_fnc_populateChatWheel;
*/

params [];
private ["_display", "_messagesCtrl", "_messageList"];

[
    {
        (!isNull (uiNamespace getVariable [QCLASS(RscChatWheel), displayNull]))
    },
    {
        _display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
        _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;
        _messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];

        {
            // TODO: Order items in list box by _order
            _y params ["_displayName", "_message", "_order"];
            _messagesCtrl lbAdd _displayName;
        } forEach _messageList;
    }
] call CBA_fnc_waitUntilAndExecute;