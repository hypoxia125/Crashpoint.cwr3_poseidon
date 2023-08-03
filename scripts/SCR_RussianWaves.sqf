#include "macros.hpp"

private _heliClass = "cwr3_o_mi8_amt";
private _pilotClass = "cwr3_o_soldier_pilot";
private _crewClass = "cwr3_o_soldier_pilot";

private _enemyUnits = [
    "cwr3_o_soldier_sl",
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier_mg",
    "cwr3_o_soldier_gl",
    "cwr3_o_soldier_at_rpg7",
    "cwr3_o_soldier_mg"
];

private _tillReinf = 60 * 5;
private _waveTimer = 60 * 5;

waitUntil {
    sleep 1;

    time >= _tillReinf
};

while {true} do {
    // create heli
    private _posStart = getMarkerPos "ru_spawn_reinf_1" vectorAdd [0,0,100];
    private _heli = createVehicle [_heliClass, _posStart, [], 0, "FLY"];
    _heli setDir (getDir _heli + (_heli getRelDir (getPosATL heliCrash)));

    // create crew
    private _group = createGroup [ENEMY_SIDE, true];
    // driver
    private _unit = _group createUnit [_pilotClass, [0,0,0], [], 0, "NONE"];
    _unit moveInDriver _heli;
    _unit setCombatBehaviour "CARELESS";
    // gunners
    for "_i" from 0 to (count allTurrets _heli - 1) do {
        private _unit = _group createUnit [_crewClass, [0,0,0], [], 0, "NONE"];
        _unit moveInTurret [_heli, [_i]];

        _heli lockTurret [[_i], true];
    };

    DEBUGMSG("Heli and Crew Created");

    // set wps
    private _marker = format ["ru_wp_reinf_1_%1", ceil random 6];
    private _pos = getMarkerPos _marker; _pos set [2, 0];
    private _helipad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"];
    // wp 1
    private _wp = _group addWaypoint [_helipad, -1];
    _wp setWaypointType "TR UNLOAD";

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
            private _smoke = createVehicle ["SmokeShellRed", _smokePos];
        };

        deleteVehicle _helipad;
    };

    // wp 2
    private _pos = _posStart;
    private _wp = _group addWaypoint [_pos, -1];
    _wp setWaypointType "MOVE";
    _wp setWaypointCompletionRadius 25;
    _wp setWaypointStatements [
        "true",
        toString {
            if (local this) then {
                deleteVehicle this;
                thisList apply {deleteVehicle _x};
            };
        }
    ];

    // create enemy units
    private _group = createGroup [ENEMY_SIDE, true];
    _enemyUnits apply {
        private _unit = _group createUnit [_x, [0,0,0], [], 0, "NONE"];
        private _loadout = LoadoutHash get _x;
        _unit setUnitLoadout _loadout;
        _unit moveInCargo _heli;
    };

    // wp
    private _wp = _group addWaypoint [getPosATL HeliCrash, 10];
    _wp setWaypointType "SAD";

    waitUntil {
        sleep 1;

        time >= _waveTimer
    };
    
    if (_waveTimer >= 60) then {
        _waveTimer = _waveTimer - 30;
    };
};