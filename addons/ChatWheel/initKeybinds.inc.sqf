#include "\DA\CWR\addons\Core\data\hpp\defineDIKCodes.inc"

[
    [QUOTE(MOD_NAME), QUOTE(COMPONENT_BEAUTIFIED)],
    GVAR(key_openMenu),
    ["Open/Close Menu", "Opens or closes the chat menu."],
    {
        call FUNC(toggleChatWheel);
    },     // KeyDown
    {},    // KeyUp
    [],    // Default Key
    false, // Hold Key
    0,     // Hold Key Delay
    false  // Overwrite
] call CBA_fnc_addKeybind;
