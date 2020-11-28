
/*
Notes:
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

// ----- time speed up -----
setTimeMultiplier 60;

// ----- creation states -----
// these globals record whether a type of base exists or not .. the more bases that exist the more reports players get 
// everything is false to start with, as nothing exists when mission starts 
SUPPLY = false;
BARRACKS = false;

MEDICAL = false;
RADAR = false;

OBSERVATION = false; // remove?

HELI = false;
CAR = false;

WORKSHOP = false;
TRAINING = false;


// ----- this holds and sentry units waiting to spawn in (but can't due to lack of base food) -----
RGG_sentryQueue = []; // holds sentry respawn data 
RGG_supplyQueue = []; // holds supply respawn data 

// --- Base Stats -----
// these record base stats for food, fuel ammo and defences xx

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

// Radar
RGG_Radar_Food = 0;
RGG_Radar_Ammo = 0;
RGG_Radar_Fuel = 0;
RGG_Radar_Sentries = 0;
publicVariable "RGG_Radar_Food";
publicVariable "RGG_Radar_Ammo";
publicVariable "RGG_Radar_Fuel";
publicVariable "RGG_Radar_Sentries";

// Observation
RGG_Observation_Food = 0;
RGG_Observation_Ammo = 0;
RGG_Observation_Fuel = 0;
RGG_Observation_Sentries = 0;
publicVariable "RGG_Observation_Food";
publicVariable "RGG_Observation_Ammo";
publicVariable "RGG_Observation_Fuel";
publicVariable "RGG_Observation_Sentries";

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

// Workshop
RGG_Workshop_Food = 0;
RGG_Workshop_Ammo = 0;
RGG_Workshop_Fuel = 0;
RGG_Workshop_Sentries = 0;
publicVariable "RGG_Workshop_Food";
publicVariable "RGG_Workshop_Ammo";
publicVariable "RGG_Workshop_Fuel";
publicVariable "RGG_Workshop_Sentries";

// Training
RGG_Training_Food = 0;
RGG_Training_Ammo = 0;
RGG_Training_Fuel = 0;
RGG_Training_Sentries = 0;
publicVariable "RGG_Training_Food";
publicVariable "RGG_Training_Ammo";
publicVariable "RGG_Training_Fuel";
publicVariable "RGG_Training_Sentries";


// ----- cycle count of base supplies -----
// [] spawn RGGc_fnc_count_monitorSupplies; // this counts supplies of any 'live' base every x seconds // don't need this now 
[] spawn RGGc_fnc_count_depleteSupplies; // this depletes supplies of live bases every x seconds 

// ----- create initial supply crate to enable creation of supply depot -----
// [] spawn RGGs_fnc_spawn_baseSpawnCrate;
[] spawn RGGs_fnc_spawn_baseSpawnContainer;


// ----- Slingloading EH -----
// This is a hard-coded solution to enable slingloading EH on a set heli specified in the mission (heli1) 
// this needs to be improced so that the EH is applied to the heli, even after respawn 
// note: rule - only Hurons should be able to slingload? 
execVM "eventHandlers\slingLoadMonitor.sqf";

// ----- Start GUI calcs -----
execVM "dialogs\guiCalcs.sqf";

// ----- Garbage Removal -----
// very crude system of deletion 
// this should be improved to only apply to areas where players are not close by 
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
REARMONSPAWN = true; // ?????


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