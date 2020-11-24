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
	_crate = createVehicle ["B_Slingload_01_Cargo_F", [4084.47,10273,0], [], 0, "NONE"];
} else {
	if (!BARRACKS) then {
		_crate = createVehicle ["B_Slingload_01_Ammo_F", [4084.47,10273,0], [], 0, "NONE"];
	} else {
		if (!MEDICAL) then {
			_crate = createVehicle ["B_Slingload_01_Medevac_F", [4084.47,10273,0], [], 0, "NONE"];
		} else {
			systemChat "error, no bases left to build";
		};
	};
};