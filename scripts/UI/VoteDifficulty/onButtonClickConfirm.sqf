params ["_control", ["_config", configNull]];

private _easyVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Easy', 0];
private _medVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Med', 0];
private _hardVotes = missionNamespace getVariable ['HYP_VoteDifficulty_Hard', 0];

private _index = lbCurSel (ctrlParent _control displayCtrl 3);

switch _index do {
    case 0: {
        _easyVotes = _easyVotes + 1;
        missionNamespace setVariable ['HYP_VoteDifficulty_Easy', _easyVotes, true];
    };
    case 1: {
        _medVotes = _medVotes + 1;
        missionNamespace setVariable ['HYP_VoteDifficulty_Med', _medVotes, true];
    };
    case 2: {
        _hardVotes = _hardVotes + 1;
        missionNamespace setVariable ['HYP_VoteDifficulty_Hard', _hardVotes, true];
    };
};

ctrlParent _control closeDisplay 1;

private _text = switch _index do {
    case 0: {"Easy"};
    case 1: {"Medium"};
    case 2: {"Hard"};
};
systemChat format ["You have voted for: %1", _text];