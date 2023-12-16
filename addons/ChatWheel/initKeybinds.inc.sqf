#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    GVAR(key_openMenu),
    ["Open Menu", "Opens the custom chat menu."],
    {
        call FUNC(openChatWheel);
    },     // KeyDown
    {},    // KeyUp
    [],    // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;
