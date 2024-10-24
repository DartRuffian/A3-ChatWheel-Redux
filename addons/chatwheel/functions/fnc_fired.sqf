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
 * Public: No
 */

params ["_unit", "_weapon", "", "", "", "_magazine"];
TRACE_3("fnc_fired",_unit,_weapon,_magazine);

if (!GVAR(autoMessages_enabled) or
    {!GVAR(autoMessages_enabledGrenades)} or
    {!isThrowable _magazine} or
    {_unit isNotEqualTo ([] call CBA_fnc_currentUnit)}
) exitWith {};


private _magazineConfig = configFile >> "CfgMagazines" >> _magazine;
private _grenadeType = getText (_magazineConfig >> QGVARMAIN(grenadeType));
private _grenadeLocalized = getText (_magazineConfig >> QGVARMAIN(grenadeLocalized));

if (_grenadeType == "") then {
    _grenadeType = "Grenade";
};

if (_grenadeLocalized == "") then {
    _grenadeLocalized = _grenadeType;
};

private _message = format [LLSTRING(message_GrenadeThrown), _grenadeType, _grenadeLocalized];
[_message, _unit, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);

nil;