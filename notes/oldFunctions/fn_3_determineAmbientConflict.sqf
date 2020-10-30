/*
Function to create main battlezone pos, and two spawn (fob) points for blufor and opfor 
*/

/*
Note: the three position variables imported here (just below) are not used directly, but instead are 'passed though' this function and used in the following functions, thereby allowing us to avoid using global variables
*/

// ** imports
private ["_battleZone", "_bluforFob", "_opforFob"];
_battleZone = param[0];
_bluforFob = param[1];
_opforFob = param[2];
// ** imports

/* initial friendly infi presence 
1 = a few / 1 - 10
2 = quite a lot / 11 - 20
3 = loads of dem / 21 - 30 */
_initialBluforInfiPresence = selectRandom [1,2,3];

/* initial friendly vic presence 
1 = 1
2 = 2
3 = 3 */
_initialBluforVicPresence = selectRandom [1,2,3];

/* initial enemy infi presence 
1 = a few / 1 - 10
2 = quite a lot / 11 - 20
3 = loads of dem / 21 - 30 */
_initialOpforInfiPresence = selectRandom [1,2,3];

/* initial enemy vic presence 
1 = 1
2 = 2
3 = 3 */
_initialopforVicPresence = selectRandom [1,2,3];

/* ambient fires
0 = no fires 
1 = 1 burning vic
2 = 2 burning vics 
3 = 3 burning vics 
4 = 4 burning vics */
_burningVics = selectRandom [0,1,2,3,4];


// ** exports 
[_bluforFob, _opforFob] call RGG_fnc_5_spawnAmbientBuildings;
[_bluforFob, _opforFob, _initialBluforInfiPresence, _initialBluforVicPresence, _battleZone] call RGG_fnc_4a_spawnBluforUnits;
[_bluforFob, _opforFob, _initialOpforInfiPresence, _initialopforVicPresence, _battleZone] call RGG_fnc_4b_spawnOpforUnits;
// [_battleZone, _burningVics] call RGG_fnc_4c_spawnAmbientEffects;


// ** exports 
