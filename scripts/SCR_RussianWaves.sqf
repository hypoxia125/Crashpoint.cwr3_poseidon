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
    "cwr3_o_soldier_mg",

    // repeat
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier_mg",
    "cwr3_o_soldier_gl",
    "cwr3_o_soldier_at_rpg7",
    "cwr3_o_soldier_mg",

    // repeat
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier",
    "cwr3_o_soldier_mg",
    "cwr3_o_soldier_gl",
    "cwr3_o_soldier_at_rpg7",
    "cwr3_o_soldier_mg"
];

/*
// Move to params
RURF_TimeUntilRF = 60 * 5;
RURF_InitialTime = 60 * 5;
RURF_PercentDecrease = 0.2;
*/

waitUntil {
    sleep 1;

    time >= RURF_TimeUntilRF
    ||
    DEBUG
};

private _waveTimer = RURF_InitialTime;
while {true} do {
    LOG_SYS_1("Next Wave In %1 Seconds",_waveTimer);

    // create heli
    private _marker = format ["ru_spawn_reinf_%1", ceil random 2];
    private _posStart = getMarkerPos _marker vectorAdd [0,0,100];
    private _heli = createVehicle [_heliClass, _posStart, [], 30, "FLY"];
    _heli setDir (getDir _heli + (_heli getRelDir (getPosATL heliCrash)));

    // create crew
    private _group = createGroup [ENEMY_SIDE, true];
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

    LOG_SYS("Heli and Crew Created");

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
            sleep 0.5;
            getPosATL _heli select 2 <= 20
        };

        LOG_SYS("Heli Landing - Smokes: Smokes Created");

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
    private _playerCount = count ([true] call HYP_fnc_getPlayers);
    private _numToSpawn = ceil linearConversion [1, playableSlotsNumber west, _playerCount, 8, count fullCrew [_heli, "CARGO", true], true];

    private _group = createGroup [ENEMY_SIDE, true];
    for "_i" from 0 to (_numToSpawn - 1) do {
        private _class = _enemyUnits select _i;
        private _unit = _group createUnit [_class, [0,0,0], [], 0, "NONE"];
        private _loadout = LoadoutHash get _class;
        _unit setUnitLoadout _loadout;
        _unit moveInCargo _heli;
    };

    // wp
    private _wp = _group addWaypoint [getPosATL HeliCrash, 10];
    _wp setWaypointType "SAD";

    sleep (_waveTimer max 60);

    // change wave time
    _waveTimer = (_waveTimer - (_waveTimer * RURF_PercentDecrease) max RURF_MinimumWaveTime);
};