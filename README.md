# voiceOps

Welcome

This is a little project designed to explore automated CTI style missions, and also designed to have fun and learn about scripting for Arma 3. 

I have some loose ideas about players (MP) being given orders to deploy containers, that in turn spawn certain types of bases (barracks, repair, radar etc), which when built enables the AI forces to do certain things.

E.g., create barracks, and then Blufor AI will spawn every so often, go out on patrol and look for enemies. 

Every so often, players will be told to resupply bases, extract injured, do CAS runs etc (still loose on all that).

There will be lots of ambient combat and effects, and will also explore caching and virtual assets to ensure good performance.

This is an open project, so please let me know if you want to get involved.

Cheers
Reggs


11 November
I now am able to automate barracks, based on dropping a container. So, I am thinking now the player/pilot should pickup and then drop a container to kick off the mission. Once the base has spawned, and populated, then it can be subject to attacks. 

I ran a little base-overrun test and it worked pretty well. I need to be able to get the blufor units to man the bunker and tower positions though. Maybe I could do this with bespoke markers (sentry markers)?

I am also thinking we need to be able to track population of base, but also ammo, food, supplies etc. The values would determine - something - maybe liklihood of attack, and ability to defend?

I would like to be able to create voice messages that inform MP players of what is happening in each base.

So, 1st barracks would be FOB Bravo 1, 2nd would be FOB Bravo 2 etc.

As these bases are built up by script, they could be de-spawned when no MP is near - something for the future.

I think I need to think more about the opfor presence - quality of opfor, uniform, their bases, their patrols.

And, I think bases that have additional units over base staff should be considered patrol bases ... these can help to keep the local area clear.

I was wondering about hidden crates in the map, that could spawn/despawn randomly .. if found and picked up they could enable - something - maybe an airstrike, or additional supplies or intel.

Speaking of intel - if we have a radar base (to be built) then we can start to create more attacking gameplay - with radar you can find (or lead players to) opfor bases ... so you can organise strikes or assaults. These mini-missions could be open ended or mission-controled/led.

i would ike to build out a scouting role, where an unarmed heli could relay things they see in the deeper country.

A heli could scout for enemy bases or patrols ... this could be mission led "players we need a scouting mission done in sector xyz" .. then spawn something thetre to be found. On finding, you could enable a voiceattack system where the player could relay coords, which would generate an AI-led attack. That would be dope!

I need to speed up the days so that one hour is 24 hours.

all missions should be playabe as SP or MP.

question - what does a Barracks FOB need?
four types - none are needed after spawning - the base is considered fully operational on spawn

Med suplies 
Food supplies 
Ammo supplies  
Fuel
One of each once every day?

When deployed, the score for that item is reset - you can stock up bases in advance 
stocks scores are shown next to base marker 

Set rule - bases must be x m apart 
Or, mission dictates when new FOB is deployed and in which sector 

when sling loading - snipers are nearby?? CAS as an escort?

TODO:
Determine how to create a base score for MP, that decreases as time goes by and is boosted when containers are brought in.

