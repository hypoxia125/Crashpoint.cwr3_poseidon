#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["defend", "primary"],
    "defend",
    HeliCrash,
    "ASSIGNED",
    1
    true,
    "defend",
    true
] call BIS_fnc_taskCreate;

waitUntil {
    sleep 1;
    missionNamespace getVariable ["us_reinf", false];
};

["defend", "SUCCEEDED"] call BIS_fnc_taskSetState;
[missionNamespace, ]