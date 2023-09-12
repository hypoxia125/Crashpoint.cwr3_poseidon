#include "script_component.hpp"

params ["_control", ["_config", configNull]];

private _easyVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Easy), 0];
private _medVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Med), 0];
private _hardVotes = missionNamespace getVariable [QGVAR(VoteDifficulty_Hard), 0];

private _index = lbCurSel (ctrlParent _control displayCtrl 3);

switch _index do {
    case 0: {
        _easyVotes = _easyVotes + 1;
        missionNamespace setVariable [QGVAR(VoteDifficulty_Easy), _easyVotes, true];
    };
    case 1: {
        _medVotes = _medVotes + 1;
        missionNamespace setVariable [QGVAR(VoteDifficulty_Med), _medVotes, true];
    };
    case 2: {
        _hardVotes = _hardVotes + 1;
        missionNamespace setVariable [QGVAR(VoteDifficulty_Hard), _hardVotes, true];
    };
};

ctrlParent _control closeDisplay 1;

private _text = switch _index do {
    case 0: {"Easy"};
    case 1: {"Medium"};
    case 2: {"Hard"};
};
systemChat format ["You have voted for: %1", _text];