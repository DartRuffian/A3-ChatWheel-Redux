#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Sends a message for a unit throwing a grenade. Some parameters are unused and are carried over from the vanilla Fired and ace_firedPlayer event handlers. These can be safely ignored by passing an empty string for their value.
 *
 * Arguments:
 * 0: The unit throwing the grenade <OBJECT>
 * 1: Weapon class name <STRING>
 * 2: Muzzle class name (unused) <STRING>
 * 3: Mode class name (unused) <STRING>
 * 4: Ammo class name (unused) <STRING>
 * 5: Magazine class name <STRING>
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

if (!GVAR(autoMessages_enabled) or {!GVAR(autoMessages_enabledGrenades) or isNull _unit or _weapon != "throw"}) exitWith {};

_message = format ["[vl-Throw%1]%1 out, [bearing]!", _grenadeType];

[_message, _unit, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;