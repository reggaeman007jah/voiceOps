private ["_battleZone", "_bluforFob", "_opforFob"];

_battleZone = param[0];
_bluforFob = param[1];
_opforFob = param[2];

/*
	we should determine what is happening on ground 
	is it peaceful?
	peaceful until we show up?
	infi conflict?
	vehicles?
	Tanks?
	smoke?
	burning vics?
	defending or attacking?



	ambush on approach
	0 = zero chance 
	1 = yes small arms 
	2 = yes, AA 

	defend / attack
	0 = blufor based in center
	1 = opfor based in center 

	type of blufor 
	0 = infi small 
	1 = infi medium 
	2 = infi large 
	3 = infi + vics small 
	4 = infi + vics med 
	5 = infi + vics large 

	type of opfor 
	0 = infi small 
	1 = infi medium 
	2 = infi large 
	3 = infi + vics small 
	4 = infi + vics med 
	5 = infi + vics large 

*/

// initial friendly infi presence 
// 1 = a few / 1 - 10
// 2 = quite a lot / 11 - 20
// 3 = loads of dem / 21 - 30
_initialBluforInfiPresence = selectRandom [1,2,3];

// initial friendly vic presence 
// 1 = 1
// 2 = 2
// 3 = 3
_initialBluforVicPresence = selectRandom [1,2,3];

// initial enemy infi presence 
// 1 = a few / 1 - 10
// 2 = quite a lot / 11 - 20
// 3 = loads of dem / 21 - 30
_initialOpforInfiPresence = selectRandom [1,2,3];

// initial enemy vic presence 
// 1 = 1
// 2 = 2
// 3 = 3
_initialopforVicPresence = selectRandom [1,2,3];

// ambient fires
// 0 = no fires 
// 1 = 1 burning vic
// 2 = 2 burning vics 
// 3 = 3 burning vics 
// 4 = 4 burning vics 
_burningVics = selectRandom [0,1,2,3,4];


// output of this function contains elements that make up the actual bz 
// [_battleZone, _bluforFob, _opforFob, _initialBluforInfiPresence, _initialBluforVicPresence, _initialOpforInfiPresence, _initialopforVicPresence, _burningVics] call RGG_fnc_createAmbientConflict;

[_bluforFob, _opforFob, _initialBluforInfiPresence, _initialBluforVicPresence] call RGG_fnc_4a_spawnBluforUnits;

[_bluforFob, _opforFob, _initialOpforInfiPresence, _initialopforVicPresence] call RGG_fnc_4b_spawnOpforUnits;

[_battleZone, _burningVics] call RGG_fnc_4c_spawnAmbientEffects;



