params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Fade Out
titleText ["", "BLACK OUT", 1e-3, true, false];

// set default loadout
_newUnit setUnitLoadout [["CUP_arifle_M16A1E1","","","",["CUP_30Rnd_556x45_Stanag",30],[],""],[],[],["cwr3_b_uniform_m81_woodland",[["ACE_fieldDressing",3],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_quikclot",3],["ACE_Canteen",1],["ACE_EarPlugs",1],["ACE_epinephrine",1],["ACE_Fortify",1],["ACE_Humanitarian_Ration",1],["ACE_morphine",1],["ACE_splint",1],["ACE_tourniquet",2]]],["cwr3_b_vest_pasgt_alice_woodland",[["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["CUP_30Rnd_556x45_Stanag",5,30]]],[],"cwr3_b_headgear_pasgt_m81_woodland","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

// add goggles
private _goggles = [
    "cwr3_b_facewear_goggles",
    "CUP_G_ESS_BLK_Dark",
    "CUP_G_ESS_BLK_Ember",
    "CUP_G_ESS_BLK",
    "CUP_G_ESS_CBR_Dark",
    "CUP_G_ESS_CBR_Ember",
    "CUP_G_ESS_CBR",
    "CUP_G_ESS_RGR_Dark",
    "CUP_G_ESS_RGR_Ember",
    "CUP_G_ESS_RGR",
    "CUP_G_ESS_KHK_Dark",
    "CUP_G_ESS_KHK_Ember",
    "CUP_G_ESS_KHK"
];
if (random 1 < 0.50) then {_newUnit addGoggles selectRandom _goggles};

// Fade In
sleep 1;
titleText ["", "BLACK IN", 3, true, false];