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

params [];
private ["_messageConfig", "_messageList", "_voiceLineConfig", "_voiceLineList"];
TRACE_1("fnc_scanConfig", nil);

_messageConfig = configProperties [configFile >> QGVAR(messages)];
_messageList = uiNamespace getVariable [QGVAR(messages), createHashmap];

{
    _messageList insert [
        [
            configName _x,
            [
                getText (_x >> "displayName"),
                getText (_x >> "message"),
                getNumber (_x >> "order")
            ]
        ]
    ];
} forEach _messageConfig;

uiNamespace setVariable [QGVAR(messages), _messageList];

_voiceLineConfig = configProperties [configFile >> QGVAR(voiceLines)];
_voiceLineList = uiNamespace getVariable [QGVAR(voiceLines), createHashmap];

{
    _voiceLineList insert [
        [
            configName _x,
            [_x, "voiceLines", []] call BIS_fnc_returnConfigEntry
        ]
    ];
} forEach _voiceLineConfig;

uiNamespace setVariable [QGVAR(voiceLines), _voiceLineList];

_tagsConfig = configProperties [configFile >> QGVAR(tags)];
_tagsList = uiNamespace getVariable [QGVAR(tags), createHashmap];

{
    _tagsList insert [
        [
            configName _x,
            [
                getText (_x >> "description"),
                compile (getText (_x >> "statement")),
                getText (_x >> "example")
            ]
        ]
    ];
} forEach _tagsConfig;

uiNamespace setVariable [QGVAR(tags), _tagsList];