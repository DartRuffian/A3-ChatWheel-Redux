#include "..\script_component.hpp"
/*
 * Author: Dart
 * Loads messages, tags, and voice line classes to HashMaps in uiNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call cwr_chatwheel_fnc_scanConfig;
 *
 * Public: No
 */

params [
    ["_reloadFromConfig", false, [false]]
];
TRACE_1("fnc_scanConfig",_reloadFromConfig);

private _messageConfig = configProperties [configFile >> QGVAR(messages)];
private _messageList = uiNamespace getVariable [QGVAR(messages), createHashMap];

if (count _messageList isEqualTo 0 or _reloadFromConfig) then {
    _messageList = createHashMap;
    {
        _messageList insert [[configName _x, [
            getText (_x >> "displayName"),
            getText (_x >> "message"),
            getNumber (_x >> "order")
        ]]];
    } forEach _messageConfig;

    uiNamespace setVariable [QGVAR(messages), _messageList];
};

private _voiceLineConfig = configProperties [configFile >> QGVAR(voiceLines)];
private _voiceLineList = uiNamespace getVariable [QGVAR(voiceLines), createHashMap];

if (count _voiceLineList isEqualTo 0 or _reloadFromConfig) then {
    _voiceLineList = createHashMap;
    {
        _voiceLineList insert [[configName _x,
            [_x, "voiceLines", []] call BIS_fnc_returnConfigEntry
        ]];
    } forEach _voiceLineConfig;

    uiNamespace setVariable [QGVAR(voiceLines), _voiceLinesList];
};

_tagsConfig = configProperties [configFile >> QGVAR(tags)];
_tagsList = uiNamespace getVariable [QGVAR(tags), createHashMap];

if (count _tagsList isEqualTo 0 or _reloadFromConfig) then {
    _tagsList = createHashMap;
    {
        _tagsList insert [[configName _x, [
            getText (_x >> "description"),
            compile (getText (_x >> "statement")),
            getText (_x >> "example")
        ]]];
    } forEach _tagsConfig;

    uiNamespace setVariable [QGVAR(tags), _tagsList];
};