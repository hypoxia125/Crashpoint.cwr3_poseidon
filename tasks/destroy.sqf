#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["destroy", "primary"],
    "destroy",
    GVAR(HeliCrash),
    "ASSIGNED",
    8,
    true,
    "destroy",
    true
] call BIS_fnc_taskCreate;

[missionNamespace, QGVAR(HeliDestroyed), {
    ["destroy", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, QGVAR(TaskCompleted), ["destroy"], false] call BIS_fnc_callScriptedEventHandler;
    LOG("TaskCompleted Event Handler Called");

    [missionNamespace, QGVAR(HeliDestroyed), _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;

[] spawn {
    waitUntil {
        private _explosives = nearestObjects [GVAR(HeliCrash), ["CUP_PipeBomb_Ammo"], 10, true];
        count _explosives > 0
    };
    LOG("Explosive placed by player");

    waitUntil {
        private _explosives = nearestObjects [GVAR(HeliCrash), ["CUP_PipeBomb_Ammo"], 10, true];
        _explosives findIf {!alive _x} != -1
        ||
        _explosives isEqualTo [];
    };
    LOG("Explosive detonated by player");

    for "_i" from 1 to 10 do {
        private _pos = GVAR(HeliCrash) getPos [10 * sqrt random 1, random 360];
        private _bomb = createVehicle ["CUP_PipeBomb_Ammo", _pos, [], 0, "CAN_COLLIDE"];
        _bomb setDamage 1;
        sleep (random 0.5);
    };
    deleteVehicle GVAR(HeliCrash);

    [missionNamespace, QGVAR(HeliDestroyed), [], false] call BIS_fnc_callScriptedEventHandler;
};