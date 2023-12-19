#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Processes a message for tags.
 *
 * Arguments:
 * 0: The message to process <STRING>
 *
 * Return Value:
 * The processed string <STRING>
 *
 * Example:
 * "A message, optionally with [tags]" call CWR_ChatWheel_fnc_processTags;
 */

params [
    ["_message", "", [""]]
];
private ["_tagsList"];
TRACE_1("fnc_processTags", _message);

_tagsList = GETUVAR(GVAR(tags),createHashmap);
_message = _message regexReplace ['\[.*?\]', "\L$&"]; // lowercase everything in [brackets]

{
    private ["_tag"];
    _tag = format ["[%1]", toLowerANSI _x];
    _y params ["", "_statement", ""];

    if (_statement isEqualTo {}) then {
        // Contains further options
    } else {
        _message = [_message, _tag, call _statement] call EFUNC(Core,stringReplace);
    };

} forEach _tagsList;

_message;