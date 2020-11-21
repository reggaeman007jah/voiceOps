/*
This function determines whether a killed sentry can be respawned, or whether it needs to wait in queue 

Notes:
Each sentry respawn should use 1 unit of food and 1 unit of ammo 

To-do:

*/

// -------------------------------------------------------------------------------------------
// params ["_unit", "_baseType"];

// _unit = _this select 0;
// _baseType = _this select 1;

// private ["_unit", "_baseType"];
private ["_unit"];

_unit = param[0];
// _baseType = param[1];

// systemChat format ["respawn file data check - _baseType: %1", _baseType];

// _baseType = "barracks";

_sentryData = _unit getVariable "sentryAlive";

_block = _sentryData select 0;
_dir = _sentryData select 1;
_pos = _sentryData select 2;
_baseType = _sentryData select 3;

// systemChat format ["DEBUG --- bluforSentryREspawnCheck.sqf / _baseType: %1", _baseType];

sleep 5;

switch (_baseType) do {
	case "barracks": {
		if (RGG_Barracks_Food >= 1) then {
			[_block, _dir, _pos, _baseType] call RGGs_fnc_spawn_bluforSentries;
			systemChat "BARRACKS SENTRY RESPAWNING ............";
			sleep 5;
			RGG_Barracks_Food = RGG_Barracks_Food - 1;
			publicVariable "RGG_Barracks_Food";
			systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];
			systemChat format ["Barracks-Base Food Supplies: %1", RGG_Barracks_Food];
		} else {
			systemChat "SENTRY CANNOT RESPAWN AT BARRACKS - NOT ENOUGH FOOD ............";
			RGG_sentryQueue pushBack [_block, _dir, _pos, _baseType];
			
		};
	};
	case "medical": {
		if (RGG_Medical_Food >= 1) then {
			[_block, _dir, _pos, _baseType] call RGGs_fnc_spawn_bluforSentries;
			systemChat "MEDICAL SENTRY RESPAWNING ............";
			sleep 5;
			RGG_Medical_Food = RGG_Medical_Food - 1;
			publicVariable "RGG_Barracks_Food";
			systemChat format ["There are currently %1 Sentries at the Medical FOB", RGG_Medical_Sentries];
			systemChat format ["Med-Base Food Supplies: %1", RGG_Medical_Food];
		} else {
			systemChat "SENTRY CANNOT RESPAWN AT MEDBASE - NOT ENOUGH FOOD ............";
			RGG_sentryQueue pushBack [_block, _dir, _pos, _baseType];
			
		};
	};
	default { systemChat "error - no base type parsed"; };
};
	




