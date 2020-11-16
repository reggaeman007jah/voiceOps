/*
creates wall and tower sentries 
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

private ["_spawnHeight"];

// -------------------------------------------------------------------------------

switch (_wallType) do {
	case "wall": { _spawnHeight = 1.3 };
	case "tower": { _spawnHeight = 1.3 };
	default { systemChat "error, no wall type specified" };
};

_vrBlock = _spawnPoint;
_vrBlock set [2, 1.2];
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

// -------------------------------------------------------------------------------