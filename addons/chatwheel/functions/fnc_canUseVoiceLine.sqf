#include "..\script_component.hpp"
/*
 * Author: Dart
 * Determines if a unit can use a voice line.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * True if unit can say a voice line, otherwise false <BOOL>
 *
 * Example:
 * player call FUNC(canUseVoiceLine);
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];
TRACE_1("fnc_canUseVoiceLine",_unit);

private _lastUsedVoice = _unit getVariable [QGVAR(lastUsedVoice), -GVAR(voice_cooldown)];

(CBA_missionTime - _lastUsedVoice) >= GVAR(voice_cooldown);