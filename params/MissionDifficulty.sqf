#include "script_component.hpp"

params ["_value"];

GVAR(USRF_TimeUntilRF) = CONVERT_MIN_TO_SEC(20);

GVAR(RURF_TimeUntilRF) = CONVERT_MIN_TO_SEC(5);
GVAR(RURF_InitialTime) = CONVERT_MIN_TO_SEC(5);
GVAR(RURF_PercentDecrease) = 0.2;
GVAR(RURF_MinimumWaveTime) = 60;

GVAR(RURF_MaxUnits) = 32;

GVAR(Fortify_Resources) = 150;

GVAR(MissionVoting) = false;

switch _value do {
    case 1: {
        GVAR(USRF_TimeUntilRF) = CONVERT_MIN_TO_SEC(15);

        GVAR(RURF_TimeUntilRF) = CONVERT_MIN_TO_SEC(3);
        GVAR(RURF_InitialTime) = CONVERT_MIN_TO_SEC(5);
        GVAR(RURF_PercentDecrease) = 0.1;
        GVAR(RURF_MinimumWaveTime) = CONVERT_MIN_TO_SEC(2);

        GVAR(RURF_MaxUnits) = round (32 * 0.7);

        GVAR(Fortify_Resources) = 500;
    };

    case 2: {
        GVAR(USRF_TimeUntilRF) = CONVERT_MIN_TO_SEC(23);

        GVAR(RURF_TimeUntilRF) = CONVERT_MIN_TO_SEC(2);
        GVAR(RURF_InitialTime) = CONVERT_MIN_TO_SEC(5);
        GVAR(RURF_PercentDecrease) = 0.2;
        GVAR(RURF_MinimumWaveTime) = CONVERT_MIN_TO_SEC(1.5);

        GVAR(RURF_MaxUnits) = round (32 * 1);

        GVAR(Fortify_Resources) = 300;
    };

    case 3: {
        GVAR(USRF_TimeUntilRF) = CONVERT_MIN_TO_SEC(24);

        GVAR(RURF_TimeUntilRF) = CONVERT_MIN_TO_SEC(1);
        GVAR(RURF_InitialTime) = CONVERT_MIN_TO_SEC(5);
        GVAR(RURF_PercentDecrease) = 0.3;
        GVAR(RURF_MinimumWaveTime) = CONVERT_MIN_TO_SEC(1);

        GVAR(RURF_MaxUnits) = round (32 * 1.3);

        GVAR(Fortify_Resources) = 150;
    };
    
    case 4: {
        GVAR(MissionVoting) = true;
    };
};