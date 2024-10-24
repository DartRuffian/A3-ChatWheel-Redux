#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Takes messages stored in CWR_ChatWheel_messages from uiNamespace and populates the message listbox control. If the data to populate the list with is empty, the saved message list will be used instead.
 *
 * Arguments:
 * 0: Message data to populate the Chat Wheel (optional, default: message list) <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cwr_chatwheel_fnc_populateChatWheel;
 *
 * Public: Yes
 */

params [
    ["_lbData", createHashMap, [createHashMap]]
];
TRACE_1("fnc_populateChatWheel",_lbData);

if (count _lbData isEqualTo 0) then {
    _lbData = uiNamespace getVariable [QGVAR(messages), createHashMap];
};

[{
    (!isNull (uiNamespace getVariable ["CWR_RscChatWheel", displayNull]))
}, {
    params ["_lbData"];
    private _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
    private _messagesCtrl = _display displayCtrl IDC_CHATWHEEL_MESSAGES;

    {
        _y params ["_displayName", "_message", "_order"];
        private _index = _messagesCtrl lbAdd _displayName;
        _messagesCtrl lbSetValue [_index, _order];
        _messagesCtrl lbSetData [_index, _x];
    } forEach _lbData;

    _messagesCtrl lbSortBy ["VALUE"];

    // Select first element by default
    [{ _this lbSetCurSel 0; }, _messagesCtrl, 0.01] call CBA_fnc_waitAndExecute;
}, [_lbData]] call CBA_fnc_waitUntilAndExecute;