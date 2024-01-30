#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Loads messages, tags, and voice line classes to uiNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(scanConfig);
 */

params [["_reloadFromConfig", false, [false]]];
private ["_messageConfig", "_messageList", "_voiceLineConfig", "_voiceLineList"];
TRACE_1("fnc_scanConfig",_reloadFromConfig);

_messageConfig = configProperties [configFile >> QGVAR(messages)];
_messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];

if (count _messageList isEqualTo 0 or _reloadFromConfig) then {
    _messageList = createHashmap;
    {
        _messageList insert [[configName _x, [
            getText (_x >> "displayName"),
            getText (_x >> "message"),
            getNumber (_x >> "order")
        ]]];
    } forEach _messageConfig;

    uiNamespace setVariable [QGVAR(messages), _messageList];
};

_voiceLineConfig = configProperties [configFile >> QGVAR(voiceLines)];
_voiceLineList = uiNamespace getVariable [QGVAR(voiceLines), createHashmap];

if (count _voiceLineList isEqualTo 0 or _reloadFromConfig) then {
    _voiceLineList = createHashmap;
    {
        _voiceLineList insert [[configName _x,
            [_x, "voiceLines", []] call BIS_fnc_returnConfigEntry
        ]];
    } forEach _voiceLineConfig;

    uiNamespace setVariable [QGVAR(voiceLines), _voiceLinesList];
};

_tagsConfig = configProperties [configFile >> QGVAR(tags)];
_tagsList = uiNamespace getVariable [QGVAR(tags), createHashmap];

if (count _tagsList isEqualTo 0 or _reloadFromConfig) then {
    _tagsList = createHashmap;
    {
        _tagsList insert [[configName _x, [
            getText (_x >> "description"),
            compile (getText (_x >> "statement")),
            getText (_x >> "example")
        ]]];
    } forEach _tagsConfig;

    uiNamespace setVariable [QGVAR(tags), _tagsList];
};