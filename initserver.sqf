/*
Notes:
Set up global vars to enable management of base crates and supplies 
For now, create the mission so there is only ever one type of base (no duplicates, only unique)

Base Types:

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

systemChat "init server running";

// ----- time accelerator -----
setTimeMultiplier 30;

// ----- creation states -----
// these globals record whether a type of base exists or not .. the more bases that exist the more reports players get 
// everything is false to start with, as nothing exists when mission starts 

SUPPLY = false; // Sierra
BARRACKS = false; // Bravo 
MEDICAL = false; // Mike 

WORKSHOP = false; // Whiskey  
HELI = false; // Hotal
CAR = false; // Victor

LOGISTICS = false; // Lima
TRAINING = false; // Tango 
RADAR = false; // Romeo 

// ----- this holds any sentry units waiting to spawn in (but can't due to lack of base food) -----
RGG_sentryQueue = []; // holds sentry respawn data 
RGG_supplyQueue = []; // holds supply respawn data 
RESPAWNQUEUE = false // this tracks whether the sentry respawn system is active 

// --- Base Stats -----
// these record base stats for food, fuel ammo and defences 

// Level 1 ------------------------------------------------------

// Supply
RGG_Supply_Food = 0;
RGG_Supply_Ammo = 0;
RGG_Supply_Fuel = 0;
RGG_Supply_Sentries = 0;
publicVariable "RGG_supply_Food";
publicVariable "RGG_supply_Ammo";
publicVariable "RGG_supply_Fuel";
publicVariable "RGG_supply_Sentries";

// Barracks
RGG_Barracks_Food = 0;
RGG_Barracks_Ammo = 0;
RGG_Barracks_Fuel = 0;
RGG_Barracks_Sentries = 0;
publicVariable "RGG_Barracks_Food";
publicVariable "RGG_Barracks_Ammo";
publicVariable "RGG_Barracks_Fuel";
publicVariable "RGG_Barracks_Sentries";

// Medical
RGG_Medical_Food = 0;
RGG_Medical_Ammo = 0;
RGG_Medical_Fuel = 0;
RGG_Medical_Sentries = 0;
publicVariable "RGG_Medical_Food";
publicVariable "RGG_Medical_Ammo";
publicVariable "RGG_Medical_Fuel";
publicVariable "RGG_Medical_Sentries";


// Level 2 ------------------------------------------------------

// Workshop
RGG_Workshop_Food = 0;
RGG_Workshop_Ammo = 0;
RGG_Workshop_Fuel = 0;
RGG_Workshop_Sentries = 0;
publicVariable "RGG_Workshop_Food";
publicVariable "RGG_Workshop_Ammo";
publicVariable "RGG_Workshop_Fuel";
publicVariable "RGG_Workshop_Sentries";

// Heli
RGG_Heli_Food = 0;
RGG_Heli_Ammo = 0;
RGG_Heli_Fuel = 0;
RGG_Heli_Sentries = 0;
publicVariable "RGG_Heli_Food";
publicVariable "RGG_Heli_Ammo";
publicVariable "RGG_Heli_Fuel";
publicVariable "RGG_Heli_Sentries";

// Car
RGG_Car_Food = 0;
RGG_Car_Ammo = 0;
RGG_Car_Fuel = 0;
RGG_Car_Sentries = 0;
publicVariable "RGG_Car_Food";
publicVariable "RGG_Car_Ammo";
publicVariable "RGG_Car_Fuel";
publicVariable "RGG_Car_Sentries";


// Level 3 ------------------------------------------------------

// Logistics
RGG_Logistics_Food = 0;
RGG_Logistics_Ammo = 0;
RGG_Logistics_Fuel = 0;
RGG_Logistics_Sentries = 0;
publicVariable "RGG_Logistics_Food";
publicVariable "RGG_Logistics_Ammo";
publicVariable "RGG_Logistics_Fuel";
publicVariable "RGG_Logistics_Sentries";

// Training
RGG_Training_Food = 0;
RGG_Training_Ammo = 0;
RGG_Training_Fuel = 0;
RGG_Training_Sentries = 0;
publicVariable "RGG_Training_Food";
publicVariable "RGG_Training_Ammo";
publicVariable "RGG_Training_Fuel";
publicVariable "RGG_Training_Sentries";

// Radar
RGG_Radar_Food = 0;
RGG_Radar_Ammo = 0;
RGG_Radar_Fuel = 0;
RGG_Radar_Sentries = 0;
publicVariable "RGG_Radar_Food";
publicVariable "RGG_Radar_Ammo";
publicVariable "RGG_Radar_Fuel";
publicVariable "RGG_Radar_Sentries";


// ----- cycle count of base supplies -----
[] spawn RGGc_fnc_count_depleteSupplies; // this depletes supplies of live bases every x seconds 

// ----- create initial supply crate to enable creation of supply depot -----
[] spawn RGGs_fnc_spawn_baseSpawnContainer;


// ----- Slingloading EH -----
// This is a hard-coded solution to enable slingloading EH on a set heli specified in the mission (for now, heli1) 
// this needs to be improved so that the EH is applied to the heli, even after respawn 
// note: rule/question - should only Hurons should be able to slingload? 
execVM "eventHandlers\slingLoadMonitor.sqf";

// ----- Start GUI calcs -----
execVM "dialogs\guiCalcs.sqf";

// ----- Garbage Removal -----
// very crude system of deletion - this should be improved to only apply to areas where players are not close by 
while {true} do {
	{ deleteVehicle _x } forEach allDead;
	systemChat "cleanup";
	sleep 300;
};


// action - review the code below and delete anything that won't be of use 

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
// REARMONSPAWN = true; // ?????


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