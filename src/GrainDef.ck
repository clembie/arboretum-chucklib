// GrainDef - Michael Clemow, 2008 (needs >= Chuck 1.2.1.1b)
//
// Requirements: (none)
//

public class GrainDef {
    // members
    string type;
    UGen out;
    float freq, amp, bpFreq, width;
    int cycles, harmonics;
    
    // defaults, basic members
    "sin" => type;
    500. => freq;
    1. => amp;
    128 => cycles;
	dac @=> out;
    
    // defaults, blit members
    0 => harmonics;
    0. => bpFreq;
    0. => width;
	
	// class methods
	fun static void copy( GrainDef gd1, GrainDef gd2 ) {
		// Copies the data from gd1 to gd2
		gd1.type => gd2.type;
		gd1.freq => gd2.freq;
		gd1.amp => gd2.amp;
		gd1.bpFreq => gd2.bpFreq;
		gd1.width => gd2.width;
		gd1.cycles => gd2.cycles;
		gd1.harmonics => gd2.harmonics;
	}
    
	// instance methods
    fun int equals( GrainDef g ) {
        if( g.type == type && g.freq == freq && g.amp == amp && g.bpFreq == bpFreq && g.width == width && g.cycles == cycles && g.harmonics == harmonics ) {
            return true;
        }
        else {
            return false;
        }
    }
	
	fun void print() {
		<<< "type: ", type, " freq: ", freq, " amp: ", amp, " cycles: ", cycles, " harmonics: ", harmonics, " bpFreq: ", bpFreq, " width: ", width >>>;
	}
	
	fun dur duration() {
		return (cycles / freq)::second;
	}
}