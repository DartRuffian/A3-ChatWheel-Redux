#include "\DA\CWR\addons\Core\data\hpp\defineDIKCodes.inc"

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_openMenu),
    ["Open/Close Menu", "Opens or closes the chat menu"],
    {
        call FUNC(toggleChatWheel);
    },     // KeyDown
    {},    // KeyUp
    [],    // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_selectMessage),
    ["Select Message", "Selects a message from the Chat Wheel to send"],
    {
        call FUNC(selectMessage);
        call FUNC(toggleChatWheel);
    },     // KeyDown
    {},    // KeyUp
    [DIK_SPACE, false, false, false],  // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_scrollUp),
    ["Scroll Up", "Scrolls up one option in the Chat Wheel"],
    {
        false call FUNC(handleScroll);
    },     // KeyDown
    {},    // KeyUp
    [DIK_MOUSEUP, false, false, false],    // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    QGVAR(key_scrollDown),
    ["Scroll Down", "Scrolls up one option in the Chat Wheel"],
    {
        true call FUNC(handleScroll);
    },     // KeyDown
    {},    // KeyUp
    [DIK_MOUSEDOWN, false, false, false],  // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;