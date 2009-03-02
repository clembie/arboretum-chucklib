public class Hatr {
	StepHat hat;
	
	fun void listen( NoteEvent ne ) {
		while( true ) {
			ne => now;
			//<<< "got an event!" >>>;
			
			hat.connectTo( ne.out );
			hat.setFreq( ne.frequency );
			
			hat.start();
		}
	}
}


// make pattern
// PatternGenerator pg;
// pg.makePattern(12,2,1,12) @=> int pat[];
// 
// // print it
// pg.printLast();
// 
// // a P2Notes object to send events to the Kickr
// P2Notes pn;
// pn.create( pat, 5::second );
// 
// // some info...
// <<< "note dur: ", (pn.length / pat.size())/second >>>;
// 
// // a Kickr object
// Hatr hatr;
// 
// // get the event pointer from the P2Notes object
// pn.event() @=> NoteEvent n;
// // set the frequency of the notes
// 7000. => n.frequency;
// dac @=> n.out;
// 
// // make kickr listen for that event
// spork ~ hatr.listen( n );
// me.yield();
// 
// pn.start();
// 
// while( true ) {
	// // allow time to pass
	// 1::second => now;
	// 
	// 
	// // getting bus error when I remove this shred...
// }
