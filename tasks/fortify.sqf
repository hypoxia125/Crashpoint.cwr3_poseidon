#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["fortify", "primary"],
    "fortify",
    HeliCrash,
    "CREATED",
    9,
    true,
    "repair",
    false
] call BIS_fnc_taskCreate;

EH_US_Reinf_Fortify = [missionNamespace, "US_Reinf", {
    ["fortify", "SUCCEEDED", false] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["fortify"], false] call BIS_fnc_callScriptedEventHandler;

    LOG_SYS("FORTIFY Task Completed");
    LOG_SYS("TaskCompleted Event Handler Called");

    [missionNamespace, "US_Reinf", EH_US_Reinf_Fortify] call BIS_fnc_removeScriptedEventHandler;

    LOG_SYS_1("Removing Scripted Handler | US_Reinf | ID: %1",EH_US_Reinf_Fortify);
}] call BIS_fnc_addScriptedEventHandler;

LOG_SYS_1("FORTIFY SUBSCRIPTION ID: %1",EH_US_Reinf_Fortify);