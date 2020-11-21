/*
This manages the queue of sentries if they cannot be spawned in due to lack of food 

Notes: 
It is only triggered every time a new supply crate is dropped ... if there are sentries in the queue, they should be spawned from this script in sequence 
The respawn for this should be much slower than if the base is fully stocked - to encourage bases to never be at zero supplies 
Also, this will serve all live bases, so if you use select 0 then this is a FIFO system - but also consider doing a random thing here ..?
*/

_waitingSentries = count RGG_sentryQueue;
systemChat format ["There are currently %1 Sentries in the queue", _waitingSentries];

if (_waitingSentries > 0) then {
	sleep 15;
	// systemChat format ["DEBUG --- Sentry Queue: %1 --- DEBUG", RGG_sentryQueue];
	_firstBackIn = RGG_sentryQueue select 0;
	_pos = _firstBackIn select 0;
	_dir = _firstBackIn select 1;
	_type = _firstBackIn select 2;
	_base = _firstBackIn select 3;
	systemChat "spawning reserve unit";
	[_pos, _dir, _type, _base] call RGGs_fnc_spawn_bluforSentries;

	// RGG_Barracks_Food = RGG_Barracks_Food - 1;
	// publicVariable "RGG_Barracks_Food";

	systemChat format ["There are currently %1 Sentries at the Barracks FOB", RGG_Barracks_Sentries];
	systemChat format ["Base Food Supplies is now: %1", RGG_Barracks_Food];

	RGG_sentryQueue deleteAt 0;
	[] spawn RGGs_fnc_spawn_bluforSentryRespawnQueue; 
} else {
	systemChat "no sentries waiting to go back in, supplies added to base supply stash score";
	// remove this else when confirmed all works ok 
};



