/*
 * Author: DartRuffian
 * Converts a bearing, a number from 0 to 360 inclusive, to a direction, North; North East; etc.
 * Values are clamped between 0 and 360.
 *
 * Arguments:
 * 0: Bearing <NUMBER>
 *
 * Return Value:
 * The direction
 *
 * Example:
 * 90 call CWR_fnc_getDirFromBearing; // Returns "East"
 */

params [["_bearing", 0, [0]]];
private ["_direction"];

_bearing = [_bearing, 0, 360] call BIS_fnc_clamp;

_direction = switch (true) do
{
    case ((_bearing <= 22.5) or (_bearing >= 337.5)): {"North"};
    case (_bearing <= 67.5): {"Northeast"};
    case (_bearing <= 112.5): {"East"};
    case (_bearing <= 157.5): {"Southeast"};
    case (_bearing <= 202.5): {"South"};
    case (_bearing <= 247.5): {"Southwest"};
    case (_bearing <= 292.5): {"West"};
    default {"Northwest"};
};

_direction;