class CfgFunctions
{
	class HYP
	{
        class 3DEN
        {
            file = "functions\Hypoxic Framework\3DEN";

            class buildGrassCutters {};
            class changeLocText {};
            class create3DENMarkers {};
            class createMinefield {};
            class get3DENMarkerParams {};
            class moduleDeleteRespawn {};
        };

        class ACE
        {
            file = "functions\Hypoxic Framework\ACE";

            class disableACEVolumeUpdate {};
        };

        class AI
        {
            file = "functions\Hypoxic Framework\AI";

            class clearGroupWaypoints {};
            class moveOnCombat {};
            class rebalanceAISkill {};
        };
        
        class arsenal
        {
            file = "functions\Hypoxic Framework\arsenal";

            class addScopesToArsenal {};
            class getScopeMag {};
            class getWeaponLinkedItems {};
            class hasScopeNVG {};
        };

		class scripting
        {
            file = "functions\Hypoxic Framework\scripting";

            class getPlayers {};
            class getTimeDateAhead {};
            class initVehInventory {};
        };

        class UI
        {
            file = "functions\Hypoxic Framework\UI";

            class disableMoveToMap {};
        };
	};
};