Things to do...

generate ambient combat zones
selecting location for battlezone
generating opfor
generating blufor
pitching against eachother - move orders
checking for blufor win/lose status
running mission clock - end mission after x mins

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


// old, maybe useful
// _rndOp1 = selectRandom [0, 3, 4, 5, 6];
// systemchat format ["1st wave: %1", _rndOp1];