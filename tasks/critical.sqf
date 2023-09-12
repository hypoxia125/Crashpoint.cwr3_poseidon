#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    "critical",
    "critical",
    objNull,
    "CREATED",
    -1,
    false,
    "",
    false
] call BIS_fnc_taskCreate;
CriticalObjectives = ["survive"];

[missionNamespace, QGVAR(TaskCompleted), {
    params ["_task"];

    private _subTasks = CriticalObjectives;
    private _subsCompleted = _subTasks findIf {!(_x call BIS_fnc_taskCompleted)} == -1;

    if (_subsCompleted) then {
        ["critical", "SUCCEEDED"] call BIS_fnc_taskSetState;
        [missionNamespace, QGVAR(TaskCompleted), _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
    };
}] call BIS_fnc_addScriptedEventHandler;