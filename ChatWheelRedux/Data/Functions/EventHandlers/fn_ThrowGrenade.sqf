params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if !(_magazine isKindOf ["HandGrenade", configFile >> "CfgMagazines"]) exitWith {};
// End early if not a grenade

private _nearbyUnits = nearestObjects [player, ["Man"], 30];
[player, "[vl-ThrowGrenade]Grenade Out!"] remoteExecCall ["CWR_fnc_SendLocalMessage", (_nearbyUnits)];