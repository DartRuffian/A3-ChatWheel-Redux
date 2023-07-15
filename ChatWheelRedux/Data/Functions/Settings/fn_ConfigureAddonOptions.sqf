// WIKI: https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#creating-a-setting

[
    "CWR_chat_message1",
    "EDITBOX",
    "Custom Message 1",
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    ["Default"],
    0,
    {
        [CWR_messagesHashMap, "Custom 1", _this] call CBA_fnc_hashSet;
    },
    true
] call CBA_fnc_AddSetting;


[
    "CWR_chat_message2",
    "EDITBOX",
    "Custom Message 2",
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    ["Default"],
    0,
    {
        [CWR_messagesHashMap, "Custom 2", _this] call CBA_fnc_hashSet;
    },
    true
] call CBA_fnc_AddSetting;

[
    "CWR_chat_message3",
    "EDITBOX",
    "Custom Message 3",
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    ["Default"],
    0,
    {
        [CWR_messagesHashMap, "Custom 3", _this] call CBA_fnc_hashSet;
    },
    true
] call CBA_fnc_AddSetting;

[
    "CWR_chat_message4",
    "EDITBOX",
    "Custom Message 4",
    ["ARMA 3 Chat Wheel - Redux", "Custom Messages"],
    ["Default"],
    0,
    {
        [CWR_messagesHashMap, "Custom 4", _this] call CBA_fnc_hashSet;
    },
    true
] call CBA_fnc_AddSetting;