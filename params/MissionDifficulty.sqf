params ["_value"];

#define CONVERTTO_MIN(value) (value * 60)

USRF_TimeUntilRF = CONVERTTO_MIN(20);

RURF_TimeUntilRF = CONVERTTO_MIN(5);
RURF_InitialTime = CONVERTTO_MIN(5);
RURF_PercentDecrease = 0.2;
RURF_MinimumWaveTime = 60;

MissionVoting = false;

switch _value do {
    case 1: {
        USRF_TimeUntilRF = CONVERTTO_MIN(15);

        RURF_TimeUntilRF = CONVERTTO_MIN(3);
        RURF_InitialTime = CONVERTTO_MIN(5);
        RURF_PercentDecrease = CONVERTTO_MIN(0.1);
        RURF_MinimumWaveTime = 120;
    };

    case 2: {
        USRF_TimeUntilRF = CONVERTTO_MIN(23);

        RURF_TimeUntilRF = CONVERTTO_MIN(2);
        RURF_InitialTime = CONVERTTO_MIN(5);
        RURF_PercentDecrease = CONVERTTO_MIN(0.2);
        RURF_MinimumWaveTime = 60;
    };

    case 3: {
        USRF_TimeUntilRF = CONVERTTO_MIN(24);

        RURF_TimeUntilRF = CONVERTTO_MIN(1);
        RURF_InitialTime = CONVERTTO_MIN(5);
        RURF_PercentDecrease = CONVERTTO_MIN(0.3);
        RURF_MinimumWaveTime = 30;
    };
    
    case 4: {
        MissionVoting = true;
    };
};