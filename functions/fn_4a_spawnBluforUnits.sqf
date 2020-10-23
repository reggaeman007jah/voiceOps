/*
This function spawns blufor in the battlezone
*/  

// ** imports 
private ["_bluforFob", "_opforFob", "_initialBluforInfiPresence", "_initialBluforVicPresence", "_battleZone"];
_bluforFob = param[0]; // blufor FOB pos / spawn 
_opforFob = param[1]; //opfor FOB pos / spawn 
_initialBluforInfiPresence = param[2]; // size of blufor infi force
_initialBluforVicPresence = param[3]; // size of blufor vic force
_battleZone = param[4];
// ** imports 

_spawnPos = _this select 0; // position parsed to this script on execution // IS THIS NEEDED?
// _numberOfCycles = _this select 1; // number of times we run this // 4 = 4 fire teams  
_numberOfCycles = 5; //   
_area = 60; // distribution of units on spawn  
_timer = 0.3; // spawn cycle gap  

for "_i" from 1 to _numberOfCycles do {
	_indiGroup = createGroup independent;
	_pos = [_spawnPos, 20, _area] call BIS_fnc_findSafePos;
	// _pos1 = _pos getPos [1,180];
	// _pos2 = _pos getPos [2,180];
	// _pos3 = _pos getPos [3,180];
	// _pos4 = _pos getPos [4,180];
	// _pos5 = _pos getPos [5,180];
	// the above might be used for better staging before move orders 
	_fireTeam = [];
	_unit1 = _indiGroup createUnit ["I_soldier_F", _pos, [], 0.1, "none"]; 
	_unit2 = _indiGroup createUnit ["I_support_MG_F", _pos, [], 0.1, "none"]; 
	_unit3 = _indiGroup createUnit ["I_Soldier_GL_F", _pos, [], 0.1, "none"]; 
	_unit4 = _indiGroup createUnit ["I_Soldier_M_F", _pos, [], 0.1, "none"]; 
	_unit5 = _indiGroup createUnit ["I_medic_F", _pos, [], 0.1, "none"]; 
	_fireTeam pushBack _unit1;
	_fireTeam pushBack _unit2;
	_fireTeam pushBack _unit3;
	_fireTeam pushBack _unit4;
	_fireTeam pushBack _unit5;
	systemChat str _fireTeam;

	sleep _timer;

	// move orders 
	// _randomDir = selectRandom [270, 310, 00, 50, 90];
	// _randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	// _unitDest = [_battleZone, 5, 50] call BIS_fnc_findSafePos;
	// _endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	// _fireTeam doMove _endPoint1;
	_fireTeam doMove _battleZone;
	
	// spawnedIndiUnit = spawnedIndiUnit +5; // might be needed later?
};