#include "..\script_component.hpp"
/*
 * Author: Dart
 * Returns an array of players near a given position.
 *
 * Arguments:
 * 0: Position in format PositionAGL <ARRAY>
 * 1: Radius in meters <NUMBER>
 *
 * Return Value:
 * Array of player units <ARRAY>
 *
 * Example:
 * [getPosAGL player, 30] call FUNC(getNearbyPlayers);
 *
 * Public: Yes
 */

params [
    ["_positionAGL", [0,0,0], [[]], 3],
    ["_radius", 0, [0]]
];
TRACE_2("fnc_getNearbyPlayers",_positionAGL,_radius);

if !(_positionAGL isEqualTypeParams [0,0,0]) exitWith {
    WARNING_2("Array of non-numbers passed to %1. (%2)",_fnc_scriptName,_positionAGL);
};

private _nearbyUnits = _positionAGL nearEntities ["CAManBase", _radius];
_nearbyUnits = _nearbyUnits select {_x call FUNC(isPlayer);};

_nearbyUnits;