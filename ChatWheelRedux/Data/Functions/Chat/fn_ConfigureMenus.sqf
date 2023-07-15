// CBA's implementation of Hashmaps are sorted by insertion order, while BIS game's are not.
// Order is important since the order of the keys is how they are displayed in the chat menu.
CWR_messagesHashMap =
[
    [
        ["Medic", "I need a medic!"],
        ["Help", "Help me!"],
        ["Apologize", "Sorry!"],
        ["Follow", "Follow me!"],
        ["Contact", "Infantry [callOut]!"],
        // "[callout]" is replaced with the bearing, direction, and a distance, and 
        // "Contact!" is appended to the beginning
        ["Vehicle", "Vehicle [callOut]!"],
        ["Fortification", "Fortification [callOut]!"],
        ["Low Ammo", "I need ammo for my [weapon]!"],
        // "[weapon]" is replaced with the displayName of the player's current weapon
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
    /*
    * Author: DartRuffian
    * Gets a selected distance from a user using a BIS command menu and sends it to CWR_fnc_SendMessage.
    *
    * Arguments:
    * 0: The message to add the distance to <String>
    *
    * Return Value:
    * None
    *
    * Example:
    * "Contact!" call CWR_OpenDistanceMenu;
    */
    params ["_message"];
    sleep 0.05;
    
    private _distanceList = ["Close!", "Mid!", "Far!"];
    CWR_distanceMessageList = _distanceList apply { _message + " " + _x };
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