/*
class CfgTaskDescriptions
{
    class myTask
    {
        title = "";
        description = ""
    };
};
*/

class CfgTaskDescriptions
{
    class primary
    {
        title = "Primary Objectives";
        description = "Primary objectives required to complete the mission.";
    };
    class critical
    {
        title = "Critical Failures";
        description = "Objectives that, if failed, result in a loss.";
    };
    class defend
    {
        title = "Wait For Exfil";
        description = "We are sending reinforcements to your location. It will take a little bit of time, so hold out and defend your location.";
    };
    class destroy
    {
        title = "Destroy Heli";
        description = "To prevent any technologies from entering Russian hands, destroy what is left over of the helicopter. Satchel charges are in the reinforcement helicopter.";
    };
    class survive
    {
        title = "Survive";
        description = "At least one of the starting heli survivors must survive the whole mission. If all die, then its a mission failure.";
    };
    class fortify
    {
        title = "Fortify Your Position";
        description = "We are going to have to defend this location. We could use some sand bag walls or other defensive fortifications.<br/><br/>Use the fortify tool (Self ACE Interaction w/ Fortify Tool in Inventory) to build fortifications."
    };
    class exfil
    {
        title = "Exfiltrate";
        description = "Everyone, get to the chopper! Lets get out of here!";
    };
};