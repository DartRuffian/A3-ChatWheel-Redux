#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Event handler for automated messages for throwing grenades. Works for vanilla and ace_player
 *
 * Arguments:
 * 0: The unit falling unconscious or waking up <OBJECT>
 * 1: Unconscious state <BOOL>
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["ace_unconscious", LINKFUNC(unconscious)] call CBA_fnc_addEventHandler;
 */

params ["_unit", "_state"];
private ["_positionAGL", "_nearbyPlayers"];
TRACE_2("fnc_unconscious",_unit,_state);

if (!GVAR(autoMessages_unconEnabled) or {isNull _unit or !_state}) exitWith {};

_positionAGL = ASLToAGL getPosASL _unit;
_nearbyPlayers = [_positionAGL, GVAR(voice_radius)] call EFUNC(main,getNearbyPlayers) select {_x call ace_common_fnc_isAwake};
_nearbyPlayers = [_positionAGL, _nearbyPlayers] call EFUNC(main,sortByDistance);

[format ["%1 is down!", name _unit], "side", _nearbyPlayers#0] call FUNC(sendMessage);