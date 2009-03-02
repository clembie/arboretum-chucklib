// The WobblePatch class encapsulates the default settings and patching methods for the Wobble bass module

public class WobblePatch {
	//=== UGENS ===//
	// OSC 1
	Blit sin1;
	TriOsc tri1;
	SawOsc saw1;
	
	// OSC 2
	SinOsc sin2;
	TriOsc tri2;
	SawOsc saw2;
	
	// Filter
	BPF filter;
	
	// LFOs
	SinOsc lfo1 => blackhole;
	TriOsc lfo2 => blackhole;
	SqrOsc lfo3 => blackhole;
	
	// Distortion
	SinOsc distortion;
	
	// Gain
	Gain gain;
	
	// Limiter 
	Dyno limiter;
	
	//=== DEFAULTS ===//
	// Default patch
	sin1 => filter;
	sin2 => filter;
	
	filter => gain => limiter;  // limiter is the last thing in the chain
	
	// Default settings
	this.reset();
	
	//=== STATE VARIABLES ===//
	sin1 @=> UGen currentOSC1;
	0 => int osc1;
	sin2 @=> UGen currentOSC2;
	0 => int osc2;
	
	0 => int fm_on;
	0 => int dist_on;
	
	0 => int lfo_osc1 => int lfo_osc2;
	0 => int restoreLFO1;
	
	1. => float o1gain;
	1. => float o2gain;
	
	// SET DEFAULTS
	fun void reset() {
		// Default settings
		1. => sin1.gain => tri1.gain => saw1.gain => sin2.gain => tri2.gain => saw2.gain;
		0.3 => distortion.gain;
		80. => sin1.freq => tri1.freq => saw1.freq => sin2.freq => tri2.freq => saw2.freq;
		1 => sin1.harmonics;
		5. => lfo1.freq => lfo2.freq => lfo3.freq;
		
		100. => gain.gain;
		limiter.limit();
		1 => limiter.gain;
		
		1. => filter.Q;
		400. => filter.freq;
		
		1 => distortion.sync;
		0.01 => distortion.gain;
		//<<< "yo!" >>>;
	}
	
	// DISTORTION METHODS
	fun void overdrive( int d ) {
		// toggle distortion
		if( d == 1 ) {
			if( !distortion.isConnectedTo(gain) ) {
				filter =< gain;
				filter => distortion => gain;
				1 => dist_on;
			}
		}
		else if( d == 0 ) {
			if( distortion.isConnectedTo(gain) ) {
				distortion =< gain;
				filter =< distortion;
				filter => gain;
				0 => dist_on;
			}
		}
	}
	
	// OSC1 AND OSC2 METHODS
	fun void OSC1( string type ) {
		if( type == "sine" ) {
			currentOSC1 =< filter;
			sin1 @=> currentOSC1;
			currentOSC1 => filter;
			0 => osc1;
		}
		else if( type == "tri" ) {
			currentOSC1 =< filter;
			tri1 @=> currentOSC1;
			currentOSC1 => filter;
			1 => osc1;
		}
		else if( type == "saw" ) {
			currentOSC1 =< filter;
			saw1 @=> currentOSC1;
			currentOSC1 => filter;
			2 => osc1;
		}
		else {
			<<< "Parameter not recognized! OSC1: ", type >>>;
		}
	}
	
	fun void OSC2( string type ) {
		if( type == "sine" ) {
			currentOSC2 =< filter;
			sin2 @=> currentOSC2;
			currentOSC2 => filter;
			0 => osc2;
		}
		else if( type == "tri" ) {
			currentOSC2 =< filter;
			tri2 @=> currentOSC2;
			currentOSC2 => filter;
			1 => osc2;
		}
		else if( type == "saw" ) {
			currentOSC2 =< filter;
			saw2 @=> currentOSC2;
			currentOSC2 => filter;
			2 => osc2;
		}
		else {
			<<< "Parameter not recognized! OSC2: ", type >>>;
		}
	}
	
	// FM SYNTHESIS
	fun void syncFM( int fm ) {
		if( fm == 1 ) {
			if( currentOSC1.isConnectedTo(filter) ) {
				if( lfo_osc1 ) {
					0 => lfo_osc1;
					1 => restoreLFO1;
				}
				currentOSC1 =< filter;
				currentOSC1 => currentOSC2;
				//100. => currentOSC1.gain;
				2 => sin2.sync => tri2.sync => saw2.sync;
				1 => fm_on;
			}
		}
		if( fm == 0 ) {
			if( currentOSC1.isConnectedTo(currentOSC2) ) {
				if( restoreLFO1 ) {
					1 => lfo_osc1;
					0 => restoreLFO1;
				}
				currentOSC1 =< currentOSC2;
				currentOSC1 => filter;
				//1. => currentOSC1.gain;
				0 => sin2.sync => tri2.sync => saw2.sync;
				0 => fm_on;
			}
		}
	}
	
	// CONNECT METHODS
	fun void connectTo( UGen ugen ) {
		limiter => ugen;
	}
	
	fun void disconnect( UGen ugen ) {
		limiter =< ugen;
	}
	
	// LFO STATE
	fun void lfoOSC1( int i ) {
		i => lfo_osc1;
	}
	
	fun void lfoOSC2( int i ) {
		i => lfo_osc2;
	}
	
	// TICK METHOD
	fun void tick( dur d ) {
		if( lfo_osc1 ) {
			((lfo1.last() + 1.) / 2.) * o1gain => currentOSC1.gain;
		}
		if( lfo_osc2 ) {
			((lfo2.last() + 1.) / 2.) * o2gain => currentOSC2.gain;
		}
		d => now;
	}
	
	// FREQ METHODS
	fun void osc1freq( float f ) {
		f => sin1.freq => tri1.freq => saw1.freq;
	}
	
	fun void osc2freq( float f ) {
		f => sin2.freq => tri2.freq => saw2.freq;
	}
	
	// GAIN METHODS
	fun void osc1gain( float g ) {
		g => sin1.gain => tri1.gain => saw1.gain => o1gain;
	}
	
	fun void osc2gain( float g ) {
		g => sin2.gain => tri2.gain => saw2.gain => o2gain;
	}
	
	// filter Q method
	fun void filterQ( float q ) {
		q => filter.Q;
		100. / q => gain.gain;
	}
}

