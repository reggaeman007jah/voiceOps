/*
This function manages all ambient flybys 
*/

// ** imports 
private ["_fobBaseLocation"];
_fobBaseLocation = param[0]; // focus point for flybys 
// ** imports 

while {true} do {
	// _sleep = selectRandom [30, 60, 90, 120, 180, 240, 300]; // determines how long between each batch of ambients 
	// sleep _sleep; // random sleep between spawn batches 

	// manual low sleep for testing 
	_sleep = 5;

	// set number of ambients per spawn 
	_number = selectRandom [1,2,3,4,5,6]; 
	
	// confirmed type of ambient 
	_type = selectRandom ["B_Plane_CAS_01_dynamicLoadout_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F", "B_Heli_Light_01_dynamicLoadout_F"]; 
	// note: 4 types, each batch is always the same type - you wont get a jet and an MH6 together 

	// local vars declared 
	private ["_n","_ne","_s","_se","_s","_sw","_w","_nw","_ambientOrigin","_ambientDestination"];

	// determine origin (heading)
	_origin = selectRandom [_n,_ne,_s,_se,_s,_sw,_w,_nw]; 

	// determines start and end headings for ambients 
	switch (_origin) do {
		case _n: 	{ _ambientOrigin = 0, _ambientDestination = 180 };
		case _ne: 	{ _ambientOrigin = 45, _ambientDestination = 225 };
		case _e: 	{ _ambientOrigin = 90, _ambientDestination = 270 };
		case _se: 	{ _ambientOrigin = 135, _ambientDestination = 315 };
		case _s: 	{ _ambientOrigin = 180, _ambientDestination = 0 };
		case _sw: 	{ _ambientOrigin = 225, _ambientDestination = 45 };
		case _w: 	{ _ambientOrigin = 270, _ambientDestination = 90 };
		case _nw: 	{ _ambientOrigin = 315, _ambientDestination = 135 };
		default 	{ hint "default" };
	};

	// calculates ambient start and end points 
	_startPos = _fobBaseLocation getPos [5000, _ambientOrigin]; 
	_endPos = _fobBaseLocation getPos [5000, _ambientDestination]; 

	// set ambient height 
	_height = selectRandom [100,300,500,700,900];

	// declare vars 
	private ["_formationType","_singleAmbient","_line","_echelon","_vee","_wedge","_parallel"];

	// determine formation 
	switch (_number) do {
		case 1: 	{ _formationType = selectRandom [_singleAmbient] };
		case 2: 	{ _formationType = selectRandom [_line, _echelon] };
		case 3: 	{ _formationType = selectRandom [_line, _echelon, _vee, _wedge] };
		case 4: 	{ _formationType = selectRandom [_line, _echelon, _parallel] };
		case 5: 	{ _formationType = selectRandom [_line, _echelon, _vee, _wedge] };
		case 6: 	{ _formationType = selectRandom [_line, _echelon, _parallel] };
		default 	{ hint "default" };
	};

	// spawn formation 
	switch (_formationType) do {

		// single ambient 
		case _singleAmbient: { [_startPos, _endPos, _height, "FULL", _type, west] call BIS_fnc_ambientFlyby; };

		// 2 - 6 ambients 
		case _line: {
			for "_i" from 1 to _number do {
				[_startPos, _endPos, _height, "FULL", _type, west] call BIS_fnc_ambientFlyby;
				sleep 5; // spacer sleep between each iteration to prevent spawn overlaps 	
			};
		};

		// 2 - 6 ambients 
		case _echelon: {
			_spacerDist = 5; // test this to ensure echelon looks nice - too small and it just looks like a line formation
			_spacerTime = 1; // test this to ensure echelon looks nice - too small and it just looks like a line formation 
			for "_i" from 1 to _number do {
				[_startPos, _endPos, _height, "FULL", _type, west] call BIS_fnc_ambientFlyby;

				switch (_origin) do {
					case _n: 	{ _startPos = _startPos getPos [_spacerDist, 90] };
					case _ne: 	{ _startPos = _startPos getPos [_spacerDist, 135] };
					case _e: 	{ _startPos = _startPos getPos [_spacerDist, 180] };
					case _se: 	{ _startPos = _startPos getPos [_spacerDist, 225] };
					case _s: 	{ _startPos = _startPos getPos [_spacerDist, 270] };
					case _sw: 	{ _startPos = _startPos getPos [_spacerDist, 315] };
					case _w: 	{ _startPos = _startPos getPos [_spacerDist, 0] };
					case _nw: 	{ _startPos = _startPos getPos [_spacerDist, 45] };
					default 	{ hint "default" };
				};
				sleep _spacerTime; // spacer sleep between each iteration to prevent spawn overlaps 	
			};
		};

		// 3 or 5 ambients 
		// case _vee: {
		// 	if (_number == 5) then {
		// 		// 
		// 	} else {
				
		// 	};
		// };

		// 3 or 5 ambients 
		case _wedge: {
			[_startPos, _endPos, _height, "FULL", _type, west] call BIS_fnc_ambientFlyby; // lead ambient 
			_spacerDist = 5; // test this to ensure echelon looks nice - too small and it just looks like a line formation
			_spacerTime = 1; // test this to ensure echelon looks nice - too small and it just looks like a line formation 
			
			for "_i" from 1 to _number do {

				switch (_origin) do {
					case _n: 	{ _startPos = _startPos getPos [_spacerDist, 90] };
					case _ne: 	{ _startPos = _startPos getPos [_spacerDist, 135] };
					case _e: 	{ _startPos = _startPos getPos [_spacerDist, 180] };
					case _se: 	{ _startPos = _startPos getPos [_spacerDist, 225] };
					case _s: 	{ _startPos = _startPos getPos [_spacerDist, 270] };
					case _sw: 	{ _startPos = _startPos getPos [_spacerDist, 315] };
					case _w: 	{ _startPos = _startPos getPos [_spacerDist, 0] };
					case _nw: 	{ _startPos = _startPos getPos [_spacerDist, 45] };
					default 	{ hint "default" };
				};
				sleep _spacerTime; // spacer sleep between each iteration to prevent spawn overlaps 	
			};


		};

		// 4 or 6 ambients 
		case _parallel: {

		};

		default 	{ hint "default" };
	};

};




// echelon jets 
/*
get start pos of focus area (eg player, fob etc) 
Calc start point 5km away from focus 
Calc end point 5km away from focus 

decide type of ambient - littlebird, chinook, hellcat, jet 

decide on height - low medium high very high 

decide on number 1 to 5

decide on formation (based on number)- column, line, echelon 

*/


/*
ambient spawner for effect only 
Improvement ideas 
decide from which / to direction 
decide how many in flight 
decide on formation (line or column or echelon or vee)
decide on spawn gap 
decide on alt#
decide on speed 
decide if mixed or one class (if mixed, what are the other downstream requirements (ie no AH6 + jets))
store pos at local so it does not crap out if the obj changes 
always have ambient flybys go relative to the next patrol obj
*/




/*
notes:

how do we want to run this system? flyby over any live base? or over players?
could we grab pos of each player on server and send over their heads?

from das attorney 
https://forums.bohemia.net/forums/topic/163897-getpos-player-in-multiplayer/

***

private ["_sleep","_pos","_player","_players"];

_sleep = 5;	// change this number to alter rate of script.
while {true} do {
	_players = playableUnits + switchableUnits;

	if (count _players > 0) then {}
		{
			_player = _x;
			if (not isNull _player) then
			{
				_pos = getPosATL _player;
							
					//Now you know the player and his/her position,
					//you can do your code here
				
			};
		} forEach _players;
		sleep _sleep;
	}
	else
	{
		// exception code in case no players
		sleep _sleep;
	};
};

***

from kc grimes

playerarray = [];
{
	playerarray = playerarray + [_x];
} forEach playableUnits;

randomplayer = playerarray call BIS_fnc_selectRandom;

randomplayerpos = getPos randomplayer;
_wp = AS addWaypoint [randomplayerpos, 0];
_wp setWaypointType "MOVE"; 

***




old 
B_Plane_CAS_01_dynamicLoadout_F
[startPos, endPos, altitude, speedMode, classname, side] call BIS_fnc_ambientFlyby;
always over RGG_patrol_obj
player getPos [100,45];
000 / 180 
180 / 000
090 / 270
270 / 090
get an origin by taking patrol point, then get pos east at 090 100m 
then get pos west 270 from patrol point 
