while {true} do {

	if (BARRACKS) then {
		if (RGG_Barracks_Food > 0) then {
			RGG_Barracks_Food = RGG_Barracks_Food -1;
		} else {
			systemChat "alert: Barracks has no food!";
		};
		if (RGG_Barracks_Fuel > 0) then {
			RGG_Barracks_Fuel = RGG_Barracks_Fuel -1;
		} else {
			systemChat "alert: Barracks has no fuel!";
		};
		if (RGG_Barracks_Ammo > 0) then {
			RGG_Barracks_Ammo = RGG_Barracks_Ammo -1;
		} else {
			systemChat "alert: Barracks has no ammo!";
		};
	};

	sleep 1;

	if (MEDICAL) then {
		if (RGG_Medical_Food > 0) then {
			RGG_Medical_Food = RGG_Medical_Food -1;
		} else {
			systemChat "alert: Medical Base has no food!";
			// RGG_Medical_Food = RGG_Medical_Food -1;
		};
		if (RGG_Medical_Fuel > 0) then {
			RGG_Medical_Fuel = RGG_Medical_Fuel -1;
		} else {
			systemChat "alert: Medical Base has no fuel!";
			// RGG_Medical_Fuel = RGG_Medical_Fuel -1;
		};
		if (RGG_Medical_Ammo > 0) then {
			RGG_Medical_Ammo = RGG_Medical_Ammo -1;
		} else {
			systemChat "alert: Medical Base has no ammo!";
			// RGG_Medical_Ammo = RGG_Medical_Ammo -1;
		};
	};

	sleep 120;

};