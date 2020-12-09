/*
This function will create a small enemy base camp where opfor will spawn for as long as the camp is alive 

To-do:
Ensure that camps to not spawn near existing base locations 

notes:
myPlaces = selectBestPlaces [position player, 50, "meadow + 2*hills", 1, 5];

*/
systemChat "RUNNING - spawn_opforCamp";
private ["_spawnPoint", "_campSize"];

_spawnPoint = param[0];
_campSize = param[1];

// finds a nice little wooded area not too far from created base 
_rootPos = [_spawnPoint, 600, 1000, 3, 0] call BIS_fnc_findSafePos;
_campSite = selectBestPlaces [_rootPos, 200, "forest", 1, 1];
_campSitePos = ((_campSite select 0) select 0);

// comment out this marker section when ready to ship 
_campSiteMarker = createMarker ["_campSite", _campSitePos];
_campSiteMarker setMarkerShape "ELLIPSE";
_campSiteMarker setMarkerColor "ColorRed";
_campSiteMarker setMarkerSize [15, 15];

// create camp site -----------------------------------------------------
_campItems = [];
_random5 = random 5;
_random3 = random 3;

// tents 
for "_i" from 1 to _random5 do {
	_randomDir = random 359;
	_random30 = random 30;
	_spawnPos = _campSitePos getPos [_random30, _randomDir];
	_campItem = createVehicle ["Land_TentDome_F", _spawnPos];
	_campItem setDir _randomDir;
	_campItems pushback _campItem;
};

// barrels and other camp stuff 
for "_i" from 1 to 2 do {
	_randomDir = random 359;
	_random25 = random 25;
	_spawnPos = _campSitePos getPos [_random3, _randomDir];
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
	_spawnPos = _campSitePos getPos [_random5, _randomDir];
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

sleep 2;

systemChat format ["Camp Items: %1", _campItems];
_noOfCampItems = count _campItems;
systemChat format ["No. of Camp Items: %1", _noOfCampItems];