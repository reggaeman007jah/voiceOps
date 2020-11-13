
/*
Set up global vars to enable management of base crates and supplies 
For now, create the mission so there is only ever one type of base 

Base Types:
	Barracks 			Outpost Bravo 	(Oscar Bravo / Camp Bravo / Snakepit)
	Medical Outpost 	Outpost Mike	(Oscar Mike / Mike / Bloodbank)
	Radar Station 		Outpost Romeo 	(Oscar Romeo / Romeo / Skynet)
	Observation Post 	Outpost Oscar	(Oscar Whiskey / Whiskey / Peep Show)
	Heli Base 			Outpost Hotel	(Oscar Hotel / Hotal / The Rotary Club)
	Car Pool 			Outpost Victor	(Oscar Victor / Victor / The Car Park)
	Workshop			Outpost Whiskey	(Oscar Whiskey / Whiskey / Monkeywrench)
	Training Camp		Outpost Tango  	(Oscar Tango / Tango / The Killhouse)

*/

// creation states 
BARRACKS = false;
MEDICAL = false;
RADAR = false;
OBSERVATION = false;
HELI = false;
CAR = false;
WORKSHOP = false;
TRAINING = false;


// Barracks
RGG_Barracks_Food = 0;
RGG_Barracks_Ammo = 0;
RGG_Barracks_Fuel = 0;
publicVariable "RGG_Barracks_Food";
publicVariable "RGG_Barracks_Ammo";
publicVariable "RGG_Barracks_Fuel";


// Medical
RGG_Medical_Food = 0;
RGG_Medical_Ammo = 0;
RGG_Medical_Fuel = 0;
publicVariable "RGG_Medical_Food";
publicVariable "RGG_Medical_Ammo";
publicVariable "RGG_Medical_Fuel";


// Radar
RGG_Radar_Food = 0;
RGG_Radar_Ammo = 0;
RGG_Radar_Fuel = 0;
publicVariable "RGG_Radar_Food";
publicVariable "RGG_Radar_Ammo";
publicVariable "RGG_Radar_Fuel";


// Observation
RGG_Observation_Food = 0;
RGG_Observation_Ammo = 0;
RGG_Observation_Fuel = 0;
publicVariable "RGG_Observation_Food";
publicVariable "RGG_Observation_Ammo";
publicVariable "RGG_Observation_Fuel";


// Heli
RGG_Heli_Food = 0;
RGG_Heli_Ammo = 0;
RGG_Heli_Fuel = 0;
publicVariable "RGG_Heli_Food";
publicVariable "RGG_Heli_Ammo";
publicVariable "RGG_Heli_Fuel";


// Car
RGG_Car_Food = 0;
RGG_Car_Ammo = 0;
RGG_Car_Fuel = 0;
publicVariable "RGG_Car_Food";
publicVariable "RGG_Car_Ammo";
publicVariable "RGG_Car_Fuel";


// Workshop
RGG_Workshop_Food = 0;
RGG_Workshop_Ammo = 0;
RGG_Workshop_Fuel = 0;
publicVariable "RGG_Workshop_Food";
publicVariable "RGG_Workshop_Ammo";
publicVariable "RGG_Workshop_Fuel";


// Training
RGG_Training_Food = 0;
RGG_Training_Ammo = 0;
RGG_Training_Fuel = 0;
publicVariable "RGG_Training_Food";
publicVariable "RGG_Training_Ammo";
publicVariable "RGG_Training_Fuel";

// cycle count of base supplies 
[] spawn RGGc_fnc_count_monitorSupplies; 
[] spawn RGGc_fnc_count_depleteSupplies;


// call RGG_fnc_1_setup_createMainBaseMarker; 

execVM "eventHandlers\slingLoadMonitor.sqf";

while {true} do {
	{ deleteVehicle _x } forEach allDead;
	systemChat "cleanup";
	sleep 300;
};


// Voice Activation Global Declaration 
// VAA_Activate = true;

// sleep 10;

// initialise APS
// execVM "autoPatrolSystem\autoPatrolSystem.sqf";
// sleep 0.5;

// initialise debug counter system 
// execVM "autoPatrolSystem\debuggingSystems\debugCounter.sqf";

// initialise flybys - add bombs later 
// execVM "autoPatrolSystem\ambientSystems\randomFlybys.sqf";

// initialise pickup scripts 
// execVM "autoPatrolSystem\pickupSystems\pickupInit.sqf";

// initialise para spawner script 
// execVM "autoPatrolSystem\pickupSystems\spawnParas.sqf";


// to avoid errors 
// ???
REARMONSPAWN = true; 


// initialise Heli Systems
// execVM "autoPatrolSystem\heliSystems\heliSystemsInit.sqf";
// // systemchat "debug --- Heli Systems ACTIVATED";
// sleep 0.5;

// initialise debug UAV
// execVM "autoPatrolSystem\UAV\uav.sqf";
// systemchat "debug --- UAV Systems ACTIVATED";
// sleep 0.5;

// test addAction 
// // heliAttack4
// // if (isServer) then
// {
// 	_object = heliAttack4;
// 	[_object, ["Greetings!", {hint "Hello!"}]] remoteExec ["addAction"];
// };
// sleep 60;

/*
this addEventHandler ["GetIn", { 
 params ["_vehicle", "_role", "_unit", "_turret"]; { 
 _object = _unit; 
 [_object, ["Greetings!", {hint "Hello!"}]] remoteExec ["addAction"]; systemChat str _unit; 
};
}];

*/
// SF Manager
//player addAction ["Pick up SF", "autoPatrolSystem\callSF.sqf"];	
// player setVariable ["isBusy", 111]; // i.e. not busy and needs a task
// execVM "autoPatrolSystem\checkSF.sqf";
// execVM "autoPatrolSystem\checkRF.sqf";
// execVM "autoPatrolSystem\motion.sqf";
// sleep 0.5;

// AI Behaviour Management
// player addAction ["Change Behaviour to Combat", "Modes\combatMode.sqf"];	
// player addAction ["Change Behaviour to Safe", "Modes\safeMode.sqf"];	
// player addAction ["Change Behaviour to Stealth", "Modes\stealthMode.sqf"];	
// player addAction ["Change Behaviour to Aware", "Modes\awareMode.sqf"];	

// heli drops
// player addAction ["Drop Smoke", "heliDrops\dropSmoke.sqf"];	
// player addAction ["Drop Flare", "heliDrops\dropFlare.sqf"];	
// heli2 addAction ["Drop Smoke", "heliDrops\dropSmoke.sqf"];	
// heli2 addAction ["Drop Flare", "heliDrops\dropFlare.sqf"];	

// Land Check Test Output
// player addAction ["Test findSafeSpot output", "landCheck\landCheck.sqf"];

// garbage collection - this needs to be mission-based
// while {true} do {
// 	sleep 600;
// 	// systemChat "cleanup";
// 	{ deleteVehicle _x } forEach allDead;
// };

/*
how to do garbage control better ...

having a basic timer cycle can lead to immersion break 
so, maybe at a key point you create a new marker, on the position of the old obj marker - "cleanup" 
then set a timer to enable players to leave the area, then do cleanup just in that zone ... better chance that noone will see the function happen ..

*/