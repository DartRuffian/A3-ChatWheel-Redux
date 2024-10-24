#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Sends a message for a unit falling unconscious, only works for ACE Medical.
 *
 * Arguments:
 * 0: The unit falling unconscious or waking up <OBJECT>
 * 1: Unconscious state <BOOL>
 *
 * Return Value:
 * None
 *
 * Examples:
 * ["ace_unconscious", cwr_chatwheel_fnc_unconscious] call CBA_fnc_addEventHandler;
 *
 * Public: No
 */

params ["_unit", "_state"];
TRACE_2("fnc_unconscious",_unit,_state);

if (!GVAR(autoMessages_enabledUnconscious) or {!_state} or {isNull _unit}) exitWith {};

private _positionAGL = ASLToAGL getPosASL _unit;
private _nearbyPlayers = [_positionAGL, GVAR(voice_radius)] call EFUNC(main,getNearbyPlayers) select {_x call ace_common_fnc_isAwake};
_nearbyPlayers = [_positionAGL, _nearbyPlayers] call EFUNC(main,sortByDistance);

[format [LLSTRING(message_Unconscious), name _unit], _nearbyPlayers#0, "side-local", GVAR(voice_radius)] call FUNC(sendMessage);