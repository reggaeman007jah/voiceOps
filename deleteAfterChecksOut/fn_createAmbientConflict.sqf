// note - not needed now I think


[_battleZone, _bluforFob, _opforFob, _initialBluforInfiPresence, _initialBluforVicPresence, _initialOpforInfiPresence, _initialopforVicPresence, _burningVics]

private ["_battleZone", "_bluforFob", "_opforFob", "_initialBluforInfiPresence", "_initialBluforVicPresence", "_initialOpforInfiPresence", "_initialopforVicPresence", "_burningVics"];

_battleZone = param[0]; // main hub
_bluforFob = param[1]; // blujfor spawn 
_opforFob = param[2]; //opfor spawn 
_initialBluforInfiPresence = param[3]; 
_initialBluforVicPresence = param[4];
_initialOpforInfiPresence = param[5];
_initialopforVicPresence = param[6];
_burningVics = param[7];

// initial friendly infi presence / _initialBluforInfiPresence
// 1 = a few / 1 - 10
// 2 = quite a lot / 11 - 20
// 3 = loads of dem / 21 - 30

// initial friendly vic presence / _initialBluforVicPresence
// 1 = 1
// 2 = 2
// 3 = 3






// initial enemy vic presence / _initialopforVicPresence
// 1 = 1
// 2 = 2
// 3 = 3

// ambient fires / _burningVics
// 0 = no fires 
// 1 = 1 burning vic
// 2 = 2 burning vics 
// 3 = 3 burning vics 
// 4 = 4 burning vics 
 




/*
	threat level 0 1 2 3 
	0 = no enemy 
	1 = a few 
	2 = quite a lot 
	3 = loads of dem 

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

	types of effects 
	0 = no effects 
	1 = 1-2 burning vics 
	2 = 3-4 burning vics 
*/

/*
private ["_threatLevel, _ambush, _defAtt, _blufor, _opfor, _effects"];

_threatLevel = param[0];
_ambush = param[1];
_defAtt = param[2];
_blufor = param[3];
_opfor = param[4];
_effects = param[5];
*/

// create mayhem 