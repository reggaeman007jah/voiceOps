/*
This function manages creation of blufor and opfor buildings (fobs)
*/

// ** imports 
private ["_bluforFob", "_opforFob"];
_bluforFob = param[0]; // blufor FOB pos / spawn
_opforFob = param[1]; // opfor FOB pos / spawn
// ** imports 

// build blufor base
_buildLocation = _bluforFob findEmptyPosition [1,50,"B_Heli_Light_01_dynamicLoadout_F"];
_baseBuilding1 = createVehicle ["Land_MedicalTent_01_tropic_closed_F", _buildLocation, [], 30, "none"]; 
_fobPos = _baseBuilding1 getPos [20,180];
sleep 0.6;
_ammoSup = createVehicle ["Box_NATO_Support_F", _fobPos];//ammmo 
[ "AmmoboxInit", [_ammoSup, true, {true}] ] call BIS_fnc_arsenal;
_repairPos = _fobPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
_ammoSup = createVehicle ["B_Slingload_01_Repair_F", _repairPos];//vehicle repair 

// build opfor base 
_campItems = []; // to hold all camp items if we need to track them for deletion (although consider full destroy command for this also)
_randomCampLocation = _opforFob findEmptyPosition [1,50,"B_Heli_Light_01_dynamicLoadout_F"];
_random5 = random 5;
_random3 = random 3;

// tents 
for "_i" from 1 to 2 do {
	_randomDir = random 359;
	_random30 = random 30;
	_spawnPos = _randomCampLocation getPos [_random30, _randomDir];
	_campItem = createVehicle ["Land_TentDome_F", _spawnPos];
	_campItem setDir _randomDir;
	_campItems pushback _campItem;
};

// barrels and other camp stuff 
for "_i" from 1 to 2 do {
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

