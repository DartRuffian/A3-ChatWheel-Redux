// CBA's implementation of Hashmaps are sorted by insertion order, while BIS game's are not.
// Order is important since the order of the keys is how they are displayed in the chat menu.
CWR_messagesHashMap =
[
    [
        ["Medic", "I need a medic!"],
        ["Help", "Help me!"],
        ["Apologize", "Sorry!"],
        ["Follow", "Follow me!"],
        ["Contact", "Infantry [contact]!"],
        ["Vehicle", "Vehicle [contact]!"],
        ["Fortification", "Fortification [contact]!"],
        ["Low Ammo", "I need ammo for my [weapon]!"],
        ["ACE Check", "Status [status]!"],
        ["Launchers", "[launcher]"],
        ["Custom 1", "Default Message"], // Configurable messages that can be set in the addon options
        ["Custom 2", "Default Message"],
        ["Custom 3", "Default Message"],
        ["Custom 4", "Default Message"]
    ],
    "Default Message"
] call CBA_fnc_hashCreate;


// Main Root Menu, this is what's opened by the keybind
[
    "Speak!",
    "CWR_Menu_Root",
    [CWR_messagesHashMap] call CBA_fnc_hashKeys,
    "",
    "[([CWR_messagesHashMap] call CBA_fnc_hashValues) select %2] call CWR_fnc_SendMessage"
] call BIS_fnc_CreateMenu;


// Distance Menu, used to get the user's choice of close, medium, or far distances
CWR_OpenDistanceMenu =
{
    params ["_message"];
    sleep 0.05;
    
    private _distanceList = ["Close", "Mid", "Far"];
    CWR_distanceMessageList = _distanceList apply { _message + " " + _x + "!" };
    //  distanceMessageList must be global because no other values can 
    //  be passed to the expression parameter of BIS_fnc_CreateMenu
    
    [
        "How far?",
        "CWR_Menu_Distance",
        _distanceList,
        "",
        "[[CWR_distanceMessageList select %2] call CWR_fnc_RemoveQuotes] call CWR_fnc_SendMessage"
    ] call BIS_fnc_CreateMenu;

    showCommandingMenu "#USER:CWR_Menu_Distance_0";
};


CWR_OpenStatusMenu =
{
    params ["_message"];
    sleep 0.05;
    
    private _statusList = ["Green", "Yellow", "Orange", "Red", "Black"];
    CWR_statusMessageList = _statusList apply { [_message, "[status]", _x] call CWR_fnc_StringReplace; };
    
    [
        "How are you?",
        "CWR_Menu_Status",
        _statusList,
        "",
        "[[CWR_statusMessageList select %2] call CWR_fnc_RemoveQuotes] call CWR_fnc_SendMessage"
    ] call BIS_fnc_CreateMenu;

    showCommandingMenu "#USER:CWR_Menu_Status_0";
};


CWR_OpenLauncherMenu =
{
    params ["_message"];
    sleep 0.05;
    
    private _launcherList = ["Permission to fire?", "Clear backblast!", "Backblast clear!", "Rocket! Rocket! Rocket!"];
    CWR_launcherMessageList = _launcherList apply { [_message, "[launcher]", _x] call CWR_fnc_StringReplace; };
    
    [
        "Launcher",
        "CWR_Menu_Launcher",
        _launcherList,
        "",
        "[[CWR_launcherMessageList select %2] call CWR_fnc_RemoveQuotes] call CWR_fnc_SendMessage"
    ] call BIS_fnc_CreateMenu;

    showCommandingMenu "#USER:CWR_Menu_Launcher_0";
};