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
501 cutRsc ["SUPPLY_STATS_TOP_LABEL", "PLAIN"];
502 cutRsc ["MEDICAL_STATS_TOP_LABEL", "PLAIN"];
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

		// TOTAL UNIT COUNT IN OBJECTIVE AREA (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "SUPPLY_STATS_TOP_LABEL";
		_setText = _displayOBJUNITS displayCtrl 999100;
		_setText ctrlSetStructuredText (parseText format ["SUPPLY DEPOT <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Supply_Food, RGG_Supply_Ammo, RGG_Supply_Fuel, RGG_Supply_Sentries]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
		
		if (!SUPPLY) then {
			_setText ctrlSetTextColor [1, 1, 0, 0.5]; // pale yellow - indicating needs to be established
		};
		// if ((SUPPLY) && (RGG_Supply_Food > 10)) then {
		// 	_setText ctrlSetTextColor [1, 1, 0, 1];
		// };
		if (SUPPLY) then {
			_setText ctrlSetTextColor [0, 1, 0, 1]; // green - indicates established and working
		};
		
		sleep 1;

		_displayOBJUNITS = uiNameSpace getVariable "BARRACKS_STATS_TOP_LABEL";
		_setText = _displayOBJUNITS displayCtrl 999101;
		_setText ctrlSetStructuredText (parseText format ["BARRACKS FOB <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Barracks_Food, RGG_Barracks_Ammo, RGG_Barracks_Fuel, RGG_Barracks_Sentries]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		if (!BARRACKS) then {
			_setText ctrlSetTextColor [0, 0, 0, 0.5]; // pale grey - indicating previous base needs to be made first
		};

		if ((!BARRACKS) && (SUPPLY)) then {
			_setText ctrlSetTextColor [1, 1, 0, 0.5]; // pale yellow - indicating needs to be established
		};

		if (BARRACKS) then {
			_setText ctrlSetTextColor [1, 1, 0, 1];
			if (RGG_Barracks_Food > 10) then {
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};
		};

		sleep 1;

		_displayOBJUNITS = uiNameSpace getVariable "MEDICAL_STATS_TOP_LABEL";
		_setText = _displayOBJUNITS displayCtrl 999102;
		_setText ctrlSetStructuredText (parseText format ["MEDICAL FOB <br />FOOD %1  <br />AMMO %2  <br />FUEL %3  <br />SENTRIES %4",RGG_Medical_Food, RGG_Medical_Ammo, RGG_Medical_Fuel, RGG_Medical_Sentries]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		if (!MEDICAL) then {
			_setText ctrlSetTextColor [0, 0, 0, 0.5]; // pale grey - indicating previous base needs to be made first
		}; 

		if ((!MEDICAL) && (BARRACKS)) then {
			_setText ctrlSetTextColor [1, 1, 0, 0.5]; // pale yellow - indicating needs to be established
		};

		if (MEDICAL) then {
			_setText ctrlSetTextColor [1, 1, 0, 1];
			if (RGG_Medical_Food > 10) then {
				_setText ctrlSetTextColor [0, 1, 0, 1];
			};
		};

		sleep 5;
	};
};
