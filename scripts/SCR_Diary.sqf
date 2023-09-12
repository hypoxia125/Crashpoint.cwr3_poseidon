#include "script_component.hpp"

if !(hasInterface) exitWith {};

player createDiaryRecord [
    "Diary",
    [
        "Mission",
        str composeText [
            "Your mission, is to take on the role of the defending crew-members. You must hold your ground and defend yourselves until reinforcements can arrive. Should any crew-member be taken down, they will automatically join the reinforcement force."
        ]
    ]
];

player createDiaryRecord [
    "Diary",
    [
        "Situation",
        str composeText [
            "We have received urgent reports indicating that one of our helicopters has encountered a critical situation. The distress signal suggests that the aircraft has lost engine power and is forced to make an emergency landing within Russian airspace. The crew has miraculously survived the crash, but they are stranded with limited resources.",
            "<br/><br/>",
            "Russian scouts have been alerted and are preparing a quick response force to locate and potentially apprehend our crew. It is crucial that we act swiftly and tactically to ensure their safety and secure vital information."
        ]
    ]
];