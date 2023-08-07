#include "macros.hpp"

private _heliClass = "cwr3_b_uh60";
private _pilotClass = "cwr3_b_soldier_pilot";
private _crewClass = "cwr3_b_soldier_pilot";

/*
// Moved to params
USRF_TimeUntilRF = 60 * 20;
*/

waitUntil {
    sleep 1;

    time >= USRF_TimeUntilRF
};

[missionNamespace, "US_Reinf", [], false] call BIS_fnc_callScriptedEventHandler;
DEBUGMSG("US_Reinf Event Handler Called");

[HQ, "Reinforcments ETA 30 Seconds!"] remoteExec ["sideChat", [0,-2] select isDedicated];

private _deadPlayers = allDead select {isPlayer _x};
["You may now respawn as a reinforcement!"] remoteExec ["hint", _deadPlayers];

// create heli
private _posStart = getMarkerPos "us_spawn_reinf_1" vectorAdd [0,0,100];
private _heli = createVehicle [_heliClass, _posStart, [], 0, "FLY"];
_heli setDir (getDir _heli + (_heli getRelDir (getPosATL heliCrash)));

// create crew
private _group = createGroup [PLAYER_SIDE, true];
// driver
private _unit = _group createUnit [_pilotClass, [0,0,0], [], 0, "NONE"];
_unit moveInDriver _heli;
_unit setCombatBehaviour "CARELESS";
_unit setCaptive true;
// gunners
for "_i" from 0 to (count allTurrets _heli - 1) do {
    private _unit = _group createUnit [_crewClass, [0,0,0], [], 0, "NONE"];
    _unit moveInTurret [_heli, [_i]];

    _heli lockTurret [[_i], true];
};

DEBUGMSG("Heli and Crew Created");

// set wps
private _pos = getMarkerPos "us_wp_reinf_1_1"; _pos set [2, 0];
private _helipad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"];
// wp 1
private _wp = _group addWaypoint [_helipad, -1];
_wp setWaypointType "TR UNLOAD";
_wp setWaypointStatements [
    toString {
        private _veh = vehicle this;
        private _players = [false] call HYP_fnc_getPlayers;

        _players findIf {!(_x in _veh)} == -1;
    },
    "true"
];

// smokes around wp1
[_heli, _helipad] spawn {
    params ["_heli", "_helipad"];

    scriptName "Heli Landing - Smokes";

    waitUntil {
        getPosATL _heli select 2 <= 20
    };

    DEBUGMSG("Heli Landing - Smokes: Smokes Created");

    for "_i" from 0 to (360 - 30) step 30 do {
        private _smokePos = getPosATL _helipad getPos [20, _i];
        private _smoke = createVehicle ["SmokeShellPurple", _smokePos];
    };

    deleteVehicle _helipad;
};

// wp 2
private _pos = _posStart;
private _wp = _group addWaypoint [_pos, -1];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 25;

// create respawn
private _respawn = [PLAYER_SIDE, _heli, "Reinforcement Respawn"] call BIS_fnc_addRespawnPosition;
missionNamespace setVariable ["reinf_respawn", _respawn];

DEBUGMSG("Respawn Created - Heli");