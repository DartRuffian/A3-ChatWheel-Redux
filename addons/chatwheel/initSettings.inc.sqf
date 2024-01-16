// Custom Messages
[
    QGVAR(customMessages_one),
    "EDITBOX",
    ["Custom Message 1", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    [QUOTE(MOD_NAME), "Custom Messages"],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom1", "Custom 1", _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom1" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_two),
    "EDITBOX",
    ["Custom Message 2", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    [QUOTE(MOD_NAME), "Custom Messages"],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom2", "Custom 2", _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom2" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_three),
    "EDITBOX",
    ["Custom Message 3", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    [QUOTE(MOD_NAME), "Custom Messages"],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom3", "Custom 3", _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom3" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_four),
    "EDITBOX",
    ["Custom Message 4", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    [QUOTE(MOD_NAME), "Custom Messages"],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom4", "Custom 4", _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom4" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

// Automatic Messages
[
    QGVAR(autoMessages_enabled),
    "CHECKBOX",
    ["Enable Automated Messages", "Enables messages automatically being sent when certain actions are done. Throwing a grenade, getting hurt, etc."],
    [QUOTE(MOD_NAME), "Automatic Messages"],
    true,
    0,
    {}
] call CBA_fnc_addSetting;

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
{
    [
        QGVAR(autoMessages_unconEnabled),
        "CHECKBOX",
        ["Unconscious Messages", "When a player goes unconscious, the closest player will make a call out. The max radius is still bound by CWR_Voice_VoiceRadius. Only works with ACE Medical."],
        [QUOTE(MOD_NAME), "Automatic Messages"],
        true,
        1,
        {}
    ] call CBA_fnc_addSetting;
};

// Voice Lines
[
    QGVAR(voice_enabled),
    "CHECKBOX",
    ["Enable Custom VoiceLines", "If enabled, you will hear voice lines when certain actions are done. Such as throwing a grenade or using a chat wheel option."],
    [QUOTE(MOD_NAME), "Voice Lines"],
    true,
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(voice_cooldown),
    "SLIDER",
    ["Custom VoiceLines Cooldown", "The minimum amount of time between custom voicelines."],
    [QUOTE(MOD_NAME), "Voice Lines"],
    [0, 15, 3, 0],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(voice_radius),
    "SLIDER",
    ["Voice Lines Radius", "The radius of voice lines and automated messages."],
    [QUOTE(MOD_NAME), "Voice Lines"],
    [10, 50, 30, 0],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(voice_volume),
    "SLIDER",
    ["Voice Lines Volume", "Volume for custom voice lines."],
    [QUOTE(MOD_NAME), "Voice Lines"],
    [0, 5, 1, 1]
] call CBA_fnc_addSetting;