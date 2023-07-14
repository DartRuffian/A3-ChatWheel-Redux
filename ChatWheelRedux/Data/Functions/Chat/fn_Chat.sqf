CWR_nearorfar =
{
    params ["_message"];
    sleep 0.05;
    
    _caller = player;
    _distancelist = ["Close!", "Mid!", "Far!"];
    CWR_distantmessageslist = [];
    {
        CWR_distantmessageslist pushback ([_message,_x] joinstring " ");
    } foreach _distancelist;
    ["How far?", "b", _distancelist, "",


    "[CWR_distantmessageslist select %2] call CWR_speak"] call BIS_FNC_createmenu;
    showCommandingMenu "#USER:b_0";
};

CWR_speak =
{
    params ["_message"];

    switch(_message) do
    {

        case ("callOut"):
        {
            private _bearing = direction player;
            private _facing = _bearing call CWR_GetDirFromBearing;

            _azimuthstring = ["Bearing ", _bearing, "!"] joinstring "";
            _contactcall = ["Contact!", _facing, _azimuthstring] joinstring " ";
            [_contactcall] spawn CWR_nearorfar;
        };

        case ("callOutVic"):
        {
            private _bearing = direction player;
            private _facing = _bearing call CWR_GetDirFromBearing;

            _azimuthstring = ["Bearing ", _bearing, "!"] joinstring "";
            _contactcall = ["Vehicle!", _facing, _azimuthstring] joinstring " ";
            [_contactcall] spawn CWR_nearorfar;
        };

        case ("callOutFort"):
        {
            private _bearing = direction player;
            private _facing = _bearing call CWR_GetDirFromBearing;

            _azimuthstring = ["Bearing ", _bearing, "!"] joinstring "";
            _contactcall = ["Fortification!", _facing, _azimuthstring] joinstring " ";
            [_contactcall] spawn CWR_nearorfar;
        };
        
        default
        {
            params ["_message"];
            _caller = player;
            [_caller, _message] remoteExeccall ["groupChat", (units group _caller)];
        };
    };
};


["Speak!", "b", CWR_messagemenulist, "", "[CWR_messageslist select %2] call CWR_speak"] call BIS_FNC_createmenu;
showCommandingMenu "#USER:b_0";