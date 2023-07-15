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
        "[[CWR_distanceMessageList select %2] call CWR_fnc_RemoveQuotes] call CWR_Speak"
    ] call BIS_fnc_CreateMenu;
    showCommandingMenu "#USER:CWR_Menu_Distance_0";
};

CWR_Speak =
{
    params ["_message"];

    switch (true) do
    {

        case ("[callOut]" in _message):
        {
            private _bearing = round direction player;
            private _facing = _bearing call CWR_fnc_GetDirFromBearing;

            // "Infantry [callOut]"
            _message insert [0, "Contact!"];
            _contactCall = [_message, "[callOut]", format ["%1, bearing %2", _facing, _bearing]] call CWR_fnc_StringReplace;
            [_contactCall] spawn CWR_NearOrFar;
        };

        default
        {
            params ["_message"];
            
            // Why is chat not global...
            [player, _message] remoteExeccall ["groupChat", (units group player)];
        };
    };
};


[
    "Speak!",
    "CWR_Menu_Root",
    [CWR_messagesHashMap] call CBA_fnc_hashKeys,
    "",
    "[([CWR_messagesHashMap] call CBA_fnc_hashValues) select %2] call CWR_Speak"
] call BIS_fnc_CreateMenu;

showCommandingMenu "#USER:CWR_Menu_Root_0";