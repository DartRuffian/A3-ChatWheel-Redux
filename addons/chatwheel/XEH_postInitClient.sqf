#include "script_component.hpp"

if !(profileNameSpace getVariable [QGVAR(seenFirstUseHint), false]) then {
    [[QGVAR(UserGuide), "KeybindsAndOptions"], 15, "", 35, "", true, true, true] call BIS_fnc_advHint;
    profileNameSpace setVariable [QGVAR(seenFirstUseHint), true];
};