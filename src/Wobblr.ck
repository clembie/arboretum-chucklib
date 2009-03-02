// Wobblr v.2

public class Wobblr {
	WobblePatch wobble;
	ADSR envelope;
	wobble.connectTo( envelope );
	
	1::second => dur ndur;
	
	0.2 * ndur => dur attackTime;
	0.2 * ndur => dur decayTime;
		0.5 => float sustainLevel;
	0.2 * ndur => dur sustainTime;
	0.4 * ndur => dur releaseTime;
	
	fun void listen( NoteEvent ne ) {
		while( true ) {
			ne => now;
			
			ne.length => ndur;
			
			//<<< "ndur ", ndur >>>;
			
			ne.attackTime * ndur => attackTime;
			ne.decayTime * ndur => decayTime;
			ne.sustainLevel => sustainLevel;
			ne.sustainTime * ndur => sustainTime;
			ne.releaseTime * ndur => releaseTime;
			
			//<<< "added up: ", attackTime + decayTime + sustainTime + releaseTime >>>;
			
			//<<<"noteOn">>>;
			now => time startTime;
			startTime + ndur => time later;
			
			envelope.keyOn();
			while( now < later ) {
				// tick the control rate away
				wobble.tick( 1::samp );
				if( now >= startTime + attackTime + decayTime + sustainTime && envelope.state() == 2 ) {
					envelope.keyOff();
				}
			}
			//<<<"noteOff">>>;
		}
	}
	
	fun void connectTo( UGen o ) {
		envelope => o;
	}
	
	fun void disconnect( UGen o ) {
		envelope =< o;
	}
}
