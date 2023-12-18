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

[
    {
        (!isNull (uiNamespace getVariable [QCLASS(RscChatWheel), displayNull]))
    },
    {
        private ["_display", "_messagesCtrl", "_messageList", "_index"];
        _display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
        _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;
        _messageList = uiNamespace getVariable [QGVAR(messages), []];

        {
            _x params ["_className", "_displayName", "_message", "_order"];
            _index = _messagesCtrl lbAdd _displayName;
            _messagesCtrl lbSetValue [_index, _order];
            _messagesCtrl lbSetData [_index, _className];

        } forEach _messageList;

        _messagesCtrl lbSortBy ["VALUE"];
    }
] call CBA_fnc_waitUntilAndExecute;