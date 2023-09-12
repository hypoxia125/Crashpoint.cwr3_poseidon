#include "script_component.hpp"

params ["_control", ["_config", configNull]];

if (isNil "_control") exitWith {};

ctrlParent _control closeDisplay 2;