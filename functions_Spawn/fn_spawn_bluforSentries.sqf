/*
this function creates wall and tower sentries 

takes location and direction and block type (for height) as args 

*/

/*
from test file:

RGG_placeTowerSentry = {
	params ["_pos", "_dir"];

	_vrBlock = _pos;
	_vrBlock set [2,1.3];
	_vrWallBlock = "Land_VR_Shape_01_cube_1m_F" createVehicle _vrBlock; 
	_vrWallBlock enableSimulation false;
	_vrWallBlock setPos _vrBlock;

	_indiGroup = createGroup independent;
	_unit1 = _indiGroup createUnit ["B_G_Soldier_A_F", [0,0], [], 0, "FORM"];
	_vrBlock set [2,3];

	_unit1 enableSimulation false;
	_unit1 setPos _vrBlock;
	_unit1pos = getPos _unit1;

	_unit1pos set [2,2.6];

	_unit1 setPos _unit1pos;

	_unit1 enableSimulation true;
	_unit1 setUnitPos "UP";

};
*/

// -------------------------------------------------------------------------------
private ["_spawnPoint", "_spawnDirection", "_wallType"];

_spawnPoint = param[0];
_spawnDirection = param[1];
_wallType = param[2];

RGG_Barracks_Sentries = RGG_Barracks_Sentries + 1;
publicVariable "RGG_Barracks_Sentries";

// private ["_spawnHeight"]; // may not be needed now, as switch is more defined and explicit based on walltype 

// -------------------------------------------------------------------------------

switch (_wallType) do {
	case "wall": { 
		private ["_shift"];
		// this switch pushes the block slightly away from the parsed direction , to ensure the unit does not spawn on the top block, but rather spawns on the lower (protected) level
		switch (_spawnDirection) do {
			case 0: { _shift = 180 };
			case 90: { _shift = 270 };
			case 180: { _shift = 0 };
			case 270: { _shift = 90 };
			default { systemChat "error, direction not correct"; };
		};
		_spawnHeight = 0.3;
		_vrBlock = _spawnPoint;
		_vrBlock set [2, _spawnHeight];
		_vrBlock = _vrBlock getPos [1.3, _shift]; // shift away so unit is not on top block 
		_vrWallBlock = "Land_VR_Shape_01_cube_1m_F" createVehicle _vrBlock; 
		systemChat "block created";
		_vrWallBlock enableSimulation false;
		_vrWallBlock setPos _vrBlock;

		_indiGroup = createGroup independent;
		_unit1 = _indiGroup createUnit ["B_G_Soldier_A_F", [0,0], [], 0, "FORM"];
		_vrBlock set [2,3];

		_unit1 enableSimulation false;
		_unit1 setPos _vrBlock;
		_unit1pos = getPos _unit1;

		_unit1pos set [2,2.6];

		_unit1 setPos _unit1pos;

		_unit1 enableSimulation true;
		_unit1 setUnitPos "UP";
		_unit1 setFormDir _spawnDirection;
		systemChat str _spawnDirection;
		_unit1 addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			systemChat "A WALL SENTRY IS DEAD";
			RGG_Barracks_Sentries = RGG_Barracks_Sentries - 1;
			publicVariable "RGG_Barracks_Sentries";
			systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];
		}];
		deleteVehicle _vrWallBlock;
	};
	case "tower": { 
		_spawnHeight = 1.2;
		_vrBlock = _spawnPoint;
		_vrBlock set [2, _spawnHeight];
		_vrWallBlock = "Land_VR_Shape_01_cube_1m_F" createVehicle _vrBlock; 
		systemChat "block created";
		_vrWallBlock enableSimulation false;
		_vrWallBlock setPos _vrBlock;

		_indiGroup = createGroup independent;
		_unit1 = _indiGroup createUnit ["B_G_Soldier_A_F", [0,0], [], 0, "FORM"];
		_vrBlock set [2,3];

		_unit1 enableSimulation false;
		_unit1 setPos _vrBlock;
		_unit1pos = getPos _unit1;

		_unit1pos set [2,2.6];

		_unit1 setPos _unit1pos;

		_unit1 enableSimulation true;
		_unit1 setUnitPos "UP";
		_unit1 setFormDir _spawnDirection;

		_unit1 addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			systemChat "A TOWER SENTRY IS DEAD";
			RGG_Barracks_Sentries = RGG_Barracks_Sentries - 1;
			publicVariable "RGG_Barracks_Sentries";
			systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];
		}];

		systemChat str _spawnDirection;
	};
	case "corner": { 
		private ["_shift"];
		// this switch pushes the block slightly away from the parsed direction , to ensure the unit does not spawn on the top block, but rather spawns on the lower (protected) level
		switch (_spawnDirection) do {
			case 0: { _shift = 180 };
			case 90: { _shift = 270 };
			case 180: { _shift = 0 };
			case 270: { _shift = 90 };
			default { systemChat "error, direction not correct"; };
		};
		_spawnHeight = 0.3;
		_vrBlock = _spawnPoint;
		_vrBlock set [2, _spawnHeight];
		_vrBlock = _vrBlock getPos [0.1, _shift]; // shift away so unit is not on top block 
		_vrWallBlock = "Land_VR_Shape_01_cube_1m_F" createVehicle _vrBlock; 
		// systemChat "block created";
		_vrWallBlock enableSimulation false;
		_vrWallBlock setPos _vrBlock;

		_indiGroup = createGroup independent;
		_unit1 = _indiGroup createUnit ["B_G_Soldier_A_F", [0,0], [], 0, "FORM"];
		_vrBlock set [2,3];

		_unit1 enableSimulation false;
		_unit1 setPos _vrBlock;
		_unit1pos = getPos _unit1;

		_unit1pos set [2,2.6];

		_unit1 setPos _unit1pos;

		_unit1 enableSimulation true;
		_unit1 setUnitPos "UP";
		_unit1 setFormDir _spawnDirection;
		_unit1 setVariable ["sentryAlive", [_spawnPoint, _spawnDirection, _wallType], TRUE]; // attempt 1 to see if we can use main spawn point as unique ID for unit
		// systemChat str _spawnDirection;
		_testVariable = _unit1 getVariable "sentryAlive";
		// systemChat str _testVariable;
		systemChat format ["Test Data / _testVariable from set/getVariable =  %1", _testVariable];

		_unit1 addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			systemChat "A CORNER SENTRY IS DEAD";
			systemChat format ["Data from EH trigger: %1", _testVariable];
			RGG_Barracks_Sentries = RGG_Barracks_Sentries - 1;
			publicVariable "RGG_Barracks_Sentries";
			systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];
			[_unit] spawn RGGc_fnc_count_bluforSentryRespawnCheck;
		}];

		deleteVehicle _vrWallBlock;

	};
	default { systemChat "error, no wall type specified" };
};

// -------------------------------------------------------------------------------