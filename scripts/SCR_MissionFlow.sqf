#include "script_component.hpp"

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

    if (GVAR(MissionVoting)) then {
        ["scripts\SCR_VoteDifficulty.sqf"] remoteExec ["execVM"];
        waitUntil {sleep 1; missionNamespace getVariable [QGVAR(MissionVoting_Completed), false]}
    };

    // ACE Fortify System
    private _base = 5;
    [
        PLAYER_SIDE,
        GVAR(Fortify_Resources),
        [
            ["Land_BagFence_Round_F", 5],
            ["Land_BagFence_Short_F", 5],
            ["Land_BagFence_Long_F", 10],
            ["Land_Plank_01_4m_F", 10],
            ["Land_BagBunker_Small_F", 25]
        ]
    ] call ace_fortify_fnc_registerObjects;
    [["ACE_Fortify", "FortifyTool"], 15, nil, 35, nil, true, true, true, true] remoteExec ["BIS_fnc_advHint"];

    [] spawn {
        sleep 3;
        [GVAR(hq), format ["Intel indicates Russians are mobilizing. Dig in and prepare for contact. ETA, potentially %1 min.", GVAR(RURF_TimeUntilRF) / 60]] remoteExec ["sideChat", [0,-2] select isDedicated];
        sleep 5;
        [GVAR(hq), format ["We are working on a way to get you out of there. ETA %1 min. Out.", GVAR(USRF_TimeUntilRF) / 60]] remoteExec ["sideChat", [0,-2] select isDedicated];
    };

    execVM "scripts\SCR_ReinfSpawn.sqf";
    execVM "scripts\SCR_RussianWaves.sqf";

    GVAR(EH_US_Reinf_Destroy) = [missionNamespace, QGVAR(US_Reinf), {
        execVM "tasks\destroy.sqf";

        LOG("DESTROY Task Created");

        [missionNamespace, QGVAR(US_Reinf), GVAR(EH_US_Reinf_Destroy)] call BIS_fnc_removeScriptedEventHandler;

        LOG_1("Removing Scripted Handler | US_Reinf | ID: %1", GVAR(EH_US_Reinf_Destroy));
    }] call BIS_fnc_addScriptedEventHandler;

    LOG("DESTROY SUBSCRIPTION ID: %1", GVAR(EH_US_Reinf_Destroy));
};