#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Returns an array of players near a given position.
 *
 * Arguments:
 * 0: Position in format PositionAGL or Position2D <ARRAY>
 * 1: Radius in meters <NUMBER>
 *
 * Return Value:
 * Array of players
 *
 * Example:
 * [getPosAGL player, 30] call CWR_Core_fnc_getNearbyPlayers;
 */

params [
    ["_positionAGL", [0,0,0], [[]], 3],
    ["_radius", 0, [0]]
];
if !(_positionAGL isEqualTypeParams [0,0,0]) exitWith {WARNING_2("Array of non-numbers passed to %1. (%2)", _fnc_scriptName, _positionAGL);};
private ["_nearbyUnits"];

_nearbyUnits = _positionAGL nearEntities ["CAManBase", _radius];
_nearbyUnits = _nearbyUnits select {_x call FUNC(isPlayer);};

_nearbyUnits;