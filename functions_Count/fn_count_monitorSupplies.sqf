
while {true} do {
	
	sleep 30;

	if (BARRACKS) then {
		systemChat "Barracks Supplies:";
		systemChat format ["Food: %1", RGG_Barracks_Food];
		systemChat format ["Ammo: %1", RGG_Barracks_Ammo];
		systemChat format ["Fuel: %1", RGG_Barracks_Fuel];	
	};

	sleep 5;

	if (MEDICAL) then {
		systemChat "Med-Base Supplies:";
		systemChat format ["Food: %1", RGG_Medical_Food];
		systemChat format ["Ammo: %1", RGG_Medical_Ammo];
		systemChat format ["Fuel: %1", RGG_Medical_Fuel];	
	};

	sleep 5;

	if (RADAR) then {
		systemChat "Radar-Base Supplies:";
		systemChat format ["Food: %1", RGG_Radar_Food];
		systemChat format ["Ammo: %1", RGG_Radar_Ammo];
		systemChat format ["Fuel: %1", RGG_Radar_Fuel];	
	};

	sleep 5;

	if (OBSERVATION) then {
		systemChat "Observation-Post Supplies:";
		systemChat format ["Food: %1", RGG_Observation_Food];
		systemChat format ["Ammo: %1", RGG_Observation_Ammo];
		systemChat format ["Fuel: %1", RGG_Observation_Fuel];	
	};

	sleep 5;

	if (HELI) then {
		systemChat "Heli-Base Supplies:";
		systemChat format ["Food: %1", RGG_Heli_Food];
		systemChat format ["Ammo: %1", RGG_Heli_Ammo];
		systemChat format ["Fuel: %1", RGG_Heli_Fuel];	
	};

	sleep 5;

	if (CAR) then {
		systemChat "Car Pool Supplies:";
		systemChat format ["Food: %1", RGG_Car_Food];
		systemChat format ["Ammo: %1", RGG_Car_Ammo];
		systemChat format ["Fuel: %1", RGG_Car_Fuel];	
	};

	sleep 5;

	if (WORKSHOP) then {
		systemChat "Workshop Supplies:";
		systemChat format ["Food: %1", RGG_Workshop_Food];
		systemChat format ["Ammo: %1", RGG_Workshop_Ammo];
		systemChat format ["Fuel: %1", RGG_Workshop_Fuel];	
	};

	sleep 5;

	if (TRAINING) then {
		systemChat "Training-Camp Supplies:";
		systemChat format ["Food: %1", RGG_Training_Food];
		systemChat format ["Ammo: %1", RGG_Training_Ammo];
		systemChat format ["Fuel: %1", RGG_Training_Fuel];	
	};

};
