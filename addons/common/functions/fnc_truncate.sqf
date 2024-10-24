#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Truncates a string to a given length. The string will be trimmed before being truncated.
 *
 * Arguments:
 * 0: The string <STRING>
 * 1: Maximum length (optional, default: 15) <NUMBER>
 *    - Maximum length includes the given ending.
 * 2: Ending (optional, default: " ...") <STRING>
 *
 * Return Value:
 * The edited string <STRING>
 *
 * Example:
 * ["This is a very long string", 15] call cwr_common_fnc_truncate;
 *
 * Public: Yes
 */

params [
    ["_message", "", [""]],
    ["_maxLength", 15, [0]],
    ["_ending", " ...", [""]]
];
TRACE_3("fnc_truncate",_message,_maxLength,_ending);

_message = _message call CBA_fnc_trim;
private _length = count _message;

if (_length <= _maxLength) exitWith { _message };

_message = _message select [0, _maxLength - count _ending];
_message = _message + _ending;

_message;