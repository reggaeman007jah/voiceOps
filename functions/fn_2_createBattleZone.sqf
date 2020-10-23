/*
This function creates initial positions and markers for a randonly generated skirmish
*/  

// ** imports 
// none 
// ** imports 

/*
Notes:
Creates marker for main base - this could be done separately, but felt it was just easy to manage markers in one place 
Creates marker for main battlezone 
Creates markers for both blufor and opfor fobs 
Blufor fob is created using a rand360 
Opfor fob is also created, however currently hardcoded (see issues below)
This fnc and subsequent fncs will enable the creation of a random battlezone, with each side given a FOB 
if fob A = 90 degrees, fob B will be 270 degrees 
On activation, units will spawn and go head to head, in an attempt to capture the other spawn position location

To do:
If a side unit gets to be within 10m of the enemy spawn point, then the losing side cannot spawn any more units 
Units are spawned every 5 mins 

Issues:
.. current bug - unable to generate opposite rand360 position!
var angle = 210;
var oppositeAngle = (angle + 180) % 360;
*/

// register main base as a blue marker
_baseLocation = [6470,3839.96];
_base = createMarker ["permaBase", _baseLocation];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [100, 100];
_base setMarkerAlpha 0.5;

// generate conflict zone as a large grey marker
_battleZone = [_baseLocation, 2000, 5000, 3, 0, 0, 0] call BIS_fnc_findSafePos; // generate point between 2000m and 5000m away from main base, and always over land 
_battleZoneMarker = createMarker ["battleZone", _battleZone];
_battleZoneMarker setMarkerShape "ELLIPSE";
_battleZoneMarker setMarkerSize [1000, 1000];
_battleZoneMarker setMarkerAlpha 0.5;

// generate 2 spawn locations 1km from centre
_r360 = random 360;
_random360 = _battleZone getPos [750, _r360]; // generate point 750m away 
_bluforPos = [_random360, 1, 100, 3, 0, 0, 0] call BIS_fnc_findSafePos; // generate patrol obj between 1m and 100m away, and always over land

// _o360 = (_random360 + 180) % 360;
_o360 = 090;
_opp360 = _battleZone getPos [750, _o360]; // generate point 750m away 
_opforPos = [_opp360, 1, 100, 3, 0, 0, 0] call BIS_fnc_findSafePos; // generate patrol obj between 1m and 100m away, and always over land 

_bluforPosMarker = createMarker ["_bloforPos", _bluforPos];
_bluforPosMarker setMarkerShape "ELLIPSE";
_bluforPosMarker setMarkerColor "ColorBlue";
_bluforPosMarker setMarkerSize [50, 50];
_bluforPosMarker setMarkerAlpha 0.7;

_opforPosMarker = createMarker ["_opforPos", _opforPos];
_opforPosMarker setMarkerShape "ELLIPSE";
_opforPosMarker setMarkerColor "ColorRed";
_opforPosMarker setMarkerSize [50, 50];
_opforPosMarker setMarkerAlpha 0.7;

// ** exports 
[_battleZone, _bluforPos, _opforPos] call RGG_fnc_3_determineAmbientConflict;
// ** exports 


// the above works like this:
// create random 360, and opposite number from 360 (in degrees)
// then using battlezone anchor point, find a point 750m away, both for 360 and opp360 
// then using find safezone for each, select a suitable location within 100m of each point.

// distance can vary potentially, with shorter distances meaning more intense fighting 
// spawn frequency will also affect this 
// there should be a marker like a tent to capture 

// create fob / start / respawn points for both enemies 
// note, if enemy takes the other spawn point they win

/*
create opposing FOB points 
blufor and opfor both get a point to control - this is where new units are spawned, and if this point is taken the mission is over 
select random 360 - assign to blufor 
select opposite degreee - assign to opfor
*/


