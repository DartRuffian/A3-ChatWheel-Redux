#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a given unit is a player, includes remote controlled units by default.
 *
 * Arguments:
 * 0: The unit to check <OBJECT>
 * 1: Include remote controlled units (optional, default: true) <BOOL>
 *
 * Return Value:
 * Whether the unit is player controlled
 *
 * Example:
 * player call CWR_main_fnc_isPlayer;
 */

params [
    ["_unit", objNull, [objNull]],
    ["_includeRemoteControlled", true, [true]]
];
TRACE_2("fnc_isPlayer",_unit,_includeRemoteControlled);

if (isNull _unit) exitWith {false};

isPlayer _unit or {
    _includeRemoteControlled && {
        !isNull (_unit getVariable ["bis_fnc_moduleRemoteControl_owner", objNull])
    }
};