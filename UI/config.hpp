#include "import.cpp"

#define GUI_R       (profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])
#define GUI_G       (profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])
#define GUI_B       (profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])
#define GUI_A       1

class HYP_VoteDifficulty
{
    idd = 730487;
    onLoad = "uiNamespace setVariable ['HYP_VoteDifficulty', _this select 0]";
    class controls
    {
        class Background: IGUIBack
        {
            idc = -1;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.099 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class Text_Difficulty: RscText
        {
            idc = 1;

            text = "Difficulty"; //--- ToDo: Localize;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        class Frame_Text_Voting: RscFrame
        {
            idc = 2;

            text = "Voting - Mission Difficulty"; //--- ToDo: Localize;
            font = "RobotoCondensed";
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.077 * safezoneH;
            colorBackground[] = {1,1,1,1};
            sizeEx = 0.02;
        };
        class Combo_Difficulty: RscCombo
        {
            idc = 3;

            x = 0.520625 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;

            onLoad = "_this execVM 'scripts\UI\VoteDifficulty\onLoadVoteCombo.sqf'";
        };
        class Button_Cancel: RscButtonMenuCancel
        {
            idc = 4;

            colorBackgroundActive[] = {GUI_R,GUI_G,GUI_B,GUI_R};
            colorBackground[] = {1,1,1,0};
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;

            onButtonClick = "_this execVM 'scripts\UI\VoteDifficulty\onButtonClickCancel.sqf'";
        };
        class Button_Vote: RscButtonMenuOK
        {
            idc = 5;

            text = "Vote"; //--- ToDo: Localize;
            colorBackgroundActive[] = {GUI_R,GUI_G,GUI_B,GUI_R};
            colorBackground[] = {1,1,1,0};
            colorBorder[] = {GUI_R,GUI_G,GUI_B,GUI_R};
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;

            onButtonClick = "_this execVM 'scripts\UI\VoteDifficulty\onButtonClickConfirm.sqf'";
        };
    };
};