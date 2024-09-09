#include "..\script_component.hpp"
/*
 * Author: Dart
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
 * player addEventHandler ["Fired", cwr_chatwheel_fnc_fired];
 * ["ace_firedPlayer", cwr_chatwheel_fnc_fired] call CBA_fnc_addEventHandler;
 *
 * Public: No
 */

params ["_unit", "_weapon", "", "", "", "_magazine"];
TRACE_3("fnc_fired",_unit,_weapon,_magzine);

private _grenadeType = switch (true) do {
    case (_magazine isKindOf "SmokeShell"): {["Smoke", LLSTRING(grenadeType_Smoke)]};
    default {["Grenade", LLSTRING(grenadeType_Grenade)]};
};
_grenadeType params ["_voiceLineClass", "_localized"];

if (!GVAR(autoMessages_enabled) or {!GVAR(autoMessages_enabledGrenades)} or {isNull _unit} or {_weapon != "throw"}) exitWith {};

private _message = format [LLSTRING(message_GrenadeThrown), _voiceLineClass, _localized];
[_message, _unit, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;