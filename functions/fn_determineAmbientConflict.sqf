private ["_location"];

_location = param[0];

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

// output of this function contains elements that make up the actual bz 
call RGG_fnc_createAmbientConflict;



