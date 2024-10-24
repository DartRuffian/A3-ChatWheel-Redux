#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Sorts an array of objects based on distance from a given position.
 *
 * Arguments:
 * 0: Position in format PositionAGL. <ARRAY>
 * 1: Objects to sort. <ARRAY>
 * 2: Sorting order, true for ascending, false for descending. <BOOL>
 *
 * Return Value:
 * The sorted objects <ARRAY>
 *
 * Example:
 * [ASLtoAGL getPosASL player, [unit1]] call cwr_main_fnc_sortByDistance;
 *
 * Public: Yes
 */

params [
    ["_positionAGL", [0,0,0], [[]], 3],
    ["_objects", [objNull], []],
    ["_order", true, [true]]
];
if !(_positionAGL isEqualTypeParams [0,0,0] or {_objects isEqualTypeParams [objNull]}) exitWith {
    WARNING_3("Bad parameters passed to %1. (%2, %3)",_fnc_scriptName,_positionAGL,_objects);
};
TRACE_3("fnc_sortByDistance",_positionAGL,_objects,_order);

private _sorted = _objects apply {
    [_positionAGL distance _x, _x];
};
_sorted sort _order;
_objects = _sorted apply {_x#1};
_objects;