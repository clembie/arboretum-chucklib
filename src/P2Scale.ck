// patterns applied as a scale
// could also apply pattern as intervals somehow
// 
public class P2Scale {
	fun float[] scaleEqTemp( int octaves, float fundamental, int a[] ) {
		// creates an array of frequencies within an octave or number of octaves
		// which correspond to the places in the array where a 1 occurs
		IntIterator ia;
		ia.attach( a );
		float frequencies[0];
		for( 0 => int o; o < octaves; o++ ) {
			while( ia.hasNext() ) {
				if( ia.next() ) {	// if there's a 1 in the array
					frequencies << fundamental;
				}
				// keep going up the scale
				fundamental * Math.pow(2., (1/a.size() $ float) ) => fundamental;
			}
			ia.goToStart();
		}
		return frequencies;
	}
	
	fun float[] scalePythag12( float fundamental, int a[] ) {
		// this works a little differently than the equal temperament scale application
		// the size of the array "a" will determine how many octaves of the scale are returned
		// pythagorean scale is a 12-tone scale.
		[(1./1.), (256./243.), (9./8.), (32./27.), (81./64.), (4./3.), (1024./729.), (3./2.), (128./81.), (27./16.), (16./9.), (243./128.)] @=> float pythag[];
		IntIterator ia;
		ia.attach( a );
		float frequencies[0];
		0 => int ratio;
		while( ia.hasNext() ) {
			fundamental * pythag[ratio] => float f;
			if( ia.next() ) {  // if there's a 1 in this spot
				frequencies << f;
			}
			ratio++;
			if( ratio >= pythag.size() ) {
				ratio % pythag.size() => ratio;
				fundamental * 2 => fundamental;
			}
		}
		return frequencies;
	}
}

// SinOsc s => dac;

// PatternGenerator pg;
// pg.makePattern( 24, 1, 1, 24 ) @=> int myPat[];

//pg.printLast();

// BOps bo;
// bo.arrayNOT( myPat ) @=> int notMyPat[];

// pg.makePattern( pg.describeReverse( myPat ) ) @=> int myPat2[];

//pg.printLast();

//scaleEqTemp( 1, 250., myPat ) @=> float scale[];
// scalePythag12( 250, myPat ) @=> float scale[];

// FloatIterator fi;
// fi.attach( scale );

// while( fi.hasNext() ) {
	// fi.next() => s.freq;
	// <<< s.freq() >>>;
	// 100::ms => now;
// }

// SinOsc s1 => dac;
// SinOsc s2 => dac;
// 0 => s2.gain;
// 
// PatternGenerator pg;
// pg.makePattern(12, 1, 1, 12) @=> int myPattern1[];
// pg.printLast();
// <<< "" >>>;
// pg.makePattern( pg.describeReverse( myPattern1 ) ) @=> int myPattern2[];
// pg.printLast();
// 
// 
// scaleEqTemp( 1, 300., myPattern1 ) @=> float myScale1[];
// scaleEqTemp( 1, 300., myPattern2 ) @=> float myScale2[];
// 
// 
// FloatIterator scale1;
// scale1.attach( myScale1 );
// <<< myScale1.size() >>>;
// 
// FloatIterator scale2;
// scale2.attach( myScale2 );
// <<< myScale2.size() >>>;
// 
// while( scale1.hasNext() && scale2.hasNext() ) {
	// scale1.next() => s1.freq;
	// scale2.next() => s2.freq;
	// 
	// <<< "playing freqs: ", s1.freq(), s2.freq() >>>;
	// 100::ms => now;
// }
// 
// <<< "done" >>>;
