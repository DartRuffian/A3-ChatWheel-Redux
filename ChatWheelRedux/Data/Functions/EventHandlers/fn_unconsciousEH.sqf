/*
 * Author: DartRuffian
 * Event handler for ace_unconscious, plays a voice line when a player is knocked unconscious
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CWR_fnc_unconsciousEH;
 */


if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};
if !(CWR_AutoMessages_Uncon) exitWith {};

[
    "ace_unconscious",
    {
        params ["_unit", "_state"];
        if !(isPlayer _unit) exitWith {};
        if !(_state) exitWith {};
        if (isDedicated) exitWith {};

        private _nearbyPlayers = [getPosATL _unit, CWR_Voice_VoiceRadius, CWR_Voice_RCUnitsSendsMessages] call CWR_fnc_getNearbyPlayers;
        format ["_nearbyPlayers = %1", _nearbyPlayers] call CWR_fnc_devLog;

        // TODO: Move to own function
        private _sortByDistance = _nearbyPlayers apply
        {
            [_unit distance _x, _x];
        };
        _sortByDistance sort true;
        _nearbyPlayers = _sortByDistance apply { _x#1 };
        format ["Sorted _nearbyPlayers = %1", _nearbyPlayers] call CWR_fnc_devLog;

        {
            format ["Creating message for %1", _x] call CWR_fnc_devLog;
            [_nearbyPlayers#1, format ["%1 is down!", name _unit]] remoteExecCall ["CWR_fnc_sendLocalMessage", _x];
        } forEach _nearbyPlayers;
    }
] call CBA_fnc_addEventHandler;