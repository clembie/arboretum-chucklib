// patterns applied as note events
// make some noise!

// requires IntIterator, NoteEvent
public class P2Notes extends Forkable {
	int pattern[];
	NoteEvent noteEvent;
	0::samp => dur length;
	0::samp => dur noteLength;
	
	fun void create( int p[], dur l ) {
		p @=> pattern;
		l => length;
		length / pattern.size() => noteLength => noteEvent.length;
	}
	
	fun NoteEvent event() {
		// returns the event for this object (so you can chuck it to now)
		return noteEvent;
	}
	
	// run method - do not call this (normally).  Call start() instead (see Forkable)
	fun void run() {
		IntIterator ii;
		ii.attach( pattern );
		ii.goToStart();		// uncomment if paranoid...
		0 => int i;
		-1 => int b;
		
		// add a delay here for testing
		//100::ms => now;
		
		while( ii.hasNext() ) {
			ii.next() => b;
			if( b == 1 ) {
				//<<< b >>>;
				noteEvent.broadcast();
			}
			//<<< "beat: ", i >>>;
			i++;
			noteEvent.length => now;
		}
	}
}


// PatternGenerator pg;
// pg.makePattern(12,1,1,12) @=> int pat[];

// pg.printLast();

// P2Notes pn;
// pn.create(pat, 5::second);
// <<< "note dur: ", (pn.length / pat.size())/second >>>;

// SinOsc s => dac;

// fun void eventListener( time startTime ) {
	// while( pn.noteEvent => now ) {
		// Math.rand2f( 500., 1000. ) => s.freq;
		// now - startTime => dur interval;
		// <<< "Event: ", interval/second >>>;
	// }
// }

// now => time start;

// spork ~ eventListener( start );
// me.yield();

// pn.start();  // event listener should be listening BEFORE this is called

// while( true ) {
	// 1::second => now;
// }


