#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Loads all messages from CWR_ChatWheel_Messages during PreStart and stores them in the UI namespace for use in-game.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call CWR_ChatWheel_fnc_loadMessagesFromConfig;
 */

params [["_reloadFromConfig", false, [false]]];
private ["_messageConfig", "_messageList", "_voiceLineConfig", "_voiceLineList"];
TRACE_1("fnc_scanConfig",_reloadFromConfig);

_messageConfig = configProperties [configFile >> QGVAR(messages)];
_messageList = GETUVAR(GVAR(messages),createHashmap);

if (count _messageList isEqualTo 0 or _reloadFromConfig) then {
    _messageList = createHashmap;
    {
        _messageList insert [[
            configName _x,
            [
                getText (_x >> "displayName"),
                getText (_x >> "message"),
                getNumber (_x >> "order")
            ]
        ]];
    } forEach _messageConfig;

    SETUVAR(GVAR(messages),_messageList);
};

_voiceLineConfig = configProperties [configFile >> QGVAR(voiceLines)];
_voiceLineList = GETUVAR(GVAR(voiceLines),createHashmap);

if (count _voiceLineList isEqualTo 0 or _reloadFromConfig) then {
    _voiceLineList = createHashmap;
    {
        _voiceLineList insert [[
            configName _x,
            [_x, "voiceLines", []] call BIS_fnc_returnConfigEntry
        ]];
    } forEach _voiceLineConfig;

    SETUVAR(GVAR(voiceLines),_voiceLinesList);
};

_tagsConfig = configProperties [configFile >> QGVAR(tags)];
_tagsList = GETUVAR(GVAR(tags),createHashmap);

if (count _tagsList isEqualTo 0 or _reloadFromConfig) then {
    _tagsList = createHashmap;
    {
        _tagsList insert [[
            configName _x,
            [
                getText (_x >> "description"),
                compile (getText (_x >> "statement")),
                getText (_x >> "example")
            ]
        ]];
    } forEach _tagsConfig;

    SETUVAR(GVAR(tags),_tagsList);
};