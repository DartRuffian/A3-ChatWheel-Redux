CWR_NearOrFar =
{
    params ["_message"];
    sleep 0.05;
    
    private _distanceList = ["Close!", "Mid!", "Far!"];
    CWR_distanceMessageList = _distanceList apply {_message + " " + str _x};
    //  distanceMessageList must be global because no other values can 
    //  be passed to the expression parameter of BIS_fnc_CreateMenu

    ["How far?", "b", _distanceList, "", "[CWR_distanceMessageList select %2] call CWR_Speak"] call BIS_fnc_CreateMenu;
    showCommandingMenu "#USER:b_0";
};

CWR_Speak =
{
    params ["_message"];

    switch(_message) do
    {

        case ("callOut"):
        {
            private _bearing = round direction player;
            private _facing = _bearing call CWR_fnc_GetDirFromBearing;

            _azimuthString = ["Bearing ", _bearing, "!"] joinString "";
            _contactCall = ["Contact!", _facing, _azimuthString] joinString " ";
            [_contactCall] spawn CWR_NearOrFar;
        };

        case ("callOutVic"):
        {
            private _bearing = round direction player;
            private _facing = _bearing call CWR_fnc_GetDirFromBearing;

            _azimuthString = ["Bearing ", _bearing, "!"] joinString "";
            _contactCall = ["Vehicle!", _facing, _azimuthString] joinString " ";
            [_contactCall] spawn CWR_NearOrFar;
        };

        case ("callOutFort"):
        {
            private _bearing = round direction player;
            private _facing = _bearing call CWR_fnc_GetDirFromBearing;

            _azimuthString = ["Bearing ", _bearing, "!"] joinString "";
            _contactCall = ["Fortification!", _facing, _azimuthString] joinString " ";
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


["Speak!", "b", CWR_messagemenulist, "", "[CWR_messagesList select %2] call CWR_Speak"] call BIS_fnc_CreateMenu;
showCommandingMenu "#USER:b_0";