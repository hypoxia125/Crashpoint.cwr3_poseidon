#include "script_component.hpp"

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

waitUntil {
    sleep 1;

    time >= GVAR(RURF_TimeUntilRF)
    ||
    !isNil QGVAR(debug)
};

private _waveTimer = GVAR(RURF_InitialTime);
GVAR(RURF_ActiveUnits) = [];

while {true} do {
    LOG_1("Next Wave In %1 Seconds",_waveTimer);

    waitUntil {
        sleep 1;
        (count GVAR(RURF_ActiveUnits)) < GVAR(RURF_MaxUnits)
    };

    // create heli
    private _marker = selectRandom [QGVAR(ru_spawn_reinf_1), QGVAR(ru_spawn_reinf_2)];
    private _posStart = getMarkerPos _marker vectorAdd [0,0,100];
    private _heli = createVehicle [_heliClass, _posStart, [], 30, "FLY"];
    _heli setDir (getDir _heli + (_heli getRelDir (getPosATL GVAR(heliCrash))));

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

    LOG("Heli and Crew Created");

    // set wps
    private _marker = selectRandom [
        QGVAR(ru_wp_reinf_1_1),
        QGVAR(ru_wp_reinf_1_2),
        QGVAR(ru_wp_reinf_1_3),
        QGVAR(ru_wp_reinf_1_4),
        QGVAR(ru_wp_reinf_1_5),
        QGVAR(ru_wp_reinf_1_6)
    ];
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

        LOG("Heli Landing - Smokes: Smokes Created");

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
    private _numToSpawn = ceil linearConversion [1, playableSlotsNumber PLAYER_SIDE, _playerCount, 8, count fullCrew [_heli, "CARGO", true], true];

    private _group = createGroup [ENEMY_SIDE, true];
    for "_i" from 0 to (_numToSpawn - 1) do {
        private _class = _enemyUnits select _i;
        private _unit = _group createUnit [_class, [0,0,0], [], 0, "NONE"];
        private _loadout = GVAR(hmap_loadouts) get _class;
        _unit setUnitLoadout _loadout;
        _unit moveInCargo _heli;
        GVAR(RURF_ActiveUnits) pushBackUnique _unit;

        _unit addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];

            GVAR(RURF_ActiveUnits) deleteAt (GVAR(RURF_ActiveUnits) find _unit);
        }];
    };

    // wp
    private _wp = _group addWaypoint [getPosATL GVAR(HeliCrash), 10];
    _wp setWaypointType "SAD";

    sleep (_waveTimer max 60);

    // change wave time
    _waveTimer = (_waveTimer - (_waveTimer * GVAR(RURF_PercentDecrease) max GVAR(RURF_MinimumWaveTime)));
};