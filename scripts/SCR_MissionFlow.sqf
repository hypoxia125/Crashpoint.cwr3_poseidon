#include "macros.hpp"

if (isServer) then {
    // Briefing
    execVM "tasks\primary.sqf";
    execVM "tasks\critical.sqf";
    execVM "tasks\defend.sqf";
    execVM "tasks\fortify.sqf";
    execVM "tasks\survive.sqf";
};

waitUntil {
    sleep 1;
    if !(isMultiplayer) exitWith {true};
	!isNil { missionNamespace getVariable "MPSync_EndTime" }
};

if (hasInterface) then {

    // mark as survivor + EH to remove
    player setVariable ["survivor", true, true];
    player addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        player setVariable ["survivor", false, true];
        player removeEventHandler [_thisEvent, _thisEventHandler];
    }];
};

if (isServer) then {

    if (MissionVoting) then {
        ["scripts\SCR_VoteDifficulty.sqf"] remoteExec ["execVM"];
        waitUntil {sleep 1; missionNamespace getVariable ["MissionVoting_Complete", false]}
    };

    [] spawn {
        sleep 3;
        [hq, format ["Intel indicates Russians are mobilizing. Dig in and prepare for contact. ETA, potentially %1 min.", RURF_TimeUntilRF / 60]] remoteExec ["sideChat", [0,-2] select isDedicated];
        sleep 5;
        [hq, format ["We are working on a way to get you out of there. ETA %1 min. Out.", USRF_TimeUntilRF / 60]] remoteExec ["sideChat", [0,-2] select isDedicated];
    };

    execVM "scripts\SCR_ReinfSpawn.sqf";
    execVM "scripts\SCR_RussianWaves.sqf";

    EH_US_Reinf_Destroy = [missionNamespace, "US_Reinf", {
        execVM "tasks\destroy.sqf";

        LOG_SYS("DESTROY Task Created");

        [missionNamespace, "US_Reinf", EH_US_Reinf_Destroy] call BIS_fnc_removeScriptedEventHandler;

        LOG_SYS_1("Removing Scripted Handler | US_Reinf | ID: %1",EH_US_Reinf_Destroy);
    }] call BIS_fnc_addScriptedEventHandler;

    LOG_SYS("DESTROY SUBSCRIPTION ID: %1",EH_US_Reinf_Destroy);
};