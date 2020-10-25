/*
This function manages creation of blufor and opfor buildings (fobs)
*/

// ** imports 
private ["_bluforFob", "_opforFob"];
_bluforFob = param[0]; // blufor FOB pos / spawn
_opforFob = param[1]; // opfor FOB pos / spawn
// ** imports 

// build blufor base
// _wall1 = Land_HBarrierWall6_F

sleep 20;

// build blufor base 
_buildLocation = _bluforFob findEmptyPosition [1,50,"B_Heli_Light_01_dynamicLoadout_F"];
// _baseBuilding1 = createVehicle ["Land_MedicalTent_01_tropic_closed_F", _buildLocation, [], 30, "none"]; 

// _heliPadPos = _baseBuilding1 getPos [20,90]; 
// _heliPad = createVehicle ["Land_HelipadCircle_F", _heliPadPos];

// _fobPos = _baseBuilding1 getPos [20,180];
// sleep 0.6;
// _ammoSup = createVehicle ["Box_NATO_Support_F", _fobPos];//ammmo 
// [ "AmmoboxInit", [_ammoSup, true, {true}] ] call BIS_fnc_arsenal;
// _repairPos = _fobPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
// _ammoSup = createVehicle ["B_Slingload_01_Repair_F", _repairPos];//vehicle repair 


_rootPos = _buildLocation; 

_genesisPos = _rootPos getPos [-20,20];
_spawnSpeed = 0.3;
_wallSpacing = 8.7;

// Land_HelipadSquare_F
_heliPadPos = _rootPos getPos [10,10];
_heliPad = "Land_HelipadSquare_F" createVehicle _heliPadPos;
sleep _spawnSpeed;

// Land_Medevac_house_V1_F
_medicHutPos = _heliPadPos getPos [10,180];
_medicHut = "Land_Medevac_house_V1_F" createVehicle _medicHutPos;
sleep _spawnSpeed;

//Land_MedicalTent_01_NATO_tropic_generic_outer_F
_tentPos = _medicHutPos getPos [25,90];
_tent = "Land_MedicalTent_01_NATO_tropic_generic_outer_F" createVehicle _tentPos;
sleep _spawnSpeed;

//Land_MedicalTent_01_NATO_tropic_generic_outer_F
_tentPos = _tentPos getPos [10,180];
_tent = "Land_MedicalTent_01_NATO_tropic_generic_outer_F" createVehicle _tentPos;
sleep _spawnSpeed;

// Land_MobileRadar_01_radar_F
_radarPos = _tentPos getPos [15,260];
_radar = "Land_MobileRadar_01_radar_F" createVehicle _radarPos;
sleep _spawnSpeed;

//Land_MobileRadar_01_generator_F
_gennyPos = _radarPos getPos [6,0];
_genny = "Land_MobileRadar_01_generator_F" createVehicle _gennyPos;
sleep _spawnSpeed;

// Land_Cargo_House_V2_F
_hqPos = _gennyPos getPos [25,0];
_hq = "Land_Cargo_House_V2_F" createVehicle _hqPos;
sleep _spawnSpeed;

// Land_Cargo_Patrol_V2_F
_towerPos = _hqPos getPos [10,90];
_hq = "Land_Cargo_Patrol_V2_F" createVehicle _towerPos;
_hq setDir 180;
sleep _spawnSpeed;


// _wallBlock = "Land_HBarrierWall6_F" createVehicle _genesisPos;
_startPosition = _genesisPos;
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 180;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 0;	
	_newPos = _pos + _wallSpacing;				
	_startPosition set [0, _newPos];
	sleep _spawnSpeed;	
};

sleep 1;

_startPosition = _genesisPos;
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 90;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 1;	
	_newPos = _pos + _wallSpacing;				
	_startPosition set [1, _newPos];
	sleep _spawnSpeed;	
};

_startPosition = _genesisPos;
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 0;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 0;	
	_newPos = _pos - _wallSpacing;				
	_startPosition set [0, _newPos];
	sleep _spawnSpeed;	
};

_startPosition = _genesisPos;
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 270;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 1;	
	_newPos = _pos - _wallSpacing;				
	_startPosition set [1, _newPos];
	sleep _spawnSpeed;	
};



/*



// // wall 1
private _startPosition = [6400,4300];
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 180;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 0;	
	_newPos = _pos + 8.9;				
	_startPosition set [0, _newPos];
	sleep _spawnSpeed;	
};

// // wall 2
private _startPosition = [6400,4330];
for "_i" from 1 to 5 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_pos = _startPosition select 0;	
	_newPos = _pos + 8.9;				
	_startPosition set [0, _newPos];
	sleep _spawnSpeed;		
// };

// // wall 3
private _startPosition = [6400,4324];
for "_i" from 1 to 3 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 270;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 1;	
	_newPos = _pos - 8.9;				
	_startPosition set [1, _newPos];
	sleep _spawnSpeed;		
// };

// // wall 4
private _startPosition = [6438,4324];
for "_i" from 1 to 2 do {
	_wallBlock = "Land_HBarrierWall6_F" createVehicle _startPosition;
	_wallBlock setDir 90;
	_wallBlockPos = getPos _wallBlock;
	_wallBlockPos set [2,0]; 
	_wallBlock setPos _wallBlockPos;
	_pos = _startPosition select 1;	
	_newPos = _pos - 8.9;				
	_startPosition set [1, _newPos];
	sleep _spawnSpeed;		
};


// new exp 
// [6412.87,4346.68] Land_HBarrierWall_corner_F 
// [6413.55,4340.61] Land_HBarrierWall6_F
// [6413.81,4332.32] Land_HBarrierWall6_F
// [6413.82,4325.4] Land_HBarrierWall_corner_F

// genesis pos 
// _wallGenesisPos = [6412.87,4346.68];

// genesis corner block 
// _wallBlockPos = _wallGenesisPos;
// _wallBlock1 = "Land_HBarrierWall_corner_F" createVehicle _wallBlockPos;

// sleep _spawnSpeed;

// block 2
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 0.35;
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 6.02;
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;

// sleep _spawnSpeed;

// block 3
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;

// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];

// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;

// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;

// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 2.8; // 3.0
// _wallBlockPos set [0,_posAdjust];
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8; // 6.02 > 5 // 5 > 8 // 
// _wallBlockPos set [1,_posAdjust];
// _wallBlock2 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock2 setDir 90;
// _wallBlockPos = getPos _wallBlock2;
// _wallBlockPos set [2,0]; 
// _wallBlock2 setPos _wallBlockPos;

// _posAdjust2 = _wallBlockPos select 0; // grabs value of x value 
// _posAdjust2 = _posAdjust2 - 0.8; // makes manual adjustment to align thins better 	
// _wallBlockPos set [0,_posAdjust2]; // sets value 
// _wallBlock2 setPos _wallBlockPos; // resets position of block

// _posAdjust2 = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust2 = _posAdjust2 + 1; // makes manual adjustment to align thins better 	
// _wallBlockPos set [1,_posAdjust2]; // sets value 
// _wallBlock2 setPos _wallBlockPos; // resets position of block

// sleep _spawnSpeed;

// block 3
// _posAdjust = _wallBlockPos select 1; // grabs value of y value 
// _posAdjust = _posAdjust - 8.15;
// _wallBlockPos set [1,_posAdjust];
// _posAdjust = _wallBlockPos select 0; // grabs value of y value 
// _posAdjust = _posAdjust - 1;
// _wallBlockPos set [0,_posAdjust];
// _wallBlock3 = "Land_HBarrierWall6_F" createVehicle _wallBlockPos;
// _wallBlock3 setDir 90;
// _wallBlockPos = getPos _wallBlock3;
// _wallBlockPos set [2,0]; 
// _wallBlock3 setPos _wallBlockPos;

// sleep _spawnSpeed;

// block 4
// _wallBlock4 = "Land_HBarrierWall_corner_F" createVehicle [6413.82,4325.4];
// 	_wallBlock4 setDir 90; // sets initial angle 
// 	_wallBlockPos = getPos _wallBlock4; // get pos of block 
// 	_wallBlockPos set [2,0]; // sets 0 value in third position of array
// 	_wallBlock4 setPos _wallBlockPos; // resets position to ensure snapping 

// 	_posAdjust = _wallBlockPos select 1; // grabs value of y value 
// 	_posAdjust = _posAdjust - 1.5; // makes manual adjustment to stop it from clipping neighbour block 	
// 	_wallBlockPos set [1,_posAdjust]; // sets value 
// 	_wallBlock4 setPos _wallBlockPos; // resets position of block 

// 	_posAdjust2 = _wallBlockPos select 0; // grabs value of x value 
// 	_posAdjust2 = _posAdjust2 - 1; // makes manual adjustment to align thins better 	
// 	_wallBlockPos set [0,_posAdjust2]; // sets value 
// 	_wallBlock4 setPos _wallBlockPos; // resets position of block
// end exp 


// build opfor base 

/*
Opfor Base Classes:
B_Heli_Light_01_dynamicLoadout_F
Land_TentDome_F
"Land_BarrelSand_F",
"Land_BarrelSand_F",
"Land_BarrelSand_grey_F",
"Land_BarrelWater_grey_F",
"Land_TransferSwitch_01_F",
"Land_RotorCoversBag_01_F",
"Land_MetalBarrel_F",
"Land_WaterTank_F"
"Land_WoodenCrate_01_stack_x3_F",
"Weapon_launch_O_Vorona_brown_F",
"Box_T_East_Wps_F",
"Box_East_AmmoOrd_F",
"Box_East_WpsLaunch_F",
"Land_CratesWooden_F",
"Land_Pallet_MilBoxes_F",
*/

_campItems = []; // to hold all camp items if we need to track them for deletion (although consider full destroy command for this also)
_randomCampLocation = _opforFob findEmptyPosition [1,50,"B_Heli_Light_01_dynamicLoadout_F"];
_random5 = random 5;
_random3 = random 3;

// tents 
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random30 = random 30;
	_spawnPos = _randomCampLocation getPos [_random30, _randomDir];
	_campItem = createVehicle ["Land_TentDome_F", _spawnPos];
	_campItem setDir _randomDir;
	_campItems pushback _campItem;
};

_random5 = random 5; // yes, we run this again 
// barrels and other camp stuff 
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random25 = random 25;
	_spawnPos = _randomCampLocation getPos [_random3, _randomDir];
	_campItem = selectRandom [
		"Land_BarrelSand_F",
		"Land_BarrelSand_F",
		"Land_BarrelSand_grey_F",
		"Land_BarrelWater_grey_F",
		"Land_TransferSwitch_01_F",
		"Land_TentDome_F",
		"Land_RotorCoversBag_01_F",
		"Land_MetalBarrel_F",
		"Land_WaterTank_F"
	];
	// _spawnPos = _randomCampLocation getPos [_random25, _randomDir];
	_campItem2 = createVehicle [_campItem, _spawnPos];
	_campItem2 setDir _randomDir;
	_campItems pushback _campItem2;
};

_random5 = random 5; // and yes, we run this again 
// crates 
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random5 = random 5;
	_random25 = random 25;
	_spawnPos = _randomCampLocation getPos [_random5, _randomDir];
	_campItem = selectRandom [
		"Land_WoodenCrate_01_stack_x3_F",
		"Weapon_launch_O_Vorona_brown_F",
		"Box_T_East_Wps_F",
		"Box_East_AmmoOrd_F",
		"Box_East_WpsLaunch_F",
		"Land_CratesWooden_F",
		"Land_Pallet_MilBoxes_F",
		"Land_MetalBarrel_F",
		"Land_WaterTank_F"
	];
	// _spawnPos = _randomCampLocation getPos [_random25, _randomDir];
	_campItem2 = createVehicle [_campItem, _spawnPos];
	_campItem2 setDir _randomDir;
	_campItems pushback _campItem2;
};

