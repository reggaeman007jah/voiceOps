/*
Manages GUI calcs 

Notes: just testing Barracks for now 
RGG_Barracks_Food = 0;
RGG_Barracks_Ammo = 0;
RGG_Barracks_Fuel = 0;
RGG_Barracks_Sentries = 0;
*/

disableSerialization;

// MISSION INTEL 
500 cutRsc ["BARRACKS_STATS_TOP_LABEL", "PLAIN"];
// 501 cutRsc ["BARRACKS_STATS_FOOD_LABEL", "PLAIN"];
// 502 cutRsc ["BARRACKS_STATS_FOOD_VALUE", "PLAIN"];
// 503 cutRsc ["BARRACKS_STATS_AMMO_LABEL", "PLAIN"];
// 504 cutRsc ["BARRACKS_STATS_AMMO_VALUE", "PLAIN"];
// 505 cutRsc ["BARRACKS_STATS_FUEL_LABEL", "PLAIN"];
// 506 cutRsc ["BARRACKS_STATS_FUEL_VALUE", "PLAIN"];
// 507 cutRsc ["BARRACKS_STATS_SENTRY_LABEL", "PLAIN"];
// 508 cutRsc ["BARRACKS_STATS_SENTRY_VALUE", "PLAIN"];


// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "BARRACKS_STATS_TOP_LABEL")};

// HUD function ---------------------------------------------------------------------------------

[] spawn {

	while {true} do {

		// // total count in game 
		// _barracksFoodCount = RGG_Barracks_Food;
		// // total blufor in game
		// _barracksAmmoCount = RGG_Barracks_Ammo;
		// // total opfor in game
		// _barracksFuelCount = RGG_Barracks_Fuel;
		// // total count in objective zone
		// _barracksSentryCount = RGG_Barracks_Sentries;

		// TOTAL UNIT COUNT IN OBJECTIVE AREA (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "BARRACKS_STATS_TOP_LABEL";
		_setText = _displayOBJUNITS displayCtrl 999100;
		_setText ctrlSetStructuredText (parseText format ["BARRACKS STATS <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Barracks_Food, RGG_Barracks_Ammo, RGG_Barracks_Fuel, RGG_Barracks_Sentries]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// // TOTAL BLUFOR UNIT COUNT IN GAME (NUMBERS AND WORDS)
		// _displayOBJUNITS = uiNameSpace getVariable "BLUDATA";
		// _setText = _displayOBJUNITS displayCtrl 999510;
		// _setText ctrlSetStructuredText (parseText format ["BLUFOR ASSETS<br /> TOTAL UNITS IN COMBAT ZONE %1<br />  TOTAL UNITS IN MAIN AO %2<br />", _allBluUnitsObj, _allBluforBZ]); 
		// _setText ctrlSetBackgroundColor [0,0,0,0.5];


		// // TOTAL OPFOR UNIT COUNT IN GAME (NUMBERS AND WORDS)
		// _displayOBJUNITS = uiNameSpace getVariable "OPDATA";
		// _setText = _displayOBJUNITS displayCtrl 999520;
		// _setText ctrlSetStructuredText (parseText format ["OPFOR ASSETS<br /> TOTAL UNITS IN COMBAT ZONE%1<br />  TOTAL UNITS IN MAIN AO %2<br />", _allOpUnitsObj, _allOpforBZ]);
		// _setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 5;
	};
};
