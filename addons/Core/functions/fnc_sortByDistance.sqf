#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Sorts an array of objects or array in format PositionAGL or Position2D.
 *
 * Arguments:
 * 0: Position in format PositionAGL to order objects from <ARRAY>
 * 1: Array of objects to sort <ARRAY>
 * 2: Sorting order, true for ascending, false for descending <BOOL>
 *
 * Return Value:
 * The sorted objects
 *
 * Example:
 * [player, [unit1]] call CWR_Core_fnc_sortByDistance;
 */

params
[
    ["_position", [0,0,0], [[]], 3],
    ["_objects", [objNull], []],
    ["_order", true, [true]]
];
private ["_sortByDistance"];
if !(_position isEqualTypeParams [0,0,0]) exitWith {WARNING_2("Array of non-numbers passed to %1. (%2)", _fnc_scriptName, _position);};
if !(_objects isEqualTypeParams [objNull]) exitWith {WARNING_2("Array of non-objects passed to %1. (%2)", _fnc_scriptName, _position);};

_sortByDistance = _objects apply
{
    [_position distance _x, _x];
};
_sortByDistance sort _order;
_objects = _sortByDistance apply {_x#1};
_objects;