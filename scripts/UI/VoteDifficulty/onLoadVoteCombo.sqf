#include "script_component.hpp"

params ["_control", ["_config", configNull]];

private _texts = [
    "Easy",
    "Medium",
    "Hard"
];
_texts apply {_control lbAdd _x};

_control lbSetCurSel 1;