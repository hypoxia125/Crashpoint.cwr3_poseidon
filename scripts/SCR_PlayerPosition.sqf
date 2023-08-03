if !(hasInterface) exitWith {};

params ["_drawPlayer", "_drawSquad"];

#define TICKRATE 1

waitUntil {!isNull player};

if (_drawPlayer) then {
    SCR_PlayerPosition_DrawPlayer = [] spawn {
        while {true} do {
            waitUntil {alive player};

            // delete previous marker
            deleteMarkerLocal format ["%1_PlayerMarker", name player];
            
            // create marker
            private _marker = createMarkerLocal [format ["%1_PlayerMarker", name player], [0,0,0]];
            _marker setMarkerColorLocal "ColorWhite";
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "mil_triangle";
            _marker setMarkerTextLocal name player;

            // change marker position
            while {sleep TICKRATE; alive player} do {
                _marker setMarkerPosLocal (getPosATL player);
                if (vehicle player != player) then {
                    _marker setMarkerDirLocal (getDir vehicle player);
                } else {
                    _marker setMarkerDirLocal (getDir player);
                };
            };

            // delete marker if dead
            deleteMarkerLocal _marker;
        };
    };
};

if (_drawSquad) then {
    SCR_PlayerPosition_DrawSquad = [] spawn {
        while {sleep TICKRATE; true} do {
            private _units = units group player - [player];
            _units apply {

                private _unit = _x;

                // grab marker
                private _markerName = format ["marker_%1", name _unit];

                // delete marker if dead
                if !(alive _unit) then {
                    deleteMarkerLocal _markerName;
                    continue;
                };

                // delete marker if not in squad
                if !(_unit in units group player) then {
                    deleteMarkerLocal _markerName;
                    continue;
                };

                // create if doesn't exist
                if !(_markerName in allMapMarkers) then {
                    private _markerName = createMarkerLocal [format ["marker_%1", name _unit], [0,0,0]];
                    _markerName setMarkerColorLocal "ColorOrange";
                    if (leader _unit == _unit) then {_markername setMarkerColorLocal "ColorGreen"};
                    _markerName setMarkerShapeLocal "ICON";
                    _markerName setMarkerTypeLocal "mil_triangle";
                };

                // if unconscious
                if (_unit getVariable ["ace_isunconscious", false]) then {
                    _markerName setMarkerTypeLocal "kia";
                    _markerName setMarkerColorLocal "ColorRed";
                    _markerName setMarkerDirLocal 0;
                } else {
                    _markerName setMarkerTypeLocal "mil_triangle";
                    _markerName setMarkerColorLocal "ColorOrange";
                };

                // change marker position
                _markerName setMarkerPosLocal (getPosATL _unit);
                if (vehicle _unit != _unit) then {
                    _markerName setMarkerDirLocal (getDir vehicle _unit);
                } else {
                    _markerName setMarkerDirLocal (getDir _unit);
                };
            };
        };
    };
};