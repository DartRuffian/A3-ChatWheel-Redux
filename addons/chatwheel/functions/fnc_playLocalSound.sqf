#include "..\script_component.hpp"
/*
 * Author: Leopard20
 * Edited By DartRuffian
 * Plays a sound local to the current system.
 *
 * Arguments:
 * 0: File path to the sound to play <STRING>
 * 1: Position to play the sound at in format PositionASL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["file.wss", getPosASL player] call CWR_ChatWheel_fnc_playLocalSound;
 */

params [
    ["_file", "", [""]],
    ["_positionASL", [0,0,0], [[]], 3]
];
TRACE_2("fnc_playLocalSound",_file,_positionASL);

if !(_positionASL isEqualTypeParams [0,0,0]) exitWith {
    WARNING_2("Array of non-numbers passed to %1. (%2)",_fnc_scriptName,_positionASL);
};

if (GVAR(voice_enabled)) then {
    playSound3D [
        _file,
        objNull,
        false,
        _positionASL,
        GVAR(voice_volume),
        1,
        0,
        0,
        true
    ];
};