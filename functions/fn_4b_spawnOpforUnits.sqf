// manages opfor spawning 
// initial enemy infi presence / _initialOpforInfiPresence
// 1 = a few / 1 - 10
// 2 = quite a lot / 11 - 20
// 3 = loads of dem / 21 - 30

private ["_bluforFob", "_opforFob", "_initialOpforInfiPresence", "_initialopforVicPresence"];

_bluforFob = param[0]; //opfor spawn 
_opforFob = param[1]; //opfor spawn 
_initialOpforInfiPresence = param[2];
_initialopforVicPresence = param[3];

_opforGrp = createGroup east;

for "_i" from 1 to _initialOpforInfiPresence do {
	_rndtype = selectRandom [
		"O_G_Soldier_A_F",
		"O_G_Soldier_AR_F",
		"O_G_medic_F",
		"O_G_engineer_F",
		"O_G_Soldier_exp_F",
		"O_G_Soldier_GL_F",
		"O_G_Soldier_M_F",
		"O_G_officer_F",
		"O_G_Soldier_F",
		"O_G_Soldier_LAT_F",
		"O_G_Soldier_LAT2_F",
		"O_G_Soldier_lite_F",
		"O_G_Sharpshooter_F",
		"O_G_Soldier_SL_F",
		"O_G_Soldier_TL_F",
		"O_G_Offroad_01_armed_F"
	];
	_pos = [_opforFob, 0, 30] call BIS_fnc_findSafePos; 
	_unit = _opforGrp createUnit [_rndtype, _pos, [], 1, "none"]; 
	_unit setBehaviour "COMBAT";
	_unit doMove _bluforFob; 
	// spawnedOpforUnit = spawnedOpforUnit + 1; // maybe giood for scoring?
	sleep 0.5;						
};

// old, maybe useful
// _rndOp1 = selectRandom [0, 3, 4, 5, 6];
// systemchat format ["1st wave: %1", _rndOp1];