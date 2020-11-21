/*
This manages the queue of sentries if they cannot be spawned in due to lack of food 

Notes: 
It is only triggered every time a new supply crate is dropped ... if there are sentries in the queue, they should be spawned from this script in sequence 
The respawn for this should be much slower than if the base is fully stocked - to encourage bases to never be at zero supplies 
Also, this will serve all live bases, so if you use 'RGG_sentryQueue select 0' then this is essentially a FIFO system - but also consider doing a random thing here ..?
We do not handle base supply score adjustments here - this is done by the spawner script

Issues:
Currently this is fixed to barracks, but it should ideally serve all bases 
*/

_waitingSentries = count RGG_sentryQueue; // used to determine if there is any spawning work to do here 
_sleep = 30; // respawn speed for anything queued 

if (_waitingSentries > 0) then {
	systemChat format ["There are currently %1 Sentries in the queue", _waitingSentries]; // debug 
	sleep _sleep;
	_firstBackIn = RGG_sentryQueue select 0; // first in queue 
	_pos = _firstBackIn select 0;
	_dir = _firstBackIn select 1;
	_type = _firstBackIn select 2;
	_base = _firstBackIn select 3;
	systemChat "spawning reserve unit";
	[_pos, _dir, _type, _base] call RGGs_fnc_spawn_bluforSentries; // sends sentry data to spawn script 

	systemChat format ["There are currently %1 Sentries at the %2 FOB", RGG_Barracks_Sentries, _base]; // to be tested - does this work across all base types?
	// systemChat format ["Base Food Supplies is now: %1", RGG_Barracks_Food];

	RGG_sentryQueue deleteAt 0; // delete the thing you just spawned 
	[] spawn RGGs_fnc_spawn_bluforSentryRespawnQueue; // re-run this function - if there are more in the queue they will be processed, if not, then the loop ends 
};



