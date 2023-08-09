DEBUG = false;
#include "macros.hpp"

// Variables
LoadoutHash = createHashMapFromArray [
    ["cwr3_o_soldier_sl", [["CUP_arifle_AKS74","","","CUP_optic_PechenegScope",["CUP_30Rnd_545x39_AK_M",30],[],""],["CUP_launch_RPG18","","","",["CUP_RPG18_M",1],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["CUP_U_O_RUS_Flora_2",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2],["SmokeShell",2,1]]],["cwr3_o_vest_6b2_officer",[["CUP_HandGrenade_RGD5",2,1],["CUP_30Rnd_545x39_AK_M",5,30]]],["cwr3_o_backpack_rd54",[["ACE_Canteen",1],["ACE_Humanitarian_Ration",1],["ACE_EntrenchingTool",1],["ACE_MapTools",1],["ACE_Flashlight_MX991",1]]],"cwr3_o_headgear_ssh68","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]],
    ["cwr3_o_soldier", [["CUP_arifle_AKS74","","","",["CUP_30Rnd_545x39_AK_M",30],[],""],["CUP_launch_RPG18","","","",["CUP_RPG18_M",1],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["CUP_U_O_RUS_Flora_2",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2],["SmokeShell",2,1]]],["cwr3_o_vest_6b2_ak74",[["CUP_HandGrenade_RGD5",2,1],["CUP_30Rnd_545x39_AK_M",5,30]]],["cwr3_o_backpack_rd54",[["ACE_Canteen",1],["ACE_Humanitarian_Ration",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_MX991",1]]],"cwr3_o_headgear_ssh68","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]],
    ["cwr3_o_soldier_gl", [["CUP_arifle_AKS74_GL_Early","","","",["CUP_30Rnd_545x39_AK_M",30],["CUP_1Rnd_HE_GP25_M",1],""],["CUP_launch_RPG18","","","",["CUP_RPG18_M",1],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["CUP_U_O_RUS_Flora_2",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2],["SmokeShell",2,1]]],["cwr3_o_vest_6b2_gl",[["CUP_HandGrenade_RGD5",2,1],["CUP_30Rnd_545x39_AK_M",5,30],["CUP_1Rnd_HE_GP25_M",10,1],["CUP_1Rnd_SMOKE_GP25_M",2,1],["CUP_1Rnd_SmokeRed_GP25_M",2,1],["CUP_1Rnd_SmokeGreen_GP25_M",2,1]]],["cwr3_o_backpack_rd54",[["ACE_Canteen",1],["ACE_Humanitarian_Ration",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_MX991",1]]],"cwr3_o_headgear_ssh68","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]],
    ["cwr3_o_soldier_at_rpg7", [["CUP_arifle_AKS74","","","",["CUP_30Rnd_545x39_AK_M",30],[],""],["CUP_launch_RPG7V","","","CUP_optic_PGO7V",["CUP_PG7V_M",1],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["CUP_U_O_RUS_Flora_2",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2],["SmokeShell",2,1]]],["cwr3_o_vest_6b2_ak74",[["CUP_HandGrenade_RGD5",2,1],["CUP_30Rnd_545x39_AK_M",5,30]]],["cwr3_o_backpack_rpg7",[["ACE_Canteen",1],["ACE_Humanitarian_Ration",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_MX991",1],["CUP_PG7V_M",2,1]]],"cwr3_o_headgear_ssh68","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]],
    ["cwr3_o_soldier_mg", [["CUP_arifle_RPK74_45","","","",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",45],[],""],["CUP_launch_RPG18","","","",[],[],""],["hgun_Pistol_01_F","","","",["10Rnd_9x21_Mag",10],[],""],["CUP_U_O_RUS_Flora_2",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2],["SmokeShell",2,1]]],["cwr3_o_vest_6b2_mg",[["CUP_HandGrenade_RGD5",2,1],["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",8,45]]],["cwr3_o_backpack_rd54",[["ACE_Canteen",1],["ACE_Humanitarian_Ration",1],["ACE_EntrenchingTool",1],["ACE_Flashlight_MX991",1]]],"cwr3_o_headgear_ssh68","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]],

    [
        "cwr3_crate_basicweapons_us",
        [
            ["CUP_arifle_M16A1E1", 3],
            ["CUP_30Rnd_556x45_Stanag", 10],
            ["cwr3_arifle_xm177e2", 1],
            ["cwr3_smg_uzi", 1],
            ["CUP_32Rnd_9x19_UZI_M", 10],
            ["CUP_arifle_M16A1E1GL",2],
            ["CUP_1Rnd_HE_M203", 8],
            ["CUP_1Rnd_Smoke_M203", 3],
            ["CUP_1Rnd_SmokeGreen_M203", 3],
            ["CUP_1Rnd_SmokeRed_M203", 3],
            ["CUP_1Rnd_SmokeYellow_M203", 3],
            ["CUP_srifle_M14", 1],
            ["optic_sos", 1],
            ["CUP_20Rnd_762x51_DMR", 10],
            ["cwr3_lmg_m60e3", 1],
            ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 5],
            ["ace_csw_100rnd_127x99_mag", 2]
        ]
    ],

    [
        "cwr3_crate_grenades_us",
        [
            ["CUP_HandGrenade_M67", 5],
            ["SmokeShell", 5],
            ["ClaymoreDirectionalMine_Remote_Mag", 5],
            ["cwr3_glaunch_mm1", 1],
            ["cwr3_12rnd_mm1_m", 2]
        ]
    ]
];

// Mission Flow
execVM "scripts\SCR_MissionFlow.sqf";

// Server Only
if (isServer) then {
    // ACE Fortify System
    private _base = 5;
    [
        west,
        150,
        [
            ["Land_BagFence_Round_F", 5],
            ["Land_BagFence_Short_F", 5],
            ["Land_BagFence_Long_F", 10],
            ["Land_Plank_01_4m_F", 10],
            ["Land_BagBunker_Small_F", 25]
        ]
    ] call ace_fortify_fnc_registerObjects;

    // Crates
    private _crates = getMissionLayerEntities "crates" select 0;
    _crates apply {
        private _crate = _x;
        private _loadout = LoadoutHash get (typeOf _crate);

        clearItemCargoGlobal _crate;
        clearWeaponCargoGlobal _crate;
        clearMagazineCargoGlobal _crate;
        clearBackpackCargoGlobal _crate;

        _loadout apply {
            _x params ["_item", "_count"];

            _crate addItemCargoGlobal [_item, _count];
        };
    };

    // Hide mission markers
    private _markers = getMissionLayerEntities "Hide Layer" select 1;
    _markers apply {_x setMarkerAlpha 0};

    // Cross out heli marker
    private _marker = createMarkerLocal ["marker_heli_x", getMarkerPos "marker_heli"];
    _marker setMarkerType "Contact_pencilTask1";
    _marker setMarkerColorLocal "ColorRed";

    // On death handler for AI bodies
    addMissionEventHandler ["EntityKilled", {
        _this spawn {
            params ["_unit", "_killer", "_instigator", "_useEffects"];

            sleep 300;
            deleteVehicle _unit;
            LOG_SYS_1("Unit Corpse Deleted: %1", _unit);
        };
    }];

    // AI Skill Rebalancer
    addMissionEventHandler ["PlayerConnected", {
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

        [east,0.5,0.3,1.0,1.0,10] call HYP_fnc_rebalanceAISkill;
        LOG_SYS("AI Rebalanced - Player Joined");
    }];

    addMissionEventHandler ["PlayerDisconnected", {
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

        [east,0.5,0.3,1.0,1.0,10] call HYP_fnc_rebalanceAISkill;
        LOG_SYS("AI Rebalanced - Player Left");
    }];
};