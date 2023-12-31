#include "script_component.hpp"

// Create display
if (hasInterface) then {
    findDisplay 46 createDisplay "HYP_VoteDifficulty";
};

if (isServer) then {
    ["Voting will end in 30 seconds..."] remoteExec ["systemChat", [0,-2] select isDedicated];
    sleep 30;

    // close displays
    ["scripts\UI\VoteDifficulty\onButtonClickCancel.sqf"] remoteExec ["execVM", [0,-2] select isDedicated];

    private _easyVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Easy), 0];
    private _medVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Med), 0];
    private _hardVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Hard), 0];

    private _winner = _medVotes;
    if (_easyVotes > _winner) then {_winner = _easyVotes};
    if (_hardVotes > _winner) then {_winner = _hardVotes};

    private _text = switch _winner do {
        case _easyVotes: {"Easy"};
        case _medVotes: {"Medium"};
        case _hardVotes: {"Hard"};
    };

    [format ["Vote Complete! Selected Difficulty: %1", _text]] remoteExec ["systemChat", [0,-2] select isDedicated];

    private _value = switch _winner do {
        case _easyVotes: {1};
        case _medVotes: {2};
        case _hardVotes: {3};
    };
    _value execVM "params\MissionDifficulty.sqf";

    missionNamespace setVariable [QGVAR(MissionVoting_Completed), true, true];
};