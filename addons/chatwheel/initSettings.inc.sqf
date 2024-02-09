[
    QGVAR(invertScroll),
    "CHECKBOX",
    [LLSTRING(setting_invertedScrolling), LLSTRING(settingDescription_invertedScrolling)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_controls)],
    false
] call CBA_fnc_addSetting;

// Custom Messages
[
    QGVAR(customMessages_one),
    "EDITBOX",
    [LLSTRING(setting_customMessages_one), LLSTRING(settingDescription_customMessages)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_customMessages)],
    "",
    0,
    {
        if (_this != "") then {
            ["UserCustom1", LLSTRING(setting_customMessages_one), _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom1" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_two),
    "EDITBOX",
    [LLSTRING(setting_customMessages_two), LLSTRING(settingDescription_customMessages)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_customMessages)],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom2", LLSTRING(setting_customMessages_two), _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom2" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_three),
    "EDITBOX",
    [LLSTRING(setting_customMessages_three), LLSTRING(settingDescription_customMessages)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_customMessages)],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom3", LLSTRING(setting_customMessages_three), _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom3" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(customMessage_four),
    "EDITBOX",
    [LLSTRING(setting_customMessages_four), LLSTRING(settingDescription_customMessages)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_customMessages)],
    "",
    0,
    {
        if (!(_this isEqualTo "")) then {
            ["UserCustom4", LLSTRING(setting_customMessages_four), _this, -1, true] call FUNC(addMessage);
        } else {
            "UserCustom4" call FUNC(removeMessage);
        };
    }
] call CBA_fnc_addSetting;

// Automatic Messages
[
    QGVAR(autoMessages_enabled),
    "CHECKBOX",
    [LLSTRING(setting_autoMessages_enabled), LLSTRING(settingDescription_autoMessages_enabled)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_autoMessages)],
    true,
    FALSE
] call CBA_fnc_addSetting;

if (ADDON_LOADED(ace_medical)) then {
    [
        QGVAR(autoMessages_enabledUnconscious),
        "CHECKBOX",
        [LLSTRING(setting_autoMessages_enabledUnconscious), LLSTRING(settingDescription_autoMessages_enabledUnconscious)],
        [QUOTE(MOD_NAME), LLSTRING(settingCategory_autoMessages)],
        true,
        TRUE
    ] call CBA_fnc_addSetting;
};

[
    QGVAR(autoMessages_enabledGrenades),
    "CHECKBOX",
    [LLSTRING(setting_autoMessages_enabledGrenades), LLSTRING(settingDescription_autoMessages_enabledGrenades)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_autoMessages)],
    true,
    TRUE
] call CBA_fnc_addSetting;

// Voice Lines
[
    QGVAR(voice_enabled),
    "CHECKBOX",
    [LLSTRING(setting_voice_enabled), LLSTRING(settingDescription_voice_enabled)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_voice)],
    true,
    FALSE
] call CBA_fnc_addSetting;

[
    QGVAR(voice_cooldown),
    "SLIDER",
    [LLSTRING(setting_voice_cooldown), LLSTRING(settingDescription_voice_cooldown)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_voice)],
    [0, 15, 3, 0],
    TRUE
] call CBA_fnc_addSetting;

[
    QGVAR(voice_radius),
    "SLIDER",
    [LLSTRING(setting_voice_radius), LLSTRING(settingDescription_voice_radius)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_voice)],
    [10, 50, 30, 0],
    TRUE
] call CBA_fnc_addSetting;

[
    QGVAR(voice_volume),
    "SLIDER",
    [LLSTRING(setting_voice_volume), LLSTRING(settingDescription_voice_volume)],
    [QUOTE(MOD_NAME), LLSTRING(settingCategory_voice)],
    [0, 5, 1, 1]
] call CBA_fnc_addSetting;