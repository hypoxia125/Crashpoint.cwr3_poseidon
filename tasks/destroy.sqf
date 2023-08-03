#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["destroy", "primary"],
    "destroy",
    HeliCrash,
    "ASSIGNED",
    1,
    true,
    "destroy",
    true
] call BIS_fnc_taskCreate;

[missionNamespace, "HeliDestroyed", {
    ["destroy", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["destroy"], false] call BIS_fnc_callScriptedEventHandler;
    DEBUGMSG("TaskCompleted Event Handler Called");

    [missionNamespace, "HeliDestroyed", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}];