#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Converts a bearing, a number from 0 to 360 inclusive, to a localized direction name.
 *
 * Arguments:
 * 0: Bearing <NUMBER>
 *
 * Return Value:
 * The direction the player
 *
 * Example:
 * 90 call FUNC(getDirFromBearing); // Returns "East"
 */

params [["_bearing", 0, [0]]];
private ["_direction"];
TRACE_1("fnc_bearingToDirection",_bearing);

_bearing = [_bearing, 0, 360] call BIS_fnc_clamp;

_direction = switch (true) do {
    case ((_bearing <= 22.5) or (_bearing >= 337.5)): {localize "STR_q_North"};
    case (_bearing <= 67.5): {localize "STR_q_North_East"};
    case (_bearing <= 112.5): {localize "STR_q_East"};
    case (_bearing <= 157.5): {localize "STR_q_South_East"};
    case (_bearing <= 202.5): {localize "STR_q_South"};
    case (_bearing <= 247.5): {localize "STR_q_South_West"};
    case (_bearing <= 292.5): {localize "STR_q_West"};
    default {localize "STR_q_North_West"};
};

_direction;