/*
This function manages creation of blufor and opfor buildings (fobs)
*/

// ** imports 
private ["_bluforFob", "_opforFob"];
_bluforFob = param[0]; // blufor FOB pos / spawn
_opforFob = param[1]; // opfor FOB pos / spawn
// ** imports 

/*
Blufor Base Classes:
Land_HBarrierWall6_F
Land_MedicalTent_01_tropic_closed_F
B_Heli_Light_01_dynamicLoadout_F
Land_HelipadCircle_F
Box_NATO_Support_F
B_Slingload_01_Repair_F
*/

// build blufor base 
_buildLocation = _bluforFob findEmptyPosition [1,50,"B_Heli_Light_01_dynamicLoadout_F"];
// _opforPos = [_opp360, 1, 100, 3, 0, 0, 0] call BIS_fnc_findSafePos; // consider using this instead for the base location if testing proves poor 

// build tent 
_baseBuilding1 = createVehicle ["Land_MedicalTent_01_tropic_closed_F", _buildLocation, [], 30, "none"]; 
sleep 0.6;

// build helipad
_heliPadPos = _baseBuilding1 getPos [20,90]; 
_heliPad = createVehicle ["Land_HelipadCircle_F", _heliPadPos];
sleep 0.6;

// build virtual arsenal ammo box
_fobPos = _baseBuilding1 getPos [20,180];
_ammoSup = createVehicle ["Box_NATO_Support_F", _fobPos];
[ "AmmoboxInit", [_ammoSup, true, {true}] ] call BIS_fnc_arsenal;
sleep 0.6;

// build vic repair box
_repairPos = _fobPos findEmptyPosition [10,100,"B_Heli_Light_01_dynamicLoadout_F"];
_ammoSup = createVehicle ["B_Slingload_01_Repair_F", _repairPos];//vehicle repair 
sleep 0.6;


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

