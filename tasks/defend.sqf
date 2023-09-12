#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["defend", "primary"],
    "defend",
    GVAR(HeliCrash),
    "ASSIGNED",
    10,
    true,
    "defend",
    false
] call BIS_fnc_taskCreate;

EH_US_Reinf_Defend = [missionNamespace, QGVAR(US_Reinf), {
    ["defend", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, QGVAR(TaskCompleted), ["defend"], false] call BIS_fnc_callScriptedEventHandler;

    LOG("DEFEND Task Completed");
    LOG("TaskCompleted Event Handler Called");

    [missionNamespace, QGVAR(US_Reinf), EH_US_Reinf_Defend] call BIS_fnc_removeScriptedEventHandler;

    LOG_1("Removing Scripted Handler | US_Reinf | ID: %1",EH_US_Reinf_Defend);
}] call BIS_fnc_addScriptedEventHandler;

LOG_1("DEFEND SUBSCRIPTION ID: %1",EH_US_Reinf_Defend);