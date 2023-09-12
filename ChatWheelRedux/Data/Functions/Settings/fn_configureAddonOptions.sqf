// WIKI: https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#creating-a-setting

[
    "CWR_CustomMessages_1",
    "EDITBOX",
    ["Custom Message 1", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    "Default",
    0,
    {
        [CWR_messagesHashMap, "Custom 1", _this] call CBA_fnc_hashSet;
    }
] call CBA_fnc_addSetting;


[
    "CWR_CustomMessages_2",
    "EDITBOX",
    ["Custom Message 2", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    "Default",
    0,
    {
        [CWR_messagesHashMap, "Custom 2", _this] call CBA_fnc_hashSet;
    }
] call CBA_fnc_addSetting;

[
    "CWR_CustomMessages_3",
    "EDITBOX",
    ["Custom Message 3", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    "Default",
    0,
    {
        [CWR_messagesHashMap, "Custom 3", _this] call CBA_fnc_hashSet;
    }
] call CBA_fnc_addSetting;

[
    "CWR_CustomMessages_4",
    "EDITBOX",
    ["Custom Message 4", "Custom message that can be used in the Chat Wheel. Custom messages support [tags]."],
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    "Default",
    0,
    {
        [CWR_messagesHashMap, "Custom 4", _this] call CBA_fnc_hashSet;
    }
] call CBA_fnc_addSetting;


[
    "CWR_AutoMessages_Enabled",
    "CHECKBOX",
    ["Enable Automated Messages", "Enables messages automatically being sent when certain actions are done. Throwing a grenade, getting hurt, etc."],
    ["ARMA 3 Chat Wheel - Redux", "Automated Messages"],
    true,
    0,
    {}
] call CBA_fnc_addSetting;

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
{
    [
        "CWR_AutoMessages_Uncon",
        "CHECKBOX",
        ["Unconscious Messages", "When a player goes unconscious, the closest player will make a call out. The max radius is still bound by CWR_Voice_VoiceRadius."],
        ["ARMA 3 Chat Wheel - Redux", "Automated Messages"],
        true,
        1,
        {}
    ] call CBA_fnc_addSetting;
};

[
    "CWR_TagMenu_UseNewLine",
    "CHECKBOX",
    ["Separate examples with newline", "If enabled, example messages are separate with a newline, rather than an arrow."],
    ["ARMA 3 Chat Wheel - Redux", "Tag Menu"],
    true,
    0,
    {},
    true
] call CBA_fnc_addSetting;


[
    "CWR_Voice_VoiceRadius",
    "SLIDER",
    ["Voice Lines Radius", "The radius of voice lines and automated messages."],
    ["ARMA 3 Chat Wheel - Redux", "Voice"],
    [10, 50, 30, 0],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    "CWR_Voice_VoiceVolume",
    "SLIDER",
    ["Voice Lines Volume", "Volume for custom voice lines."],
    ["ARMA 3 Chat Wheel - Redux", "Voice"],
    [0, 5, 1, 1]
] call CBA_fnc_addSetting;

[
    "CWR_Voice_EnableVoiceLines",
    "CHECKBOX",
    ["Enable Custom VoiceLines", "If enabled, you will hear voice lines when certain actions are done. Such as throwing a grenade, using a chat wheel option, etc."],
    ["ARMA 3 Chat Wheel - Redux", "Voice"],
    true,
    0,
    {},
    false
] call CBA_fnc_addSetting;

CWR_Voice_RCUnitsSendsMessages = false; // Wip
// [
//     "CWR_Voice_RCUnitsSendsMessages",
//     "CHECKBOX",
//     ["RC Units Send Messages", "If enabled, remote (zeus) controlled units will send messages and say voice lines."],
//     ["ARMA 3 Chat Wheel - Redux", "Voice"],
//     true,
//     0,
//     {},
//     true
// ] call CBA_fnc_addSetting;

[
    "CWR_Voice_CoolDown",
    "SLIDER",
    ["Custom VoiceLines Cooldown", "The minimum amount of time between custom voicelines. This cooldown is per player."],
    ["ARMA 3 Chat Wheel - Redux", "Voice"],
    [0, 15, 3, 0],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    "CWR_Debug_ShowMessages",
    "CHECKBOX",
    ["Show Debug Messages", "Shows debug messages for Chat Wheel Redux, useful for trying to figure out if something is going wrong."],
    ["ARMA 3 Chat Wheel - Redux", "Debug"],
    false,
    0,
    {},
    false
] call CBA_fnc_addSetting;