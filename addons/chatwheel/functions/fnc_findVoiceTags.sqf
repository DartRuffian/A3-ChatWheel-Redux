#include "..\script_component.hpp"
/*
 * Author: Dart
 * Finds and returns all voice line tags in a message. Voice line tags are tags that begin with "vl-". A voice line tag must match the regex pattern: "\[vl-[A-z0-9]+\]/g" to be recognized and processed properly.
 *
 * Arguments:
 * 0: The message to scan <STRING>
 *
 * Return Value:
 * Array of all voice line tags <ARRAY>
 *
 * Example:
 * "[vl-voiceLine]A message[vl-voiceLine2]" call FUNC(findVoiceTags);
 *
 * Public: Yes
 */

params [
    ["_message", "", [""]]
];
TRACE_1("fnc_findVoiceTags",_message);

private _tags = _message regexFind ["\[vl-[A-z0-9]+\]/g"];
_tags = _tags apply { _x#0#0 };
_tags;