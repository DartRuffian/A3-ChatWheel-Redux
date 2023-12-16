#include "..\script_component.hpp"
params ["_message"];

// _message call CWR_fnc_devLog;
_message = switch (true) do
{
    case ("[distance]" in _message):
    {
        [_message] spawn CWR_OpenDistanceMenu;
    };

    case ("[status]" in _message):
    {
        [_message] spawn CWR_OpenStatusMenu;
    };

    case ("[bearing]" in _message):
    {
        private _bearing = round direction player;
        _message = [_message, "[bearing]", str _bearing] call EFUNC(Core,stringReplace);
        _message call FUNC(processTags);
    };

    case ("[direction]" in _message):
    {
        private _bearing = round direction player;
        private _facing = _bearing call EFUNC(Core,getDirFromBearing);

        _message = [_message, "[direction]", _facing] call EFUNC(Core,stringReplace);
        _message call FUNC(processTags);
    };

    case ("[weapon]" in _message):
    {
        private _currentWeapon = getText (configFile >> "CfgWeapons" >> currentWeapon player >> "displayName");
        _message = [_message, "[weapon]", _currentWeapon] call EFUNC(Core,stringReplace);
        _message call FUNC(processTags);
    };

    case ("[launcher]" in _message):
    {
        [_message] spawn CWR_OpenLauncherMenu;
    };

    // Voice line tag, plays random sound from config class that matches the name in the tag
    // Checks for "[vl-ABC] ..."
    // regexMatch checks if the entire string matches the pattern, not just a part of it
    case (count (_message call FUNC(findAllVoicelineTags)) > 0):
    {
        private _tag = _message call FUNC(findAllVoicelineTags) select 0 select 0 select 0; // Returns nested array
        private _configName = _tag call FUNC(getConfigNameFromTag);

        _message = [_message, _tag, ""] call EFUNC(Core,stringReplace);

        private _config = (configFile >> "CWR_VoiceLines" >> _configName);
        if (isClass _config) then
        {
            if ((time - (player getVariable [QGVAR(playerLastUsedVoice), -GVAR(voice_cooldown)])) > GVAR(voice_cooldown) ) then
            {
                private _voiceLine = selectRandom getArray (_config >> "voiceLines");
                private _nearbyPlayers = [getPosATL player, GVAR(voice_radius)] call EFUNC(Core,getNearbyPlayers);

                {
                    [_voiceLine, getPosASL player] remoteExecCall [QUOTE(FUNC(playLocalSound)), _x];
                } forEach _nearbyPlayers;

                player setVariable [QGVAR(playerLastUsedVoice), time];
            };
        };

        _message call FUNC(processTags); // Used to check for further tags
    };

    default
    {
        params ["_message"];

        _message;
    };
};

_message;
