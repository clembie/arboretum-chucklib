// Grain - Michael Clemow, 2008 (needs >= Chuck 1.2.1.1b)
//
// Requirements: Granular/Runtime/Forkable2.ck
//

public class Grain extends Forkable {
	// class vars
	static int lastId;
	// instance vars
	UGen in, out;
	float amp;
	dur length;
	int _isSet;
	// increment id each instance
	lastId++ => int id;
	
	fun void set( GrainDef def ) {
		if( def.harmonics == 0 ) {
			// create the input based on type
			if( def.type == "sin" ) {
				SinOsc sin;
				def.freq => sin.freq;
				sin @=> in;
			}
			else if( def.type == "sqr" ) {
				SqrOsc sqr;
				def.freq => sqr.freq;
				sqr @=> in;
			}
			else if( def.type == "saw" ) {
				SawOsc saw;
				def.freq => saw.freq;
				saw @=> in;
			}
			else if( def.type == "tri" ) {
				TriOsc tri;
				def.freq => tri.freq;
				tri @=> in;
			}
			else {
				// error
				<<< "Error: unknown Grain type ", def.type >>>;
			}
			
			def.out @=> out;
			def.amp => amp;
			
			// calculate duration of grain
			(def.cycles / def.freq)::second => length;
			
			1 => _isSet;
			//<<< "regular" >>>;
		}
		else if( def.type == "sin" && def.bpFreq == 0 && def.width == 0 && def.harmonics > 0 ) {
			// just use a blit
			
			Blit blit;
			def.harmonics => blit.harmonics;
			def.freq => blit.freq;
			blit @=> in;
			
			def.out @=> out;
			def.amp => amp;
			
			// calculate duration of grain
			(def.cycles / def.freq)::second => length;
			
			1 => _isSet;
			//<<< "blit" >>>;
		}
		else if( def.type == "sin" && (def.bpFreq > 0 || def.width > 0) && def.harmonics > 0 ) {
			// use band pass filtered blitin duration
			
			Blit blit => BPF bpf => Dyno dy;
			def.harmonics => blit.harmonics;
			def.freq => blit.freq;
			dy @=> in;
			
			300 => bpf.gain;
			def.bpFreq => bpf.freq;
			def.width => bpf.Q;
			
			dy.limit();
			1 => dy.gain;
			
			def.out @=> out;
			def.amp => amp;
			
			// calculate duration of grain
			(def.cycles / def.freq)::second => length;
			
			1 => _isSet;
			//<<< "bp blit" >>>;
		}
		else {
			<<< "Error: I'm not sure how to play this GrainDef:" >>>;
			def.print();
			
			0 => _isSet;
		}
		
		//<<< "setting GrainDef:" >>>;
		//def.print();
	}
	
    fun void run() {
		if( _isSet ) {
			// patch things
			in => Envelope env => out;
			// set amplitude
			amp => env.target;
			length/2 => env.duration;
			
			// play grain
			env.keyOn();
			length/2 => now;
			env.keyOff();
			length/2 => now;
			
			//<<< env.isConnectedTo( out ) >>>;
			
			// manual clean up (required if Forker returns Shred reference)
			in =< env =< out;
			//<<< "played grain" >>>;
		}
		else {
			<<< "Error: Grain is not set.", id >>>;
		}
    }
}