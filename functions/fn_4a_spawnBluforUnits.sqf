// manages blufor spawning 

private ["_bluforFob", "_opforFob", "_initialBluforInfiPresence", "_initialBluforVicPresence"];

_bluforFob = param[0]; // blufor spawn 
_opforFob = param[1]; //opfor spawn 
_initialBluforInfiPresence = param[3]; 
_initialBluforVicPresence = param[4];




_spawnPos = _this select 0; // position parsed to this script on execution
// _numberOfCycles = _this select 1; // number of times we run this // 4 = 4 fire teams  
_numberOfCycles = 5; // placeholder var  
_area = 60; // distribution of units on spawn  // I am making this much smaller 
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
	_randomDir = selectRandom [270, 310, 00, 50, 90];
	_randomDist = selectRandom [20, 22, 24, 26, 28, 30];
	_unitDest = [_opforFob, 5, 20] call BIS_fnc_findSafePos;
	_endPoint1 = _unitDest getPos [_randomDist,_randomDir];
	_fireTeam doMove _endPoint1;
	
	// spawnedIndiUnit = spawnedIndiUnit +5;
};