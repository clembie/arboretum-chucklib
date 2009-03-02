// P2P stands for "Pattern to Primitive"
// This file contains some of the weirder operations on patterns from PatternGenerator
// Specifically, this class encapsulates arbitrary transformations of patterns to primitive types
// Requires IntIterator.ck

public class P2P {
	// pattern as ints (indexes)
	fun int[] toInts( int pattern[] ) {
		IntIterator ii;
		int ints[0];
		int nxt;
		ii.attach( pattern );
		while( ii.hasNext() ) {
			ii.next() => nxt;
			if( nxt ) {
				ints << ii.index;
			}
		}
		return ints;
	}
	
	// pattern as floats (indexes)
	fun float[] toFloats( int pattern[] ) {
		IntIterator ii;
		float floats[0];
		int nxt;
		ii.attach( pattern );
		while( ii.hasNext() ) {
			ii.next() => nxt;
			if( nxt ) {
				floats << ii.index $ float;
			}
		}
		return floats;
	}
	
	// pattern as durations (given that the whole pattern is dur total long)
	fun dur[] toDurs( int pattern[], dur total ) {
		IntIterator ii;
		dur durs[0];
		int nxt;
		total / pattern.size() => dur eachDur;
		ii.attach( pattern );
		while( ii.hasNext() ) {
			ii.next() => nxt;
			if( nxt ) {
				durs << (ii.index + 1) * eachDur;
			}
		}
		return durs;
	}
	
	// pattern as times from time startTime
	fun time[] toTimes( int pattern[], dur total, time startTime ) {
		IntIterator ii;
		time times[0];
		int nxt;
		total / pattern.size() => dur eachDur;
		ii.attach( pattern );
		while( ii.hasNext() ) {
			ii.next() => nxt;
			if( nxt ) {
				times << ((ii.index + 1) * eachDur) + startTime;
			}
		}
		return times;
	}
}


// Tests

// PatternGenerator pg;
// pg.makePattern( 32, 5, 3, 32 ) @=> int myPat[];

// ints
// P2P p2p;
// p2p.toInts( myPat ) @=> int myInts[];
// 
// IntIterator i;
// i.attach( myInts );
// 
// while( i.hasNext() ) {
	// <<< i.next() >>>;
// }

// floats
// p2p.toFloats( myPat ) @=> float myFloats[];
// 
// FloatIterator f;
// f.attach( myFloats );
// 
// while( f.hasNext() ) {
	// <<< f.next() >>>;
// }

// durs
// p2p.toDurs( myPat, 1::second ) @=> dur myDurs[];

// we don't have a DurIterator yet...
// for( 0 => int i; i < myDurs.size(); i++ ) {
	// <<< myDurs[i] >>>;
// }

// times
// p2p.toTimes( myPat, 1::second, now ) @=> time myTimes[];

// we don't have a TimeIterator yet...
// for( 0 => int i; i < myTimes.size(); i++ ) {
	// <<< myTimes[i] >>>;
// }

// <<<"done">>>;
