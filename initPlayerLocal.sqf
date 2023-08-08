params ["_player", "_didJIP"];

// Spectator
{
	missionNamespace setVariable [_x, true];
} forEach [
	//"BIS_respSpecAI",					// Allow spectating of AI
	//"BIS_respSpecAllowFreeCamera",		// Allow moving the camera independent from units (players)
	"BIS_respSpecAllow3PPCamera",		// Allow 3rd person camera
	"BIS_respSpecShowFocus",			// Show info about the selected unit (dissapears behind the respawn UI)
	"BIS_respSpecShowCameraButtons",	// Show buttons for switching between free camera, 1st and 3rd person view (partially overlayed by respawn UI)
	"BIS_respSpecShowControlsHelper",	// Show the controls tutorial box
	"BIS_respSpecShowHeader",			// Top bar of the spectator UI including mission time
	"BIS_respSpecLists"					// Show list of available units and locations on the left hand side
];

execVM "scripts\SCR_Diary.sqf";

//Fortify Tool Hint
[] spawn {
    waitUntil {alive player};

    [["ACE_Fortify", "FortifyTool"], 15, nil, 35, nil, true, true, true, true] call BIS_fnc_advHint;
};

// Out of bounds
HYP_OOB = [] spawn {
    while {true} do {
        waitUntil {alive player};

        while {sleep 1; alive player} do {
            private _inBounds = player inArea "marker_4";

            if !(_inBounds) then {
                private _i = 0;
                while {sleep 1; !(player inArea "marker_4")} do {
                    hint "Turn back! You are out of the mission zone!";
                    if (_i > 30) then {player setDamage 1};
                    _i = _i + 1;
                };
                hint "Welcome back!";
            };
        };
    };
};