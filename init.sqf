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