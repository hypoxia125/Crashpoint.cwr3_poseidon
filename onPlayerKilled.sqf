params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

// Instant black screen
titleText ["", "BLACK OUT", 1e-3, true, false];

// Mute Game
[true] call HYP_fnc_disableACEVolumeUpdate;
0 fadeSound 0;
0 fadeRadio 0;
0 fadeSpeech 0;
0 fadeEnvironment 0;

// Wait
waitUntil {visibleMap};

// Unmute Game
3 fadeSound 1;
3 fadeRadio 1;
3 fadeSpeech 1;
3 fadeEnvironment 0;
[] spawn {
    sleep 3;
    [false] call HYP_fnc_disableACEVolumeUpdate;
};

// Fade in for map screen
titleText ["", "BLACK IN", 1, true, false];