if (isServer) then {
    // Briefing
    execVM "tasks\primary.sqf";
    execVM "tasks\critical.sqf";
    execVM "tasks\defend.sqf";
    execVM "tasks\survive.sqf";
};

waitUntil {
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
    execVM "scripts\SCR_ReinfSpawn.sqf";
    execVM "scripts\SCR_RussianWaves.sqf";
};