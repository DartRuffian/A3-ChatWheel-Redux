params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
	
if !(_magazine isKindOf ["HandGrenade", configFile >> "CfgMagazines"]) exitWith {};
// End early if not a grenade

"[vl-ThrowGrenade]Grenade Out!" call CWR_fnc_SendMessage;