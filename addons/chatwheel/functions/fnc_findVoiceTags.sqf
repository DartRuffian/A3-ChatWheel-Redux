#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Finds and returns all voice line tags in a message.
 *
 * Arguments:
 * 0: The message to scan <STRING>
 *
 * Return Value:
 * Array of all [vl-XX] tags <ARRAY>
 *
 * Example:
 * "[vl-voiceLine]A message[vl-voiceLine2]" call FUNC(findVoiceTags);
 */

params [
    ["_message", "", [""]]
];
private ["_tags"];
TRACE_1("fnc_findVoiceTags",_message);

_tags = _message regexFind ["\[vl-[A-z0-9]+\]/g"];
_tags = _tags apply {_x#0#0};
_tags;