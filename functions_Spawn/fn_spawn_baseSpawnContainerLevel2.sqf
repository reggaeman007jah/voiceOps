/*
The existing system of base creation is simple - if you deploy base 1, a containter for base 2 will appear ready for pickup 
However we need to build a level system to ensure bases are nmot spammed 

Bases will be deployed in levels 

Level 1 = Supply Depot, Barracks and Medical 
Level 2 = TBC 

Base 1 of Level 2 (i.e. base 4) will only be available when barracks and medical have sufficient scores 

So, here we need supply Medical and barracks true, and also barracks and medical need at least 10 of each score before a level 2 base can spawn 

This check is made on each crate drop - so we need to add a call to this function on each supply EH drop 

WORKSHOP = false;
HELI = false;
CAR = false;

*/
systemChat "RUNNING - spawn_baseSpawnContainerLevel1";

if ((SUPPLY) && (BARRACKS) && (MEDICAL) && (RGG_Barracks_Food > 10) && (RGG_Barracks_Ammo > 10) && (RGG_Barracks_Fuel > 10) && (RGG_Medical_Fuel > 10) && (RGG_Medical_Ammo > 10) && (RGG_Medical_Food > 10)) then {
	systemChat "YOU MAY NOW PROGRESS TO LEEEEEEEEEEEEEEEEEEEEEEEEEEEVEL 2 BEEEACH";

	if (!WORKSHOP) then {
	_container = "B_Slingload_01_Cargo_F" createVehicle [0,0];  
	[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
	} else {
		if (!HELI) then {
			_container = "B_Slingload_01_Ammo_F" createVehicle [0,0];  
			[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
		} else {
			if (!CAR) then {
				_container = "B_Slingload_01_Medevac_F" createVehicle [0,0];  
				[_container, [4084,10273,0], 0] spawn RGGe_fnc_effects_blockRiser;
			} else {
				systemChat "Note: No bases left to build";
			};
		};
	};
};




