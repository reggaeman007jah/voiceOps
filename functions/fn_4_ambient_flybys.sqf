/*
This function manages all ambient flybys 
*/

// ** imports 
private ["_fobBaseLocation"];
_fobBaseLocation = param[0]; // focus point for flybys 
// ** imports 

// sleep 300; // initial delay

while {true} do {
	_sleep = selectRandom [60, 90, 120, 180, 240, 300]; // determines how long between each batch of ambients 
	sleep _sleep; // random sleep between spawn batches 
	_number = selectRandom [1,2,3,4,5]; // determines how many ambients per spawn event 
	_type = selectRandom ["B_Plane_CAS_01_dynamicLoadout_F", "B_Heli_Transport_01_F", "B_Heli_Transport_03_F", "B_Heli_Light_01_dynamicLoadout_F"]; // 4 types, each batch is always the same type - you wont get a jet and an MH6 together 
	_startPos = _fobBaseLocation getPos [5000, 90]; // starts east of the patrol point 
	_endPos = _fobBaseLocation getPos [5000, 270]; // ends west of the patrol point 
	_height = selectRandom [100,300,500,700,900];
	// _formation = selectRandom [1,2,3]
	for "_i" from 1 to _number do {
		[_startPos, _endPos, _height, "FULL", _type, west] call BIS_fnc_ambientFlyby;
		sleep 5; // spacer sleep between each iteration to prevent spawn overlaps 	
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
