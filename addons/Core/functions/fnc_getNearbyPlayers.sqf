/*
 * Authors: DartRuffian
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

params
[
    ["_position", [0,0,0], [[]], 3],
    ["_radius", 0, [0]]
];
if !(_position isEqualTypeParams [0,0,0]) exitWith {WARNING_2("Array of non-numbers passed to %1. (%2)", _fnc_scriptName, _position);};
private ["_nearbyUnits"];

_nearbyUnits = _position nearEntities ["CAManBase", _radius];
_nearbyUnits = _nearbyUnits select {[_x, _includeRemoteControlled] call FUNC(isPlayer);};

_nearbyUnits;