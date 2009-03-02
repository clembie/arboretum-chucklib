//  You have to extend Forkable for this also...

public class GlitchKick extends Forkable {
	UGen out;
	40. => float frequency;
	
	fun void run() {
		TriOsc d;
		TriOsc s;
		Dyno dy;
		s => ADSR env => d => dy => out;
		//<<< "Connected to dac? ", dy.isConnectedTo(dac) >>>;  // debug
		1 => d.sync;
		
		dy.compress();
		300::ms => dy.releaseTime;
		0.1 => dy.thresh;
		0.9 => dy.slopeAbove;
		1 => dy.gain;
		
		frequency => s.freq;
		
		// ADSR envelope
		5::ms => env.attackTime;
		10::ms => env.decayTime;
		0.2 => env.sustainLevel;
		100::ms => env.releaseTime;
		
		// final gain setting
		0.5 => env.gain;
		
		// run the distortion shred
		spork ~ this.dist(env, d);
		me.yield();
		
		// run the kick
		env.keyOn();
		30::ms => now;
		env.keyOff();
		100::ms => now;
	}
	
	fun void dist(ADSR env, TriOsc d) {
		while( true ) {
			if( env.state() == 4 ) {
				150. => d.gain;
			}
			else {
				if( d.gain() > 0.1 ) {
					d.gain() - 0.00001 => d.gain;
				}
			}
			1::samp => now;
			me.yield();
		}
	}
	
	fun void connectTo( UGen o ) {
		o @=> out;
	}
	
	fun void setFreq( float f ) {
		f => frequency;
	}
}

// test me...

//GlitchKick kick;
//kick.connectTo(dac);
//1::minute / 300. => dur bpm;
// 
//while( true ) {
//	if(maybe && maybe) {
//		Math.rand2f(40.,400.) => kick.setFreq;
//		kick.start();
//	}
//	bpm => now;
//}
