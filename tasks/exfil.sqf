#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["exfil", "primary"],
    "exfil",
    GVAR(US_Heli),
    "CREATED",
    7,
    false,
    "getin",
    true
] call BIS_fnc_taskCreate;

[missionNamespace, QGVAR(Exfil), {
    ["exfil", "SUCCEEDED"] call BIS_fnc_taskSetState;
    [missionNamespace, QGVAR(TaskCompleted), ["exfil"], false] call BIS_fnc_callScriptedEventHandler;
    [{terminate GVAR(OutOfBounds)}] remoteExec ["call", [0,-2] select isDedicated];
    LOG("TaskCompleted Event Handler Called");

    [missionNamespace, QGVAR(Exfil), _thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler;
}] call BIS_fnc_addScriptedEventHandler;

waitUntil {
    sleep 1;
    ["exfil"] call BIS_fnc_taskCompleted
    &&
    {GVAR(US_Heli) distance US_Carrier <= 1000;}
};

["victory", true, true, true, true] remoteExec ["BIS_fnc_endMission"];