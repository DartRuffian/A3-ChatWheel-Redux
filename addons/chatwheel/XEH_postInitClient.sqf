#include "script_component.hpp"

if !(profileNamespace getVariable [QGVAR(seenFirstUseHint), false]) then {
    [[QGVAR(UserGuide), "KeybindsAndOptions"], 15, "", 35, "", true, true, true] call BIS_fnc_advHint;
    profileNamespace setVariable [QGVAR(seenFirstUseHint), true];
};

["CBA_settingsInitialized", {
    if (ADDON_LOADED(ace_medical)) then {
        ["ace_unconscious", LINKFUNC(unconscious)] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;