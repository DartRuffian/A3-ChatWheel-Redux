knd_messagemenulist = ["Medic", "Help", "Apologize", "Follow", "Call out contact", "Call out vehicle", "Call out fortification", "Low Ammo","Custom 1", "Custom 2", "Custom 3", "Custom 4"];

knd_messageslist = ["Medic!", "Help me!", "Sorry!", "Follow me!", "callOut","callOutVic", "callOutFort", "Low on Ammunition!", "Default Custom 1", "Default Custom 2", "Default Custom 3", "Default Custom 4"];


[
    "jen_chat_message1", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Custom Message 1", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Jen ChatMod", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["Default"], // data for this setting: [min, max, default, number of shown trailing decimals]
    2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
		knd_messageslist set [8,_this];
	}, // function that will be executed once on mission start and every time the setting is changed.
    true
] call CBA_fnc_addSetting;


[
    "jen_chat_message2", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Custom Message 2", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Jen ChatMod", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["Default"], // data for this setting: [min, max, default, number of shown trailing decimals]
    2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
		knd_messageslist set [9,_this];
	}, // function that will be executed once on mission start and every time the setting is changed.
    true
] call CBA_fnc_addSetting;

[
    "jen_chat_message3", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Custom Message 3", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Jen ChatMod", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["Default"], // data for this setting: [min, max, default, number of shown trailing decimals]
    2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
		knd_messageslist set [10,_this];
	}, // function that will be executed once on mission start and every time the setting is changed.
    true
] call CBA_fnc_addSetting;

[
    "jen_chat_message4", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Custom Message 4", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Jen ChatMod", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ["Default"], // data for this setting: [min, max, default, number of shown trailing decimals]
    2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
		knd_messageslist set [11,_this];
	}, // function that will be executed once on mission start and every time the setting is changed.
    true
] call CBA_fnc_addSetting;

