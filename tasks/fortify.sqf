#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["fortify", "primary"],
    "fortify",
    HeliCrash,
    "CREATED",
    -1,
    true,
    "repair",
    false
] call BIS_fnc_taskCreate;

[missionNamespace, "US_Reinf", {
    ["fortify", "SUCCEEDED", false] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["fortify"], false] call BIS_fnc_callScriptedEventHandler;
    DEBUGMSG("TaskCompleted Event Handler Called");

    [missionNamespace, "US_Reinf", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;