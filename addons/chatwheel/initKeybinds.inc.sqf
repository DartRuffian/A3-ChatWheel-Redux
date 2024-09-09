#include "\z\cwr\addons\main\data\hpp\defineDIKCodes.inc"

[
    _category, QGVAR(key_openMenu),
    [LLSTRING(key_openMenu), LLSTRING(keyDescription_openMenu)], {
        if ([] call FUNC(toggleChatWheel)) then {
            [] call FUNC(populateChatWheel);
        };
    }
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_selectMessage),
    [LLSTRING(key_selectMessage), LLSTRING(keyDescription_selectMessage)],
    {
        private ["_display"];
        _display = uiNamespace getVariable ["CWR_RscChatWheel", displayNull];
        if (!isNull _display) then {
            call FUNC(selectMessage);
            call FUNC(closeChatWheel);
        };
    }, {}, [DIK_SPACE, false, false, false]
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_scrollUp),
    [LLSTRING(key_scrollUp), LLSTRING(keyDescription_scrollUp)], {
        GVAR(useInvertedScrolling) call FUNC(handleScroll);
    }, {},  [DIK_MOUSEUP, false, false, false]
] call CBA_fnc_addKeybind;

[
    _category, QGVAR(key_scrollDown),
    [LLSTRING(key_scrollDown), LLSTRING(keyDescription_scrollDown)], {
        !GVAR(useInvertedScrolling) call FUNC(handleScroll);
    }, {}, [DIK_MOUSEDOWN, false, false, false]
] call CBA_fnc_addKeybind;