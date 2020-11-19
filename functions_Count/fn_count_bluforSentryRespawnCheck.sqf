/*
This function determines whether a killed sentry can be respawned, or whether it needs to wait in queue 

Notes:
Each sentry respawn should use 1 unit of food and 1 unit of ammo 

To-do:

*/

// -------------------------------------------------------------------------------------------
params ["_unit"];

_unit = _this select 0;
// _className = _this Select 1;
systemChat format ["Unit from countRespawnCheck: %1", _unit];
sleep 1;

_testVariable = _unit getVariable "sentryAlive";
// systemChat str _testVariable;
systemChat format ["Test Data / _testVariable from countRespawnCheck =  %1", _testVariable];
// systemChat format ["Data from countRespawnCheck: %1", _testVariable];
sleep 5;
systemChat "SENTRY RESPAWNING ............";

_block = _testVariable select 0;
_dir = _testVariable select 1;
_pos = _testVariable select 2;

RGG_Barracks_Sentries = RGG_Barracks_Sentries + 1;
publicVariable "RGG_Barracks_Sentries";
systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];

sleep 5;

[_block, _dir, _pos] call RGGs_fnc_spawn_bluforSentries;