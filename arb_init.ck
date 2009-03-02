// Granular Boot Sequence - Michael Clemow, 2008 - Version 0.3
//
// This file will add the Granular Objects to a running VM
//

<<< "-- Loading Granular_v0.3 --" >>>;

Machine.add("/home/michael/chuck/includes/src/GrainDef.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Forkable.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Grain.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/GrainForker.ck");
100::ms => now;

<<< "-- Loading Patterns_01 --" >>>;

Machine.add("/home/michael/chuck/includes/src/IntIterator.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/FloatIterator.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/BooleanOperators.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/PatternGenerator.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/NoteEvent.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/P2Scale.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/P2P.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/P2Notes.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/GlitchKick.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/StepHat.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Kickr.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Hatr.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/WobblePatch.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Wobblr.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Genes.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/PatternAnimal.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/PatternPopulation.ck");
100::ms => now;

<<< "-- Loading Serial --" >>>;

Machine.add("/home/michael/chuck/includes/src/Serial12.ck");
100::ms => now;


<<< "-- Loading BeatMatch --" >>>;

Machine.add("/home/michael/chuck/includes/src/BeatMatch.ck");
100::ms => now;

<<< "-- Loading Network --" >>>;

Machine.add("/home/michael/chuck/includes/src/Node.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Network.ck");
100::ms => now;
Machine.add("/home/michael/chuck/includes/src/Arboretum.ck");
100::ms => now;

<<< "-- Loading OSC --" >>>;

Machine.add("/home/michael/chuck/includes/src/OSCTester.ck");
100::ms => now;


Machine.add("/home/michael/chuck/includes/src/TokenPass.ck");
100::ms => now;
