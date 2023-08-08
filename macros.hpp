#define FORMAT_1(STR,ARG1)                              format[STR,ARG1]
#define FORMAT_2(STR,ARG1,ARG2)                         format[STR,ARG1,ARG2]
#define FORMAT_3(STR,ARG1,ARG2,ARG3)                    format[STR,ARG1,ARG2,ARG3]
#define FORMAT_4(STR,ARG1,ARG2,ARG3,ARG4)               format[STR,ARG1,ARG2,ARG3,ARG4]
#define FORMAT_5(STR,ARG1,ARG2,ARG3,ARG4,ARG5)          format[STR,ARG1,ARG2,ARG3,ARG4,ARG5]

#define LOG_SYS(MESSAGE)                                diag_log(MESSAGE)
#define LOG_SYS_1(MESSAGE,ARG1)                         LOG_SYS(FORMAT_1(MESSAGE,ARG1))
#define LOG_SYS_2(MESSAGE,ARG1,ARG2)                    LOG_SYS(FORMAT_2(MESSAGE,ARG1,ARG2))
#define LOG_SYS_3(MESSAGE,ARG1,ARG2,ARG3)               LOG_SYS(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define LOG_SYS_4(MESSAGE,ARG1,ARG2,ARG3,ARG4)          LOG_SYS(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define LOG_SYS_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5)     LOG_SYS(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))

#define PLAYER_SIDE west
#define ENEMY_SIDE east