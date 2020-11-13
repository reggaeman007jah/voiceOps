/*
Build med base FOB
*/

// -------------------------------------------------------------------------------------------
// setup 

sleep 10;
_spawnSpeed = 0.5;
_mapCorner = [0,0]; // corner pos for initial spawning to hide glitching 
_object2 = _this select 0; // reference to the item dropped 
_rootPos = getPos _object2; // reference to the position of the item dropped 

[_object2] spawn RGGb_fnc_build_blockSinker;


// -------------------------------------------------------------------------------------------
// block and asset positions 

_genesisPos = _rootPos getPos [20,315];				// 20m NW of root pos 

_NWCorner = _genesisPos getPos [1.7,180]; 			// NW Corner

_northBlock1 = _genesisPos getPos [5.5,90];			// north 1
_northBlock2 = _genesisPos getPos [13.9,90];		// north 2
_northBlock3 = _genesisPos getPos [22.3,90];		// north 3
_northBlock4 = _genesisPos getPos [30.7,90];		// north 4

_NECorner = _genesisPos getPos [38.2,90];			// NE Corner
_NECorner = _NECorner getPos [1.2,180];				// NE Corner v2

_eastBlock1 = _NECorner getPos [5.6,180];			// east 1
_eastBlock1 = _eastBlock1 getPos [2,90];			// east 1 v2
_eastBlock2 = _eastBlock1 getPos [8.3,180];  		// east 2
_eastBlock3 = _eastBlock1 getPos [16.7,180];		// east 3
_eastBlock4 = _eastBlock1 getPos [25.1,180];		// east 4

_SECorner = _eastBlock1 getPos [32.5, 180];			// SE Corner
_SECorner = _SECorner getPos [1.38, 270];			// SE Corner v2

_southBlock1 = _SECorner getPos [1.53,180];			// south 1
_southBlock1 = _southBlock1 getPos [5.7,270];		// south 1 v2
_southBlock2 = _southBlock1 getPos [8.47,270];		// south 2
_southBlock3 = _southBlock1 getPos [16.8,270];		// south 3
_southBlock4 = _southBlock1 getPos [25.1,270];		// south 4

_SWCorner = _southBlock1 getPos [32.5,270];			// SW Corner
_SWCorner = _SWCorner getPos [1.2,00];				// SW Corner v2

_westBlock1 = _SWCorner getPos [5.68,00];			// west 1
_westBlock1 = _westBlock1 getPos [1.8,270];			// west 1
_westBlock2 = _westBlock1 getPos [8.32,0];			// west 2
_westBlock3 = _westBlock1 getPos [16.7,0];			// west 3
_westBlock4 = _westBlock1 getPos [25,0];			// west 4

_gateBlock1 = _westBlock4 getPos [5.7,270];			// gateblock 1
_gateBlock1 = _gateBlock1 getPos [2.5,180];			// gateblock 1
_gateBlock2 = _gateBlock1 getPos [11,180];			// gateblock 1

_bunker1 = _gateBlock1 getPos [3.6,180];
_bunker1 = _bunker1 getPos [4,270];
_bunker2 = _bunker1 getPos [16,90];
_bunker2 = _bunker2 getPos [5,180];

_gateBlock3 = _bunker2 getPos [7,45];
_gateBlock3 = _gateBlock3 getPos [5,0];
_gateBlock3 = _gateBlock3 getPos [4.5,90];
// _bunker3 = _northBlock4 getPos [10,180];

_heliPadPos = _SECorner getPos [15,315];

_medicHutPos = _heliPadPos getPos [10,270];
_medicHutPos = _medicHutPos getPos [5,270];
_medicHutPos = _medicHutPos getPos [2,180];

_officePos = _medicHutPos getPos [7,270];

_medicTentPos = _heliPadPos getPos [18,0];
_medicTentPos = _medicTentPos getPos [3,90];
_medicTentPos = _medicTentPos getPos [10,270];

// -------------------------------------------------------------------------------------------
// block creation 

_wallBlock = "Land_HBarrierWall_corner_F" createVehicle _mapCorner; // NW Corner 
[_wallBlock, _NWCorner, 271.068] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 271.068;
// _NWCorner set [2,0]; 
// _wallBlock setPos _NWCorner;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // north 1
[_wallBlock, _northBlock1, 1.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 1.4;
// _northBlock1 set [2,0]; 
// _wallBlock setPos _northBlock1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // north 2
[_wallBlock, _northBlock2, 1.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 1.4;
// _northBlock2 set [2,0]; 
// _wallBlock setPos _northBlock2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // north 3
[_wallBlock, _northBlock3, 1.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 1.4;
// _northBlock3 set [2,0]; 
// _wallBlock setPos _northBlock3;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // north 4
[_wallBlock, _northBlock4, 1.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 1.4;
// _northBlock4 set [2,0]; 
// _wallBlock setPos _northBlock4;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall_corner_F" createVehicle _mapCorner; // NE Corner 
[_wallBlock, _NECorner, 0.483] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 0.483;
// _NECorner set [2,0]; 
// _wallBlock setPos _NECorner;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // east 1
[_wallBlock, _eastBlock1, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _eastBlock1 set [2,0]; 
// _wallBlock setPos _eastBlock1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // east 2
[_wallBlock, _eastBlock2, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _eastBlock2 set [2,0]; 
// _wallBlock setPos _eastBlock2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // east 3
[_wallBlock, _eastBlock3, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _eastBlock3 set [2,0]; 
// _wallBlock setPos _eastBlock3;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // east 4
[_wallBlock, _eastBlock4, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _eastBlock4 set [2,0]; 
// _wallBlock setPos _eastBlock4;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall_corner_F" createVehicle _mapCorner; // SE Corner 
[_wallBlock, _SECorner, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _SECorner set [2,0]; 
// _wallBlock setPos _SECorner;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // south 1
[_wallBlock, _southBlock1, 181.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.4;
// _southBlock1 set [2,0]; 
// _wallBlock setPos _southBlock1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // south 2
[_wallBlock, _southBlock2, 181.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.4;
// _southBlock2 set [2,0]; 
// _wallBlock setPos _southBlock2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // south 3
[_wallBlock, _southBlock3, 181.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.4;
// _southBlock3 set [2,0]; 
// _wallBlock setPos _southBlock3;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // south 4
[_wallBlock, _southBlock4, 181.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.4;
// _southBlock4 set [2,0]; 
// _wallBlock setPos _southBlock4;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall_corner_F" createVehicle _mapCorner; // SW Corner
[_wallBlock, _SWCorner, 181.4] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.4;
// _SWCorner set [2,0]; 
// _wallBlock setPos _SWCorner;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // west 1
[_wallBlock, _westBlock1, 271.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 271.703;
// _westBlock1 set [2,0]; 
// _wallBlock setPos _westBlock1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // west 2
[_wallBlock, _westBlock2, 271.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 271.703;
// _westBlock2 set [2,0]; 
// _wallBlock setPos _westBlock2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

// _wallBlock = "Land_HBarrierWall6_F" createVehicle _westBlock3; // west 3
// _wallBlock enableSimulation false;
// _wallBlock setDir 271.703;
// _westBlock3 set [2,0]; 
// _wallBlock setPos _westBlock3;
// _wallBlock enableSimulation true;
// sleep _spawnSpeed;

_wallBlock = "Land_HBarrierWall6_F" createVehicle _mapCorner; // west 4
[_wallBlock, _westBlock4, 271.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 271.703;
// _westBlock4 set [2,0]; 
// _wallBlock setPos _westBlock4;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

// gates 
_wallBlock = "Land_HBarrier_Big_F" createVehicle _mapCorner; // gate 1
[_wallBlock, _gateBlock1, 181.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.703;
// _gateBlock1 set [2,0]; 
// _wallBlock setPos _gateBlock1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrier_Big_F" createVehicle _mapCorner; // gate 2
[_wallBlock, _gateBlock2, 181.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 181.703;
// _gateBlock2 set [2,0]; 
// _wallBlock setPos _gateBlock2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

// bunkers 
_wallBlock = "Land_BagBunker_Small_F" createVehicle _mapCorner; // bunker 1
[_wallBlock, _bunker1, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _bunker1 set [2,0]; 
// _wallBlock setPos _bunker1;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

// _wallBlock = "Land_BagBunker_Small_F" createVehicle _bunker2; // bunker 2
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _bunker2 set [2,0]; 
// _wallBlock setPos _bunker2;
// _wallBlock enableSimulation true;
// sleep _spawnSpeed;

_wallBlock = "Land_HBarrierTower_F" createVehicle _mapCorner; // bunker 3
[_wallBlock, _bunker2, 91.703] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 91.703;
// _bunker2 set [2,0]; 
// _wallBlock setPos _bunker2;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;

_wallBlock = "Land_HBarrier_Big_F" createVehicle _mapCorner; // bunker 3
[_wallBlock, _gateBlock3, 90] spawn RGGb_fnc_build_blockManager;
// _wallBlock enableSimulation false;
// _wallBlock setDir 90;
// _gateBlock3 set [2,0]; 
// _wallBlock setPos _gateBlock3;
// _wallBlock enableSimulation true;
sleep _spawnSpeed;
 

// Land_HelipadSquare_F
_heliPad = "Land_HelipadSquare_F" createVehicle _mapCorner;
[_heliPad, _heliPadPos, 0] spawn RGGb_fnc_build_blockManager;
sleep _spawnSpeed;

// Land_Medevac_house_V1_F
_medicHut = "Land_Medevac_house_V1_F" createVehicle _mapCorner;
[_medicHut, _medicHutPos, 270] spawn RGGb_fnc_build_blockManager;
// _medicHut setDir 270;
sleep _spawnSpeed;

// OFFICE 

_office = "Land_Cargo_House_V3_F" createVehicle _mapCorner;
[_office, _officePos, 0] spawn RGGb_fnc_build_blockManager;
// _medicHut setDir 0;
sleep _spawnSpeed;

// medic tent 

_medicTent = "Land_MedicalTent_01_MTP_closed_F" createVehicle _mapCorner;
[_medicTent, _medicTentPos, 0] spawn RGGb_fnc_build_blockManager;
// sleep _spawnSpeed;
// -------------------------------------------------------------------------------------------

MEDICAL = true;

// register main base as a blue marker
_base = createMarker ["Medical", _rootPos];
_base setMarkerShape "ELLIPSE";
_base setMarkerColor "ColorBlue";
_base setMarkerSize [50, 50];
_base setMarkerAlpha 0.5;

// create invisible marker for supply drops 
_medicalDZ = createMarker ["Medical_DZ", _heliPadPos];
_medicalDZ setMarkerShape "ELLIPSE";
_medicalDZ setMarkerColor "ColorRed";
_medicalDZ setMarkerSize [15, 15];
_medicalDZ setMarkerAlpha 0.5;

// base troops 
[_officePos, 3, "Medical"] call RGGs_fnc_spawn_bluforBaseMinCrew;


// _medicTent = "Land_MedicalTent_01_MTP_closed_F" createVehicle _medicTentPos;
// [_medicTent, _medicTentPos, 0] spawn RGGb_fnc_build_blockManager;
// sleep _spawnSpeed;

/*
//Land_MedicalTent_01_NATO_tropic_generic_outer_F
_tentPos = _medicHutPos getPos [25,90];
_tent = "Land_MedicalTent_01_NATO_tropic_generic_outer_F" createVehicle _tentPos;
sleep _spawnSpeed;

//Land_MedicalTent_01_NATO_tropic_generic_outer_F
// _tentPos = _tentPos getPos [10,180];
// _tent = "Land_MedicalTent_01_NATO_tropic_generic_outer_F" createVehicle _tentPos;
// sleep _spawnSpeed;

// Land_MobileRadar_01_radar_F
_radarPos = _tentPos getPos [15,260];
_radar = "Land_MobileRadar_01_radar_F" createVehicle _radarPos;
sleep _spawnSpeed;

//Land_MobileRadar_01_generator_F
_gennyPos = _radarPos getPos [6,0];
_genny = "Land_MobileRadar_01_generator_F" createVehicle _gennyPos;
sleep _spawnSpeed;

// Land_Cargo_House_V2_F
_hqPos = _gennyPos getPos [25,0];
_hq = "Land_Cargo_House_V2_F" createVehicle _hqPos;
sleep _spawnSpeed;

// Land_Cargo_Patrol_V2_F
_towerPos = _hqPos getPos [10,90];
_hq = "Land_Cargo_Patrol_V2_F" createVehicle _towerPos;
_hq setDir 180;
sleep _spawnSpeed;