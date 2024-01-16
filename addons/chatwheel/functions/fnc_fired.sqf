#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 *
 *
 * Arguments:
 * 0: True to scroll up one item, false to scroll down one item (optional, default: false) <BOOL>
 *
 * Return Value:
 * The selected index after scrolling <NUMBER>
 *
 * Example:
 * true call CWR_ChatWheel_fnc_handleScroll
 */

params [
    ["_unit", objNull, [objNull]],
    "",
    "",
    "",
    "",
    ["_magazine", "", [""]]
];
private ["_grenadeType", "_message"];
TRACE_2("fnc_fired",_unit,_magzine);

_grenadeType = switch (true) do {
    case (_magazine isKindOf "Chemlight_green"): {""};
    case (_magazine isKindOf "SmokeShell"): {"Smoke"};
    default {"Grenade"};
};

if (!GVAR(autoMessages_enabled) or {isNull _unit or _grenadeType == "" or !(_magazine isKindOf ["HandGrenade", configFile >> "CfgMagazines"])}) exitWith {};

_message = format ["[vl-Throw%1]%1 out, [bearing]!", _grenadeType];

[_message, "group"] call FUNC(sendMessage);