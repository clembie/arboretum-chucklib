public class StepHat extends Forkable {
	UGen out;
	5000. => float frequency;
	
	fun void run() {
		Step step => BPF filter => ADSR env => out;
		10. => filter.Q;

		// ADSR envelope
		4::ms => env.attackTime;
		8::ms => env.decayTime;
		0.5 => env.sustainLevel;
		4::ms => env.releaseTime;

		15 => env.gain;
		
		spork ~ noise( step );
		me.yield();
		
		frequency => filter.freq;
		
		// attack and decay
		env.keyOn();
		20::ms => now;
		env.keyOff();
		4::ms => now;
	}
	
	fun void noise( Step step ) {
		0.0 => float last;
		while( true ) {
			Math.rand2f(-0.5, 0.5) + step.last() => step.next;
			//Math.rand2f(-1.0, 1.0) => step.next;
			Math.rand2(10, 500)::samp => now;
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

// test

//StepHat hat;
//hat.connectTo(dac);
//1::minute / 300. => dur bpm;
// 
//while( true ) {
//	hat.setFreq( Math.rand2f(5000.,10000.) );
//	if( maybe ) {
		// //<<< "hat" >>>;
//		hat.start();
//	}
//	bpm => now;
//}
