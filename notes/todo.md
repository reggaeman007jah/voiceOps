Things to do...

generate ambient combat zones
selecting location for battlezone
generating opfor
generating blufor
pitching against eachother - move orders
checking for blufor win/lose status
running mission clock - end mission after x mins .. test

types of missions
CAS
Medevac
MH6 Insertion
MH6 Pickup > RTB ¦¦ new location
Huron Insertion > RTB ¦¦ new location
FAC / CAS (needs more thought)

missions are created when pilot gets into a particular heli
AH6 > CAS
MH6 > Insertion / Pickup / small numbers
Huron > Insertion / Pickup / large numbers

Voice Ops Ideas (example)
You're in a heli, you get voice message telling you to:
pickup x troops
they are x m from your current location
heading xxx
grid ref xxxx xxxx
area is hot
pick up on green smoke

We need to enable both totally random skirmishes as well as more defined missions

/\*
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

\*/

// old, maybe useful
// \_rndOp1 = selectRandom [0, 3, 4, 5, 6];
// systemchat format ["1st wave: %1", _rndOp1];

taken from when i was pitching two groups vs eachother - too basic, but worth keeping

// generate 2 spawn locations 1km from centre
\_r360 = random 360;
\_random360 = \_battleZone getPos [750, _r360]; // generate point 750m away in random direction
\_bluforPos = [_random360, 1, 500, 20, 0, 0, 0] call BIS_fnc_findSafePos; // generate blufor FOB pos (respawn) 1m and 100m away, and always over land

// \_o360 = (\_random360 + 180) % 360;
// \_o360 = 090;
private \_o360 = "\_o360";
if ((\_r360 >=0) && (\_r360 <179)) then {
\_o360 = \_r360 + 180;
} else {
\_o360 = \_r360 - 180;
};
\_opp360 = \_battleZone getPos [750, _o360]; // generate point 750m away
\_opforPos = [_opp360, 1, 100, 3, 0, 0, 0] call BIS_fnc_findSafePos; // generate pos between 1m and 100m away, and always over land

\_bluforPosMarker = createMarker ["_bloforPos", _bluforPos];
\_bluforPosMarker setMarkerShape "ELLIPSE";
\_bluforPosMarker setMarkerColor "ColorBlue";
\_bluforPosMarker setMarkerSize [50, 50];
\_bluforPosMarker setMarkerAlpha 0.7;

\_opforPosMarker = createMarker ["_opforPos", _opforPos];
\_opforPosMarker setMarkerShape "ELLIPSE";
\_opforPosMarker setMarkerColor "ColorRed";
\_opforPosMarker setMarkerSize [50, 50];
\_opforPosMarker setMarkerAlpha 0.7;
