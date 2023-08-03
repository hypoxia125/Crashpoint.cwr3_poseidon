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

[missionNamespace, "US_Reinf", {
    ["defend", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["defend"], false] call BIS_fnc_callScriptedEventHandler;
    DEBUGMSG("TaskCompleted Event Handler Called");

    [missionNamespace, "US_Reinf", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;