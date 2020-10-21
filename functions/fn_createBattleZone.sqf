

// create base 
_baseLocation = [6470,3839.96];
_base = createMarker ["permaBase", _baseLocation];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [70, 70];
_base setMarkerAlpha 0.5;

// generate conflict zone 
// must be more than 2 but less than 5 away 
_battleZone = [_baseLocation, 2000, 5000, 3, 0, 0, 0] call BIS_fnc_findSafePos; // generate patrol obj between 600m and 900m away, and always over land 
_battleZoneMarker = createMarker ["battleZone", _battleZone];
_battleZoneMarker setMarkerShape "ELLIPSE";
_battleZoneMarker setMarkerColor "ColorRed";
_battleZoneMarker setMarkerSize [1000, 1000];
_battleZoneMarker setMarkerAlpha 0.5;

call RGG_fnc_createAmbientConflict [_battleZone];