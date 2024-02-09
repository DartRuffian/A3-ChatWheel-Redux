#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Takes a processed message and sends it.
 *
 * Arguments:
 * 0: The message to send, optionally with [tags] <STRING>
 * 1: The author of the message (optional, default: player) <OBJECT>
 * 2: The channel / target to send the message in (optional, default: "side") <STRING>
 *    - Can be one of:
 *      1: "side" - Sends message in side channel on author's side
 *      2: "group" - Sends message in group channel in author's group
 *      3: "side-local" - Sends message in side chat, but only displays to player's within a given distance. Fourth parameter is range in meters.
 * 3: Target data, varies depending on channel (optional, default: nil)<ANY>
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * ["A message, optionally with [tags]"] call FUNC(sendMessage);
 */

params [
    ["_rawMessage", "", [""]],
    ["_author", player, [objNull]],
    ["_channel", "side", [""]],
    ["_targetData", nil, []]
];
private ["_target"];
TRACE_4("fnc_sendMessage",_rawMessage,_author,_channel,_targetData);

if (_rawMessage isEqualTo "") exitWith {};

_message = [_author, _rawMessage] call FUNC(processTags);

_target = switch (_channel) do {
    case "group": {["groupChat", group _author]};
    case "side-local": {
        private ["_nearbyPlayers"];
        _nearbyPlayers = [ASLToAGL getPosASL _author, _targetData] call EFUNC(main,getNearbyPlayers);
        ["sideChat", _nearbyPlayers];
    };
    default {["sideChat", side _author]};
};

[_author, _message] remoteExecCall _target;
[QGVAR(onMessage), [_author, _message, _rawMessage]] call CBA_fnc_localEvent;
INFO_2("%1 is sending message: %2",_author,_message);