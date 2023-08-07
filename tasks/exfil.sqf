#include "macros.hpp"

if !(isServer) exitWith {};

[
    west,
    ["exfil", "primary"],
    "exfil",
    US_Heli,
    "CREATED",
    7,
    false,
    "getin",
    true
] call BIS_fnc_taskCreate;

[missionNamespace, "Exfiltration", {
    ["exfil", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, "TaskCompleted", ["exfil"], false] call BIS_fnc_callScriptedEventHandler;
    LOG_SYS("TaskCompleted Event Handler Called");

    [missionNamespace, "Exfiltration", _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;

waitUntil {
    ["exfil"] call BIS_fnc_taskCompleted
    &&
    {US_Heli distance US_Carrier <= 1000;}
};

["victory", true, true, true, true] remoteExec ["BIS_fnc_endMission"];