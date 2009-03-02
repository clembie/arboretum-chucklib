// Granular Boot Sequence - Michael Clemow, 2008 - Version 0.3
//
// This file will add the Granular Objects to a running VM
//

<<< "-- Loading Granular_v0.3 --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/GrainDef.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Forkable.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Grain.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/GrainForker.ck");

<<< "-- Loading Patterns_01 --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/IntIterator.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/FloatIterator.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/BooleanOperators.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/PatternGenerator.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/NoteEvent.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/P2Scale.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/P2P.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/P2Notes.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/GlitchKick.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/StepHat.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Kickr.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Hatr.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/WobblePatch.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Wobblr.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Genes.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/PatternAnimal.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/PatternPopulation.ck");

<<< "-- Loading Serial --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/Serial12.ck");


<<< "-- Loading BeatMatch --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/BeatMatch.ck");


<<< "-- Loading Network --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/Node.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Network.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/Arboretum.ck");

<<< "-- Loading OSC --" >>>;

Machine.add("/Users/michaelclemow/chuck/includes/src/OSCTester.ck");
Machine.add("/Users/michaelclemow/chuck/includes/src/TokenPass.ck");
