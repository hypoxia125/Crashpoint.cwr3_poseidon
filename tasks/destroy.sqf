#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["destroy", "primary"],
    "destroy",
    HeliCrash,
    "ASSIGNED",
    8,
    true,
    "destroy",
    true
] call BIS_fnc_taskCreate;

[missionNamespace, "HeliDestroyed", {
    ["destroy", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["destroy"], false] call BIS_fnc_callScriptedEventHandler;
    LOG_SYS("TaskCompleted Event Handler Called");

    [missionNamespace, "HeliDestroyed", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;

[] spawn {
    waitUntil {
        private _explosives = nearestObjects [HeliCrash, ["CUP_PipeBomb_Ammo"], 10, true];
        count _explosives > 0
    };
    LOG_SYS("Explosive placed by player");

    waitUntil {
        private _explosives = nearestObjects [HeliCrash, ["CUP_PipeBomb_Ammo"], 10, true];
        _explosives findIf {!alive _x} != -1
        ||
        _explosives isEqualTo [];
    };
    LOG_SYS("Explosive detonated by player");

    for "_i" from 1 to 10 do {
        private _pos = HeliCrash getPos [10 * sqrt random 1, random 360];
        private _bomb = createVehicle ["CUP_PipeBomb_Ammo", _pos, [], 0, "CAN_COLLIDE"];
        _bomb setDamage 1;
        sleep (random 0.5);
    };
    deleteVehicle HeliCrash;

    [missionNamespace, "HeliDestroyed", [], false] call BIS_fnc_callScriptedEventHandler;
};