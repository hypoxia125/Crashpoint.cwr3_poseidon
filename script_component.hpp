#define PREFIX                      hyp
#define COMPONENT                   mission

#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define PLAYER_SIDE                 (west)
#define ENEMY_SIDE                  (east)

#define CONVERT_SEC_TO_MIN(sec)     (sec / 60)
#define CONVERT_SEC_TO_HOUR(sec)    (sec / 60 / 60)
#define CONVERT_MIN_TO_SEC(min)     (min * 60)
#define CONVERT_MIN_TO_HOUR(min)    (min * 60)
#define CONVERT_HOUR_TO_SEC(hour)   (hour * 60 * 60)
#define CONVERT_HOUR_TO_MIN(hour)   (hour * 60)