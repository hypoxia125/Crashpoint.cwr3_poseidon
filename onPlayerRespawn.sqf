params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Fade Out
titleText ["", "BLACK OUT", 1e-3, true, false];

// Fade In
sleep 1;
titleText ["", "BLACK IN", 3, true, false];