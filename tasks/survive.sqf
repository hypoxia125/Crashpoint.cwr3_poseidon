#include "script_component.hpp"

if !(isServer) exitWith {};

[
    PLAYER_SIDE,
    ["survive", "critical"],
    "survive",
    objNull,
    "CREATED",
    -1,
    false,
    "defend",
    false
] call BIS_fnc_taskCreate;

waitUntil {
    sleep 1;
    private _players = [true] call HYP_fnc_getPlayers;
    
    _players findIf {
        _x getVariable ["survivor", true]
    } == -1
};

[missionNamespace, "MissionFailure", [], false] call BIS_fnc_callScriptedEventHandler;

["failure_death", false, true, true] remoteExec ["BIS_fnc_endMission"];