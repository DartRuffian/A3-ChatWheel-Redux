/*
 * Author: DartRuffian
 * Given a bearing, an integer ranging from 0 to 360.
 *
 * Arguments:
 * 0: The message to send, optionally with [tags] <String>
 *
 * Return Value:
 * None
 *
 * Example:
 * "I need ammo for my [currentWeapon]" call CWR_fnc_SendMessage;
 * // Sends "I need ammo for my [KC] DC-15S" to all members in the player's group
 */

params ["_message"];

switch (true) do
{
    case ("[callOut]" in _message):
    {
        private _bearing = round direction player;
        private _facing = _bearing call CWR_fnc_GetDirFromBearing;

        _message insert [0, "Contact!"];
        _contactCall = [_message, "[callOut]", format ["%1, bearing %2", _facing, _bearing]] call CWR_fnc_StringReplace;
        [_contactCall] spawn CWR_OpenDistanceMenu;
    };

    case ("[currentWeapon]" in _message):
    {
        private _currentWeapon = currentWeapon player;
        _currentWeapon = getText (configFile >> "CfgWeapons" >> _currentWeapon >> "displayName");
        _message = [_message, "[currentWeapon]", _currentWeapon] call CWR_fnc_StringReplace;
        _message call CWR_fnc_SendMessage;
    };

    default
    {
        params ["_message"];
        
        // Why is chat not global...
        [player, _message] remoteExecCall ["groupChat", (units group player)];
    };
};