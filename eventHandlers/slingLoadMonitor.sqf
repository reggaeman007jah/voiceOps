
heli1 addEventHandler ["RopeAttach", {
	params ["_object1", "_rope", "_object2"];
	// hint "something has been lifted:";
	// systemChat str _object2;
}];

heli1 addEventHandler ["RopeBreak", {
	params ["_object1", "_rope", "_object2"];
	
	// systemChat str _object2;
	
	if (typeOf _object2 == "B_Slingload_01_Medevac_F") then { 
		systemChat "Med-Base Deployed:"; 
		[_object2] spawn RGGb_fnc_build_bluforMedbase; };
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	
	if (typeOf _object2 == "B_Slingload_01_Ammo_F") then { 
		systemChat "Barracks Deployed"; 
		[_object2] spawn RGGb_fnc_build_bluforBarracks; 
		heli1 removeEventHandler ["RopeBreak", 0]; // otherwise this triggers 4 times!
		execVM "eventHandlers\slingLoadMonitor.sqf"; // reloads EH to the designated heli - currently "heli1"
	};

}];

