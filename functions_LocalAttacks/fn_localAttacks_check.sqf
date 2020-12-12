/*
This Function will decide which base should be attacked by a local camp 

Notes:
When all local bases are destroyed, this will stop (i.e. LOCALATTACK will be false)
This will run every x seconds until all camps are dealt with 

We check whether dead camps == 9, if 9 then process stops 
Else, we ID what bases are live, and from there what camps are near live bases 

Extended Notes:
we want to create local attacks against bases, which will continue until the camp is found and destroyed 
for each base created, a camp will be created 
each camp creation pushes a camp pos to a global array 
each camp destroyed deletes that pos from the candidates array and pushes to the destroyed camps array 
when destroyed camps == 9, job is done 

_campData = [_heliPad, _campSitePos, "barracks"];
RGG_potentialEnemyCamps pushBack _campData;

*/

// so if we accept that there might be an active enemy base out there 
// LOCALATTACK bool will be false only when all 9 bases have been destroyed 
while {LOCALATTACKS} do {
	
	// check if any attacks can happen by counting RGG_destroyedEnemyCamps
	_destroyedCamps = count RGG_destroyedEnemyCamps;
	if (_destroyedCamps == 9) then {
		LOCALATTACK = false;
		// exitWith {};
	} else {
		systemChat "CHECKING FOR LOCAL ATTACKS";
		// decide which live base should be attacked and has a base nearby 
		// to do this we see which bases are in the relevant canididate array 
		_candidates = count RGG_potentialEnemyCamps;
		if (_candidates > 0) then {
			_attackingCamp = selectRandom RGG_potentialEnemyCamps;
			_campPos = _attackingCamp select 0;
			_targetPos = _attackingCamp select 1;
			_target = _attackingCamp select 2;
			[_campPos, _targetPos, _target] call RGGs_fnc_LocalAttacks_generate;
		};
	};
	sleep 360;
};