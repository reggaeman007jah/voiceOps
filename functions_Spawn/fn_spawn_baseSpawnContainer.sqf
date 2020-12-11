/*
This function generates spawns the correct crate (and eventually spawn truck) in the correct order 

It will respond to the base bool 

Using an if statement will ensure we work down the list, which will be useful if you need to recreate a destroyed base 

Order:
1: Supply 
2: Barracks 
3: Medical 
4: Workshop / key item: Land_RepairDepot_01_green_F / seed: B_Slingload_01_Fuel_F
5: 
6:
7:
8:
9:

Tier 1 / SBM 
Supply				Outpost Sierra	(Oscar Sierra / Camp Sierra / The Warehouse)
Barracks 			Outpost Bravo 	(Oscar Bravo / Camp Bravo / The Snakepit)
Medical Outpost 	Outpost Mike	(Oscar Mike / Camp Mike / The Bloodbank)

Tier 2 / WHV
Workshop			Outpost Whiskey	(Oscar Whiskey / Camp Whiskey / The Greasepit)
Heli Base 			Outpost Hotel	(Oscar Hotel / Camp Hotal / The Rotary Club)
Car Pool 			Outpost Victor	(Oscar Victor / Camp Victor / The Car Park)

Tier 3 / LTR
Logistics Post	 	Outpost Lima	(Oscar Lima / Camp Lima / Mainline)
Training Camp		Outpost Tango  	(Oscar Tango / Camp Tango / Tango Down)
Radar Station 		Outpost Romeo 	(Oscar Romeo / Camp Romeo / Skynet)

*/
systemChat "RUNNING - spawn_baseSpawnContainer";
sleep 5;

if (!SUPPLY) then {
	_container = "B_Slingload_01_Cargo_F" createVehicle [0,0];  
	systemChat "spawning blockriser for container 1";
	[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
} else {
	if (!BARRACKS) then {
		_container = "B_Slingload_01_Ammo_F" createVehicle [0,0];  
		[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
	} else {
		if (!MEDICAL) then {
			_container = "B_Slingload_01_Medevac_F" createVehicle [0,0];  
			[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
		} else {
			if (!WORKSHOP) then {
				_container = "B_Slingload_01_Fuel_F" createVehicle [0,0];  
				[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
			} else {
				systemChat "Note: Well done ! No bases left to build";
			};
		};
	};
};

// _wallBlock = "Land_SilageWall_01_l_5m_F" createVehicle _mapCorner;  
// [_wallBlock, _downwashWall7, 0] spawn RGGb_fnc_build_blockManager;