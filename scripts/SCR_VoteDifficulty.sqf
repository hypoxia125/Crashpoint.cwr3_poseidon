// Create display
if (hasInterface) then {
    findDisplay 46 createDisplay "HYP_VoteDifficulty";
};

if (isServer) then {
    ["Voting will end in 30 seconds..."] remoteExec ["systemChat", [0,-2] select isDedicated];
    sleep 30;

    // close displays
    ["scripts\UI\VoteDifficulty\onButtonClickCancel.sqf"] remoteExec ["execVM", [0,-2] select isDedicated];

    private _easyVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Easy', 0];
    private _medVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Med', 0];
    private _hardVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Hard', 0];

    private _winner = _easyVotes;
    if (_medVotes > _winner) then {_winner = _medVotes};
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

    missionNamespace setVariable ["MissionVoting_Complete", true, true];
};