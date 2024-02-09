#include "\DA\CWR\addons\main\data\hpp\defineDIKCodes.inc"

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_openMenu),
    [LLSTRING(key_openMenu), LLSTRING(keyDescription_openMenu)],
    {
        if (call FUNC(toggleChatWheel)) then {
            [] call FUNC(populateChatWheel);
        };
    },     // KeyDown
    {},    // KeyUp
    []     // Default Key
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_selectMessage),
    [LLSTRING(key_selectMessage), LLSTRING(keyDescription_selectMessage)],
    {
        private ["_display"];
        _display = uiNamespace getVariable [QCLASS(RscChatWheel), displayNull];
        if (!isNull _display) then {
            call FUNC(selectMessage);
            call FUNC(closeChatWheel);
        };
    },     // KeyDown
    {},    // KeyUp
    [DIK_SPACE, false, false, false] // Default Key
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_scrollUp),
    [LLSTRING(key_scrollUp), LLSTRING(keyDescription_scrollUp)],
    {
        GVAR(useInvertedScrolling) call FUNC(handleScroll);
    },     // KeyDown
    {},    // KeyUp
    [DIK_MOUSEUP, false, false, false] // Default Key
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_scrollDown),
    [LLSTRING(key_scrollDown), LLSTRING(keyDescription_scrollDown)],
    {
        !GVAR(useInvertedScrolling) call FUNC(handleScroll);
    },     // KeyDown
    {},    // KeyUp
    [DIK_MOUSEDOWN, false, false, false] // Default Key
] call CBA_fnc_addKeybind;