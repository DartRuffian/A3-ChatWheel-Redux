#include "..\script_component.hpp"
/*
 * Author: Dart
 * Loads messages, tags, and voice line classes to HashMaps in uiNamespace.
 *
 * Arguments:
 * 0: Reload from config (optional, default: false) <BOOL>
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
    ["_reload", false]
];
TRACE_1("fnc_scanConfig",_reload);

private _messageConfig = configProperties [configFile >> QGVAR(messages)];
private _messageList = uiNamespace getVariable [QGVAR(messages), createHashMap];

if (_reload or {_messageList isEqualTo createHashMap}) then {
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

if (_reload or {_voiceLineList isEqualTo createHashMap}) then {
    _voiceLineList = createHashMap;
    {
        _voiceLineList insert [[configName _x, getArray (_x >> "voiceLines")]];
    } forEach _voiceLineConfig;

    uiNamespace setVariable [QGVAR(voiceLines), _voiceLinesList];
};

_tagsConfig = configProperties [configFile >> QGVAR(tags)];
_tagsList = uiNamespace getVariable [QGVAR(tags), createHashMap];

if (_reload or {_tagsList isEqualTo createHashMap}) then {
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