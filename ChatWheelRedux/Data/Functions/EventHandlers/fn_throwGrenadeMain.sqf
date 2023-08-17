/*
 * Author: DartRuffian
 * Main code for the automated grenade messages. Handles formatting the message and sending it to nearby units.
 *
 * Arguments:
 * unit: Object - The unit throwing the grenade
 * magazine: String - The classname of the magazine being used
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "SmokeShell"] call CWR_fnc_throwGrenadeMain;
 */


params ["_unit", "_magazine"];

if !(_magazine isKindOf ["HandGrenade", configFile >> "CfgMagazines"]) exitWith {};

private _nearbyUnits = (getPosATL _unit) nearEntities ["CAManBase", 30];
[_unit, "[vl-ThrowGrenade]Grenade out, [bearing]!"] remoteExecCall ["CWR_fnc_SendLocalMessage", (_nearbyUnits)];