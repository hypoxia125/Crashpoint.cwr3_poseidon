#include "macros.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    "primary",
    "primary",
    objNull,
    "CREATED",
    -1,
    false,
    "",
    false
] call BIS_fnc_taskCreate;

[missionNamespace, "TaskCompleted", {
    params ["_task"];

    private _subTasks = "primary" call BIS_fnc_taskChildren;
    private _subsCompleted = _subTasks findIf {!(_x call BIS_fnc_taskCompleted)} == -1;

    if (_subsCompleted) then {
        ["primary", "SUCCEEDED"] call BIS_fnc_taskSetState;
        [missionNamespace, "TaskCompleted", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
    };
}] call BIS_fnc_addScriptedEventHandler;