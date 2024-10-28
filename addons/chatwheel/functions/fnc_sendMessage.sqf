#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Takes a message and author, processes the tags in the message, and sends it to the given channel.
 *
 * Arguments:
 * 0: The message to send, optionally with [tags] <STRING>
 * 1: The author of the message (optional, default: player) <OBJECT>
 * 2: The channel / target to send the message in (optional, default: "side") <STRING>
 *    - Can be one of:
 *      1: "side" - Sends message in side channel on author's side.
 *      2: "group" - Sends message in group channel in author's group.
 *      3: "side-local" - Sends message in side chat, but only displays to player's within a given distance. Fourth parameter is range in meters.
 *      4: "global" - Sends message in global chat <ANY>
 * 3: Target data (optional, default: nil) <ANY>
 *    - This parameter will be used differently for each channel or target.
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["A message, optionally with [tags]"] call cwr_chatwheel_fnc_sendMessage;
 * ["A local message", player, "side-local", 10] call cwr_chatwheel_fnc_sendMessage;
 *
 * Public: Yes
 */

params [
    ["_rawMessage", "", [""]],
    ["_author", objNull, [objNull]],
    ["_channel", "side", [""]],
    ["_targetData", nil, []]
];
TRACE_4("fnc_sendMessage",_rawMessage,_author,_channel,_targetData);

if (_rawMessage isEqualTo "") exitWith {};

if (isNull _author) then {
    _author = [] call CBA_fnc_currentUnit;
};

_message = [_author, _rawMessage] call FUNC(processTags);

private _target = switch (_channel) do {
    case "group": {["groupChat", group _author]};
    case "side-local": {
        private _nearbyPlayers = [ASLToAGL getPosASL _author, _targetData] call EFUNC(common,getNearbyPlayers);
        ["sideChat", _nearbyPlayers];
    };
    case "global": {["globalChat", 0]};
    default {["sideChat", side _author]};
};

[_author, _message] remoteExecCall _target;
[QGVAR(onMessage), [_author, _message, _rawMessage]] call CBA_fnc_localEvent;
INFO_2("%1 is sending message: %2",_author,_message);