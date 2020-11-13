/*
This script regularly checks the base supplies of all blufor FOBS 

Todo:
ID all live bases 
Get supply scores 
Adjust supply scores 

*/



		// athiraMilBaseVirtualUnits = athiraMilBaseVirtualUnits + _deployedUnits;
		// publicVariable "athiraMilBaseVirtualUnits";
		// systemChat format ["Athira Mil-Base now has %1 virtual units", athiraMilBaseVirtualUnits];

/*
Each helipad needs an invisible marker 
When a box is dropped and this script is run, we need to check ... is the box resting in any of the helipad arrays (i.e. dropzones)? 
If so, then apply a score to that base depending on the item dropped, then sink the block.

So, the creation of any base should enable creation of a global marker - both for visual purposes, but a second invisible dropzone marker for this system (small circle)

Think about validation ... what happens when you miss your target?
If after dropping, item is 'not' in dropzone after a few seconds ... inform pilot to try again 

Barracks_DZ = marker name 

_playerIsInside = player inArea _myTrigger;

*/

// script is triggered by rope break and must be holding a supply crate 

// -------------------------------------------------------------------------------------------
params ["_object2", "_className"];

_object2 = _this select 0;
_className = _this Select 1;

_seedPos = getPos _object2;

// systemChat "bluforBaseSupplies.sqf running";
// systemChat format["_object2 = %1", _object2];

if (_seedPos inArea "Barracks_DZ") then {
	systemChat "well done, supplies dropped successfully";
	sleep 10;

	switch (_className) do {
		case "I_supplyCrate_F": { 
			RGG_Barracks_Food = RGG_Barracks_Food + 10;
			publicVariable "RGG_Barracks_Food";
			systemChat format ["Barracks now has %1 Food", RGG_Barracks_Food];
		};
		case "CargoNet_01_barrels_F": { 
			RGG_Barracks_Fuel = RGG_Barracks_Fuel + 10;
			publicVariable "RGG_Barracks_Fuel";
			systemChat format ["Barracks now has %1 Fuel", RGG_Barracks_Fuel];
		};
		case "I_CargoNet_01_ammo_F": { 
			RGG_Barracks_Ammo = RGG_Barracks_Ammo + 10;
			publicVariable "RGG_Barracks_Ammo";
			systemChat format ["Barracks now has %1 Ammo", RGG_Barracks_Ammo];
		};
		default { 
			systemChat "error - nothing deployed";
		};
	};

	[_object2] spawn RGGb_fnc_build_blockSinker;

	// _seedPos = getPos _object2;
	// _object2 enableSimulation false;
	// for [{_i = 0}, {_i > -5}, {_i = _i - 0.1}] do {
	// 	_seedPos set [2,_i]; 
	// 	_object2 setPos _seedPos;
	// 	sleep 0.1;
	// };
	// _object2 setPos [0,0];
	// deleteVehicle _object2;
};

// } else {
// 	systemChat "Supplies dropped in wrong place - try again pilot !!";
// };



// ------------------------------------------------------------------------------------------

if (_seedPos inArea "Medical_DZ") then {
	systemChat "well done, supplies dropped successfully";
	sleep 10;

	switch (_className) do {
		case "I_supplyCrate_F": { 
			RGG_Medical_Food = RGG_Medical_Food + 10;
			publicVariable "RGG_Medical_Food";
			systemChat format ["Med-Base now has %1 Food", RGG_Medical_Food];
		};
		case "CargoNet_01_barrels_F": { 
			RGG_Medical_Fuel = RGG_Medical_Fuel + 10;
			publicVariable "RGG_Medical_Fuel";
			systemChat format ["Med-Base now has %1 Fuel", RGG_Medical_Fuel];
		};
		case "I_CargoNet_01_ammo_F": { 
			RGG_Medical_Ammo = RGG_Medical_Ammo + 10;
			publicVariable "RGG_Medical_Ammo";
			systemChat format ["Med-Base now has %1 Ammo", RGG_Medical_Ammo];
		};
		default { 
			systemChat "error - nothing deployed";
		};
	};

	[_object2] spawn RGGb_fnc_build_blockSinker;

	// _seedPos = getPos _object2;
	// _object2 enableSimulation false;
	// for [{_i = 0}, {_i > -5}, {_i = _i - 0.1}] do {
	// 	_seedPos set [2,_i]; 
	// 	_object2 setPos _seedPos;
	// 	sleep 0.1;
	// };
	// _object2 setPos [0,0];
	// deleteVehicle _object2;
};