/*
class CfgDebriefing
{
	class End1
	{
		title = "Mission Completed";
		subtitle = "";
		description = "You successfully rescued our forces and neutralized the spotters, despite being forced to retreat.";
		pictureBackground = "";
		picture = "b_inf";
		pictureColor[] = { 0.0, 0.3, 0.6, 1 };
	};
};
*/

class CfgDebriefing
{
    class failure_death
    {
        title = "Mission Failed";
        subtitle = "All Survivors Killed";
        description = "All starting survivors have been killed. At least one must survive the whole mission";
        pictureBackground = "";
        picture = "kia";
        pictureColor[] = { 0.0, 0.3, 0.6, 1 };
    };

    class victory
    {
        title = "Mission Success";
        subtitle = "All Primary Objectives Completed";
        description = "";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = { 0.0, 0.3, 0.6, 1 };
    };
};