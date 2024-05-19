#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Plays a voice line from a given unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Class name from CWR_ChatWheel_VoiceLines <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "NeedMedic"] call FUNC(useVoiceLine);
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_voiceLineClass", "", [""]]
];
private ["_voiceLines", "_nearbyPlayers"];
TRACE_2("fnc_useVoiceLine",_unit,_voiceLineClass);

_voiceLines = getArray (configFile >> QGVAR(VoiceLines) >> _voiceLineClass >> "voiceLines");
if (count _voiceLines isEqualTo 0) exitWith {};

(selectRandom _voiceLines) params ["_file", "_volume", "_pitch"];

_nearbyPlayers = [ASLToAGL getPosASL _unit, GVAR(voice_radius)] call EFUNC(main,getNearbyPlayers);

{
    [_file, getPosASL _unit, _volume, _pitch] remoteExecCall [QFUNC(playLocalSound), _x];
} forEach _nearbyPlayers;

_unit setVariable [QGVAR(lastUsedVoice), CBA_missionTime];

nil;