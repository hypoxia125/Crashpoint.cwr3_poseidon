#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["fortify", "primary"],
    "fortify",
    GVAR(HeliCrash),
    "CREATED",
    9,
    true,
    "repair",
    false
] call BIS_fnc_taskCreate;

EH_US_Reinf_Fortify = [missionNamespace, QGVAR(US_Reinf), {
    ["fortify", "SUCCEEDED", false] call BIS_fnc_taskSetState;
    [missionNamespace, QGVAR(TaskCompleted), ["fortify"], false] call BIS_fnc_callScriptedEventHandler;

    LOG("FORTIFY Task Completed");
    LOG("TaskCompleted Event Handler Called");

    [missionNamespace, QGVAR(US_Reinf), EH_US_Reinf_Fortify] call BIS_fnc_removeScriptedEventHandler;

    LOG_1("Removing Scripted Handler | US_Reinf | ID: %1",EH_US_Reinf_Fortify);
}] call BIS_fnc_addScriptedEventHandler;

LOG_1("FORTIFY SUBSCRIPTION ID: %1",EH_US_Reinf_Fortify);