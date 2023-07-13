 




knd_nearorfar = 
{
	params ["_message"];
	sleep 0.05;
	_caller = player;
	_distancelist = ["Close!", "Mid!", "Far!"];
	knd_distantmessageslist = [];
	{
		knd_distantmessageslist pushback ([_message,_x] joinstring " ");
	} foreach _distancelist;
	["How far?", "b", _distancelist, "",
 
 
 	"[knd_distantmessageslist select %2] call knd_speak"] call BIS_FNC_createmenu;  showCommandingMenu "#USER:b_0";
};

knd_speak = 
{
	params ["_message"];

	switch(_message) do
	{

		case ("callOut"):
		{
			private _position = ATLToASL positionCameraToWorld [0,0,0];
			private _direction = ATLToASL positionCameraToWorld [0,0,1];

			private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));

			if (_azimuth < 0) then {_azimuth = _azimuth + 360};

			_facing = switch(true) do 
			{
				case ((_azimuth <= 22.5) OR (_azimuth >= 337.5)):{"North,"};
				case (_azimuth <= 67.5):{"Northeast,"};
				case (_azimuth <= 112.5):{"East,"};
				case (_azimuth <= 157.5):{"Southeast,"};
				case (_azimuth <= 202.5):{"South,"};
				case (_azimuth <= 247.5):{"Southwest,"};
				case (_azimuth <= 292.5):{"West,"};
				default {"Northwest,"}
				};
			_azimuthstring = ["Bearing ",round _azimuth, "!"] joinstring "";
			_contactcall = ["Contact!", _facing, _azimuthstring] joinstring " ";
			_caller = player;
			[_contactcall] spawn knd_nearorfar;
			//[_caller, _contactcall] remoteExeccall ["groupChat", (units group _caller)];
		};
		case ("callOutVic") : 
		{
			private _position = ATLToASL positionCameraToWorld [0,0,0];
				private _direction = ATLToASL positionCameraToWorld [0,0,1];

				private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));

				if (_azimuth < 0) then {_azimuth = _azimuth + 360};

				_facing = switch(true) do 
				{
				case ((_azimuth <= 22.5) OR (_azimuth >= 337.5)):{"North,"};
				case (_azimuth <= 67.5):{"Northeast,"};
				case (_azimuth <= 112.5):{"East,"};
				case (_azimuth <= 157.5):{"Southeast,"};
				case (_azimuth <= 202.5):{"South,"};
				case (_azimuth <= 247.5):{"Southwest,"};
				case (_azimuth <= 292.5):{"West,"};
				default {"Northwest,"}
				};
				_azimuthstring = ["Bearing ",round _azimuth, "!"] joinstring "";
				_contactcall = ["Vehicle!", _facing, _azimuthstring] joinstring " ";
				_caller = player;
				[_contactcall] spawn knd_nearorfar;
				//[_caller, _contactcall] remoteExeccall ["groupChat", (units group _caller)];
		};
		case ("callOutFort") : 
		{
			private _position = ATLToASL positionCameraToWorld [0,0,0];
				private _direction = ATLToASL positionCameraToWorld [0,0,1];

				private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));

				if (_azimuth < 0) then {_azimuth = _azimuth + 360};

				_facing = switch(true) do 
				{
				case ((_azimuth <= 22.5) OR (_azimuth >= 337.5)):{"North,"};
				case (_azimuth <= 67.5):{"Northeast,"};
				case (_azimuth <= 112.5):{"East,"};
				case (_azimuth <= 157.5):{"Southeast,"};
				case (_azimuth <= 202.5):{"South,"};
				case (_azimuth <= 247.5):{"Southwest,"};
				case (_azimuth <= 292.5):{"West,"};
				default {"Northwest,"}
				};
				_azimuthstring = ["Bearing ",round _azimuth, "!"] joinstring "";
				_contactcall = ["Fortification!", _facing, _azimuthstring] joinstring " ";
				_caller = player;
				[_contactcall] spawn knd_nearorfar;
				//[_caller, _contactcall] remoteExeccall ["groupChat", (units group _caller)];
		};
		default {
			params ["_message"];
			_caller = player;
			[_caller, _message] remoteExeccall ["groupChat", (units group _caller)];};
	};

	

};


["Speak!", "b", knd_messagemenulist, "",
 
 
 "[knd_messageslist select %2] call knd_speak"] call BIS_FNC_createmenu;  showCommandingMenu "#USER:b_0";
