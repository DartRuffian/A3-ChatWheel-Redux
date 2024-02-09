#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Processes a message for "simple" tags. A simple tag does not require user input and is text replaced with a code output.
 * E.g. [weapon] is replaced with the displayName of the author's current held weapon.
 *
 * Arguments:
 * 0: The author of the message <OBJECT>
 * 1: The message to process <STRING>
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
private ["_tagsList", "_voiceLine", "_voiceLineClass"];
TRACE_2("fnc_processTags",_author,_message);

_tagsList = uiNamespace getVariable [QGVAR(tags), createHashmap];
_message = _message regexReplace ["\[.*?\]", "\L$&"]; // lowercase everything in [brackets]

{
    private ["_tag"];
    _tag = format ["[%1]", toLowerANSI _x];
    _y params ["", "_statement"];

    if (_statement isNotEqualTo {}) then {
        _message = [_message, _tag, _author call _statement] call EFUNC(main,stringReplace);
    };
} forEach _tagsList;

_voiceLine = (_message call FUNC(findVoiceTags)) select 0;
if (_author call FUNC(canUseVoiceLine)) then {
    _voiceLineClass = _voiceLine select [4, count _voiceLine - 5];

    [_author, _voiceLineClass] call FUNC(useVoiceLine);
};
_message = [_message, _voiceLine, ""] call EFUNC(main,stringReplace);

_message;