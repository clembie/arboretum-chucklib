public class Serial12 {
	// Namespace for 12-tone row array manipulations
	// Arrays are assumed to be 12 units long, and 
	// contain integers in the range 0-11.  Hopefully
	// we'll expand this later...
	
	fun static int[] translate( int pitchin[], int nsteps ) {
		// Transposes a 12-tone row in array pitchin 
		// by nsteps and returns the result as an array
		int out[0];
		for( 0 => int i; i<12; i++ ) {
			out << (pitchin[i]+nsteps)%12;
		}
		return out;
	}
    
    fun static int[] inversion( int pitchin[] ) {
        // Computes the inversion of the 12-tone row in 
        // pitchin and returns the results as an array
        int out[0];
        for( 0 => int i; i<12; i++ ) {
            out << (12-pitchin[i])%12;
        }
        return out;
    }
	
	fun static int[] retrograde( int pitchin[] ) {
		// Computes the retrograde of the 12-tone row in 
		// pitchin and returns the results as an array
		int out[0];
		for( 0 => int i; i<12; i++ ) {
			out << pitchin[11-i];
		}
		return out;
	}
	
	fun static int[] M5( int pitchin[] ) {
		// Performs the M5 operation on the 12-tone row 
		// pitchin and returns the result as an array
		int out[0];
		for( 0 => int i; i<12; i++ ) {
			out << (pitchin[i]*5)%12;
		}
		return out;
	}
	
	fun static int[] M7( int pitchin[] ) {
		// Performs the M7 operation on the 12-tone row 
		// pitchin and returns the result as an array
		int out[0];
		for( 0 => int i; i<12; i++ ) {
			out << (pitchin[i]*7)%12;
		}
		return out;
	}
}


// Tests

//fun void print( int a[] ) {
//	for( 0 => int i; i<12; i++ ) {
//		<<< a[i] >>>;
//	}
//}

//[0,1,2,3,4,5,6,7,8,9,10,11] @=> int a[];
//<<< "original" >>>;
//print(a);

//Serial12.translate(a,1) @=> int t1[];
//<<< "translated by 1" >>>;
//print(t1);

//Serial12.retrograde(a) @=> int r[];
//<<< "retrograde" >>>;
//print(r);

//Serial12.M5(a) @=> int m5[];
//<<< "M5" >>>;
//print(m5);

//Serial12.M7(a) @=> int m7[];
//<<< "M7" >>>;
//print(m7);
