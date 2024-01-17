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
 * "A message, optionally with [tags]" call FUNC(processTags);
 */

params [
    ["_author", objNull, [objNull]],
    ["_message", "", [""]]
];
private ["_tagsList", "_voiceLine"];
TRACE_2("fnc_processTags",_author,_message);

_tagsList = uiNamespace getVariable [QGVAR(tags), createHashmap];
_message = _message regexReplace ["\[.*?\]", "\L$&"]; // lowercase everything in [brackets]

{
    private ["_tag"];
    _tag = format ["[%1]", toLowerANSI _x];
    _y params ["", "_statement"];

    if (_statement isEqualTo {}) then {
        // Contains further options
    } else {
        _message = [_message, _tag, call _statement] call EFUNC(main,stringReplace);
    };
} forEach _tagsList;

if (_author call FUNC(canUseVoiceLine)) then {
    _voiceLine = (_message call FUNC(findVoiceTags)) select 0;
    _voiceLineClass = _voiceLine select [4, count _voiceLine - 5];

    [_author, _voiceLineClass] call FUNC(useVoiceLine);
    _message = [_message, _voiceLine, ""] call EFUNC(main,stringReplace);
};

_message;