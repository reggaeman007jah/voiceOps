/*
This EH manages the actions following the dropping off of a sling load item 
B_Slingload_01_Medevac_F = creates med-base 
B_Slingload_01_Ammo_F = creates barracks 
I_supplyCrate_F = adds supplies score to a base 
CargoNet_01_barrels_F = adds fuel score to a base 
I_CargoNet_01_ammo_F = adds ammo score to a base 

Currently I remove and then reattach the EH, to prevent the function from being called four times (one for each rope) 
setVariable is a batter way - explore this!
https://community.bistudio.com/wiki/setVariable
*/

heli1 addEventHandler ["RopeBreak", {
	params ["_object1", "_rope", "_object2"];
	
	// switch (_object2) do {
	// 	case (typeOf _object2 == "B_Slingload_01_Medevac_F"): {
	// 		systemChat "Med-Base Deployed:"; 
	// 		[_object2, "B_Slingload_01_Medevac_F"] spawn RGGb_fnc_build_bluforMedbase; 
	// 		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
	// 		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	// 	};
	// 	case (typeOf _object2 == "B_Slingload_01_Ammo_F"): {
	// 		systemChat "Barracks Deployed"; 
	// 		[_object2, "B_Slingload_01_Ammo_F"] spawn RGGb_fnc_build_bluforBarracks; 
	// 		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
	// 		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	// 	};
	// 	case "I_supplyCrate_F": {
	// 		systemChat "Supplies Deployed"; 
	// 		[_object2, "I_supplyCrate_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
	// 		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
	// 		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	// 	};
	// 	case "CargoNet_01_barrels_F": {
	// 		systemChat "Fuel Deployed"; 
	// 		[_object2, "CargoNet_01_barrels_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
	// 		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
	// 		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	// 	};
	// 	case "I_CargoNet_01_ammo_F": {
	// 		systemChat "Ammo Deployed"; 
	// 		[_object2, "I_CargoNet_01_ammo_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
	// 		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
	// 		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	// 	};
	// 	default { systemChat "Error: no suitable object found in rope break EH"; };
	// };

	if (typeOf _object2 == "B_Slingload_01_Medevac_F") then { 
		systemChat "Med-Base Deployed:"; 
		[_object2, "B_Slingload_01_Medevac_F"] spawn RGGb_fnc_build_bluforMedbase; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};

	if (typeOf _object2 == "B_Slingload_01_Ammo_F") then { 
		systemChat "Barracks Deployed"; 
		[_object2, "B_Slingload_01_Ammo_F"] spawn RGGb_fnc_build_bluforBarracks; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};

	if (typeOf _object2 == "I_supplyCrate_F") then { 
		systemChat "Supplies Deployed"; 
		[_object2, "I_supplyCrate_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};
	
	if (typeOf _object2 == "CargoNet_01_barrels_F") then { 
		systemChat "Fuel Deployed"; 
		[_object2, "CargoNet_01_barrels_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};

	if (typeOf _object2 == "I_CargoNet_01_ammo_F") then { 
		systemChat "Ammo Deployed"; 
		[_object2, "I_CargoNet_01_ammo_F"] spawn RGGc_fnc_count_bluforBaseSupplies; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};

}];

// might need this 
// heli1 addEventHandler ["RopeAttach", {
// 	params ["_object1", "_rope", "_object2"];
// 	// hint "something has been lifted:";
// 	// systemChat str _object2;
// }];