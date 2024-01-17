#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Determines if a unit can use a voice line.
 *
 * Arguments:
 * 0: The unit to check <OBJECT>
 *
 * Return Value:
 * Whether the unit can use a voice line <BOOL>
 *
 * Example:
 * player call FUNC(canUseVoiceLine);
 */

params [
    ["_unit", objNull, [objNull]]
];
private ["_lastUsedVoice"];
TRACE_1("fnc_canUseVoiceLine",_unit);

_lastUsedVoice = _unit getVariable [QGVAR(lastUsedVoice), -GVAR(voice_cooldown)];

(CBA_missionTime - _lastUsedVoice) >= GVAR(voice_cooldown);