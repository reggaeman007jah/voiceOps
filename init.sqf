// KILL WILDLIFE 
enableEnvironment [false, true];

If !(isServer) exitwith {};

// what is this, does it even work?
{_x addMPEventHandler ["MPKilled", {
	_dead = _this select 0;
	_killer = _this select 1;
	if ((side _dead == independent) && (side _killer == west)) then {
		systemChat "oh noes - blufor killed a friendly"
		};
	}];
} foreach allUnits;




// DECIDE = false; // I think this is the only var i need to declare, as the motion.sqf relys on this.

// execVM "autoPatrolSystem\reinforcementSystems\bluforRF.sqf";
// execVM "missionParams.sqf";
// init VA Arty

// execVM "VAMP_initParams\vampInitParams.sqf";
// sleep 2;
// execVM "voiceActivatedArty\VAA_Init.sqf";

// execVM "autoPatrolSystem\timeStampSystems\timeGen.sqf";

// MP EH (test)
// http://www.armaholic.com/forums.php?m=posts&q=33056
// source: Pierre MGI 
// sleep 10;

// // test
// 						position isFlatEmpty [minDistance, mode, maxGradient, maxGradientRadius, overLandOrWater, shoreLine, ignoreObject]
// _isFlatEmpty = !(position player isFlatEmpty  [15, -1, 0.1, 15, -1, false, player] isEqualTo []);

// Find position minimum 1m from from player but not further than 150m, not closer than 3m to any other object, not in the water, maximum gradient of 20, not on the shoreline:
// _pos = [player, 1, 150, 30, 0, 20, 0] call BIS_fnc_findSafePos;