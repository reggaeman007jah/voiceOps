/*
This function generates spawns the correct crate (and eventually spawn truck) in order 

It will respond to the base bool 

Using an if statement will ensure we work down the list, which will be useful if you needd to recreate a destroyed base 

Order:
1: Supply 
2: Barracks 
3: Medical 

*/

sleep 5;

if (!SUPPLY) then {
	// _crate = createVehicle ["B_Slingload_01_Cargo_F", [4084.47,10273,0], [], 0, "NONE"];
	_container = "B_Slingload_01_Cargo_F" createVehicle [0,0];  
	[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
} else {
	if (!BARRACKS) then {
		// _crate = createVehicle ["B_Slingload_01_Ammo_F", [4084.47,10273,0], [], 0, "NONE"];
		_container = "B_Slingload_01_Ammo_F" createVehicle [0,0];  
		[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
	} else {
		if (!MEDICAL) then {
			// _crate = createVehicle ["B_Slingload_01_Medevac_F", [4084.47,10273,0], [], 0, "NONE"];
			_container = "B_Slingload_01_Medevac_F" createVehicle [0,0];  
			[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
		} else {
			systemChat "Note: No bases left to build";
		};
	};
};

// _wallBlock = "Land_SilageWall_01_l_5m_F" createVehicle _mapCorner;  
// [_wallBlock, _downwashWall7, 0] spawn RGGb_fnc_build_blockManager;