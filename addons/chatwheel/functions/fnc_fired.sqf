#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Event handler for automated messages for throwing grenades. Works for vanilla and ace_player
 *
 * Arguments:
 * 0: The unit throwing the grenade <OBJECT>
 * 1: Weapon class name <STRING>
 * 2: Unused
 * 3: Unused
 * 4: Unused
 * 5: The thrown grenade magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Examples:
 * player addEventHandler ["Fired", LINKFUNC(fired)];
 * ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
 */

params ["_unit", "_weapon", "", "", "", "_magazine"];
private ["_grenadeType", "_message"];
TRACE_3("fnc_fired",_unit,_weapon,_magzine);

_grenadeType = switch (true) do {
    case (_magazine isKindOf "SmokeShell"): {"Smoke"};
    default {"Grenade"};
};

if (!GVAR(autoMessages_enabled) or {isNull _unit or toLowerANSI _weapon != "throw"}) exitWith {};

_message = format ["[vl-Throw%1]%1 out, [bearing]!", _grenadeType];

[_message, _unit, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;