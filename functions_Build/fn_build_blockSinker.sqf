/*
This function manages the sinking and deleting of blocks passed to it
*/

// -------------------------------------------------------------------------------------------
params ["_object2"];

_object2 = _this select 0;
_object2 enableSimulation false;
_seedPos = getPos _object2;

for [{_i = 0}, {_i > -5}, {_i = _i - 0.1}] do {
	_seedPos set [2,_i]; 
	_object2 setPos _seedPos;
	sleep 0.1;
};

_object2 setPos [0,0];

if (typeOf _object2 == "I_supplyCrate_F") then { 
	_supplySpawnPos = _object2 getVariable "supplySpawnPos";
	_crate = "I_supplyCrate_F" createVehicle [1,1];;
	_pos = _supplySpawnPos select 0;
	[_crate, _pos, 0] spawn RGGb_fnc_build_blockManager;
};

deleteVehicle _object2;



// ------------------------------------------------------------------------------------------


