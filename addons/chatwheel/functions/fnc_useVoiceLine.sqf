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
 * [player, "NeedMedic"] call cwr_chatwheel_fnc_useVoiceLine;
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_voiceLineClass", "", [""]]
];
TRACE_2("fnc_useVoiceLine",_unit,_voiceLineClass);

private _voiceLines = getArray (configFile >> QGVAR(VoiceLines) >> _voiceLineClass >> "voiceLines");
_voiceLines = _voiceLines select { _x select 0 != "" };
if (_voiceLines isEqualTo []) exitWith {};

(selectRandom _voiceLines) params ["_file", "_volume", "_pitch"];

private _nearbyPlayers = [ASLToAGL getPosASL _unit, GVAR(voice_radius)] call EFUNC(common,getNearbyPlayers);
private _positionASL = getPosASL _unit;

[_file, _positionASL, _volume, _pitch] remoteExecCall [QFUNC(playLocalSound), _nearbyPlayers];
_unit setVariable [QGVAR(lastUsedVoice), CBA_missionTime];

nil;