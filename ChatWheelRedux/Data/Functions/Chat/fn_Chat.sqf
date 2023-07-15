CWR_NearOrFar =
{
    params ["_message"];
    sleep 0.05;
    
    private _distanceList = ["Close!", "Mid!", "Far!"];
    CWR_distanceMessageList = _distanceList apply { _message + " " + str _x };
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


[
    "Speak!",
    "CWR_Menu_Root",
    [CWR_messagesHashMap] call CBA_fnc_hashKeys,
    "",
    "[([CWR_messagesHashMap] call CBA_fnc_hashValues) select %2] call CWR_fnc_SendMessage"
] call BIS_fnc_CreateMenu;

showCommandingMenu "#USER:CWR_Menu_Root_0";