#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["defend", "primary"],
    "defend",
    HeliCrash,
    "ASSIGNED",
    10,
    true,
    "defend",
    false
] call BIS_fnc_taskCreate;

EH_US_Reinf_Defend = [missionNamespace, "US_Reinf", {
    ["defend", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["defend"], false] call BIS_fnc_callScriptedEventHandler;

    LOG_SYS("DEFEND Task Completed");
    LOG_SYS("TaskCompleted Event Handler Called");

    [missionNamespace, "US_Reinf", EH_US_Reinf_Defend] call BIS_fnc_removeScriptedEventHandler;

    LOG_SYS_1("Removing Scripted Handler | US_Reinf | ID: %1",EH_US_Reinf_Defend);
}] call BIS_fnc_addScriptedEventHandler;

LOG_SYS_1("DEFEND SUBSCRIPTION ID: %1",EH_US_Reinf_Defend);