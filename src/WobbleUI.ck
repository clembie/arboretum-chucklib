// KR - WOBBLE TICK RATE
1::ms => dur kr;

// PATCH
WobblePatch wobble;
Gain gain => dac;
0.5 => gain.gain;
wobble.connectTo( gain );

// GUI
MAUI_View control_view;

MAUI_LED sin1_led, tri1_led, saw1_led, sin2_led, tri2_led, saw2_led,
         lfo1_led, lfo2_led, lfo3_led, dist_led, sync_led;

MAUI_Button sin1_button, tri1_button, saw1_button, sin2_button, tri2_button,
         saw2_button, sync_button, dist_button, lfo1_button, lfo2_button, lfo3_button;

MAUI_Slider osc1_harmonics, osc1_gain, osc2_gain, sync_gain,
         filter_q, filter_freq, dist_gain, 
		 lfo1_freq, lfo2_freq, lfo3_freq, master_vol,
		 osc1_freq, osc2_freq;
		 
control_view.size( 800, 750 );

// OSC 1
sin1_button.toggleType();
sin1_button.size(75, 75);
sin1_button.position(0, 0);
sin1_button.name( "Sin1" );
control_view.addElement(sin1_button);

sin1_led.size(50, 50);
sin1_led.position(sin1_button.width(), sin1_button.y());
sin1_led.color(MAUI_LED.blue);
control_view.addElement(sin1_led);

tri1_button.toggleType();
tri1_button.size(75, 75);
tri1_button.position(0, sin1_button.height());
tri1_button.name( "Tri1" );
control_view.addElement(tri1_button);

tri1_led.size(50, 50);
tri1_led.position(tri1_button.width(), tri1_button.y());
tri1_led.color(MAUI_LED.blue);
control_view.addElement(tri1_led);

saw1_button.toggleType();
saw1_button.size(75, 75);
saw1_button.position(0, tri1_button.height() + sin1_button.height());
saw1_button.name( "Saw1" );
control_view.addElement(saw1_button);

saw1_led.size(50, 50);
saw1_led.position(saw1_button.width(), saw1_button.y());
saw1_led.color(MAUI_LED.blue);
control_view.addElement(saw1_led);

osc1_gain.size(200, 100);
osc1_gain.range(0., 1.);
osc1_gain.position(sin1_button.width() + sin1_led.width(), 0);
osc1_gain.value(1.);
osc1_gain.name( "OSC 1 gain" );
control_view.addElement(osc1_gain);

osc1_harmonics.size(200, 100);
osc1_harmonics.range(1, 50);
osc1_harmonics.position(sin1_button.width() + sin1_led.width(), osc1_gain.height());
osc1_harmonics.value(1);
osc1_harmonics.name( "Harmonics (Sin1)" );
osc1_harmonics.displayFormat( MAUI_Slider.integerFormat );
control_view.addElement(osc1_harmonics);

sync_button.toggleType();
sync_button.size(75, 75);
sync_button.position(325/2,  saw1_button.y() + saw1_button.height());
sync_button.name( "FM" );
control_view.addElement(sync_button);

sync_led.size(50, 50);
sync_led.color(MAUI_LED.red);
sync_led.position(sync_button.x() + sync_button.width(), sync_button.y());
control_view.addElement(sync_led);

sync_gain.size(200, 100);
sync_gain.range(0., 100.);
sync_gain.position(325/2 + sync_button.width() + sync_led.width(), sync_button.y());
sync_gain.value(1.);
sync_gain.name( "OSC 1 gain" );
control_view.addElement(sync_gain);

50 + sin1_button.width() + sin1_led.width() + osc1_harmonics.width() => float row2;
//<<< row2 >>>;

// OSC 2
sin2_button.toggleType();
sin2_button.size(75, 75);
sin2_button.position(row2, 0);
sin2_button.name( "Sin2" );
control_view.addElement(sin2_button);

sin2_led.size(50, 50);
sin2_led.position(row2 + sin2_button.width(), sin2_button.y());
sin2_led.color(MAUI_LED.blue);
control_view.addElement(sin2_led);

tri2_button.toggleType();
tri2_button.size(75, 75);
tri2_button.position(row2, sin2_button.height());
tri2_button.name( "Tri2" );
control_view.addElement(tri2_button);

tri2_led.size(50, 50);
tri2_led.position(row2 + tri2_button.width(), tri2_button.y());
tri2_led.color(MAUI_LED.blue);
control_view.addElement(tri2_led);

saw2_button.toggleType();
saw2_button.size(75, 75);
saw2_button.position(row2, tri2_button.height() + sin2_button.height());
saw2_button.name( "Saw2" );
control_view.addElement(saw2_button);

saw2_led.size(50, 50);
saw2_led.position(row2 + saw2_button.width(), saw2_button.y());
saw2_led.color(MAUI_LED.blue);
control_view.addElement(saw2_led);

osc2_gain.size(200, 100);
osc2_gain.range(0., 1.);
osc2_gain.position(row2 + sin2_button.width() + sin2_led.width(), 0);
osc2_gain.value(1.);
osc2_gain.name( "OSC 2 gain" );
control_view.addElement(osc2_gain);

50 + sync_button.y() + sync_button.height() => float level2;
//<<< level2 >>>;

// LFOs
lfo1_button.toggleType();
lfo1_button.size(75, 75);
lfo1_button.position(0, level2);
lfo1_button.name( "LFO1" );
control_view.addElement(lfo1_button);

lfo1_led.size(50, 50);
lfo1_led.color(MAUI_LED.blue);
lfo1_led.position(lfo1_button.width(), level2);
control_view.addElement(lfo1_led);

lfo1_freq.size(200, 100);
lfo1_freq.range(0.01, 25.);
lfo1_freq.position(lfo1_button.width() + lfo1_led.width(), level2);
lfo1_freq.value(1);
lfo1_freq.name( "LFO 1 freq" );
control_view.addElement(lfo1_freq);

lfo2_button.toggleType();
lfo2_button.size(75, 75);
lfo2_button.position(0, level2 + lfo1_button.height());
lfo2_button.name( "LFO2" );
control_view.addElement(lfo2_button);

lfo2_led.size(50, 50);
lfo2_led.color(MAUI_LED.blue);
lfo2_led.position(lfo2_button.width(), lfo1_button.y() + lfo1_button.height());
control_view.addElement(lfo2_led);

lfo2_freq.size(200, 100);
lfo2_freq.range(0.01, 25.);
lfo2_freq.position(lfo2_button.width() + lfo2_led.width(), lfo1_button.y() + lfo1_button.height());
lfo2_freq.value(1);
lfo2_freq.name( "LFO 2 freq" );
control_view.addElement(lfo2_freq);

lfo3_button.toggleType();
lfo3_button.size(75, 75);
lfo3_button.position(0, lfo2_button.y() + lfo2_button.height());
lfo3_button.name( "LFO3" );
control_view.addElement(lfo3_button);

lfo3_led.size(50, 50);
lfo3_led.color(MAUI_LED.blue);
lfo3_led.position(lfo3_button.width(), lfo2_button.y() + lfo2_button.height());
control_view.addElement(lfo3_led);

lfo3_freq.size(200, 100);
lfo3_freq.range(0.01, 25.);
lfo3_freq.position(lfo3_button.width() + lfo3_led.width(), lfo2_button.y() + lfo2_button.height());
lfo3_freq.value(1);
lfo3_freq.name( "LFO 3 freq" );
control_view.addElement(lfo3_freq);



// FILTER
filter_freq.size(400, 100);
filter_freq.range(1., 1000.);
filter_freq.position(row2, level2);
filter_freq.value(100);
filter_freq.name( "Filter freq" );
control_view.addElement(filter_freq);

filter_q.size(400, 100);
filter_q.range(1., 100.);
filter_q.position(row2, lfo1_button.y() + lfo1_button.height());
filter_q.value(1);
filter_q.name( "Filter Q" );
control_view.addElement(filter_q);

// DISTORTION
dist_button.toggleType();
dist_button.size(75, 75);
dist_button.position(row2, lfo2_button.y() + lfo2_button.height());
dist_button.name( "Dist" );
control_view.addElement(dist_button);

dist_led.size(50, 50);
dist_led.color(MAUI_LED.red);
dist_led.position(dist_button.x() + dist_button.width(), lfo2_button.y() + lfo2_button.height());
control_view.addElement(dist_led);

dist_gain.size(200, 100);
dist_gain.range(0., 1.);
dist_gain.position(dist_led.x() + dist_led.width(), lfo2_button.y() + lfo2_button.height());
dist_gain.value(1);
dist_gain.name( "Dist gain" );
control_view.addElement(dist_gain);

// MASTER
master_vol.size(200, 100);
master_vol.range(0., 1.);
master_vol.position(0., lfo3_button.y() + lfo3_button.height() + 50);
master_vol.value(0.5);
master_vol.name( "Master" );
control_view.addElement(master_vol);

// OSC FREQ
osc1_freq.size(400, 100);
osc1_freq.range(10., 500.);
osc1_freq.position(master_vol.width(), lfo3_button.y() + lfo3_button.height());
osc1_freq.value(100.);
osc1_freq.name( "OSC 1 freq" );
control_view.addElement(osc1_freq);

osc2_freq.size(400, 100);
osc2_freq.range(10., 500.);
osc2_freq.position(master_vol.width(), lfo3_button.y() + lfo3_button.height() + 75);
osc2_freq.value(100.);
osc2_freq.name( "OSC 2 freq" );
control_view.addElement(osc2_freq);

control_view.display();

// CONTROL FUNCTIONS
// OSC 1
fun void ctlSin1Button() {
	while( true ) {
		// wait for button to pushed
		sin1_button => now;
		sin1_led.light();
		tri1_led.unlight();
		saw1_led.unlight();
		wobble.OSC1("sine");
	}
}

fun void ctlTri1Button() {
	while( true ) {
		// wait for button to pushed on
		tri1_button => now;
		sin1_led.unlight();
		tri1_led.light();
		saw1_led.unlight();
		wobble.OSC1("tri");
	}
}

fun void ctlSaw1Button() {
	while( true ) {
		// wait for button to pushed on
		saw1_button => now;
		sin1_led.unlight();
		tri1_led.unlight();
		saw1_led.light();
		wobble.OSC1("saw");
	}
}

fun void ctlOsc1Harm() {
	while( true ) {
		osc1_harmonics => now;
		osc1_harmonics.value() $ int => wobble.sin1.harmonics;
		<<< "osc1 harm: ", osc1_harmonics.value() >>>;
	}
}

fun void ctlOsc1Gain() {
	while( true ) {
		osc1_gain => now;
		<<< "fm_on ", wobble.fm_on >>>;
		if( wobble.fm_on ) {
			osc1_gain.value() + sync_gain.value() => wobble.osc1gain;
		}
		else {
			osc1_gain.value() => wobble.osc1gain;
		}
		<<< "osc1 gain: ", osc1_gain.value() >>>;
	}
}

fun void ctlOsc1Freq() {
	while( true ) {
		osc1_freq => now;
		osc1_freq.value() => wobble.osc1freq;
		<<< "osc1 freq: ", osc1_freq.value() >>>;
	}
}

// OSC 2
fun void ctlSin2Button() {
	while( true ) {
		// wait for button to pushed on
		sin2_button => now;
		sin2_led.light();
		tri2_led.unlight();
		saw2_led.unlight();
		wobble.OSC2("sine");
	}
}

fun void ctlTri2Button() {
	while( true ) {
		// wait for button to pushed on
		tri2_button => now;
		sin2_led.unlight();
		tri2_led.light();
		saw2_led.unlight();
		wobble.OSC2("tri");
	}
}

fun void ctlSaw2Button() {
	while( true ) {
		// wait for button to pushed on
		saw2_button => now;
		sin2_led.unlight();
		tri2_led.unlight();
		saw2_led.light();
		wobble.OSC2("saw");
	}
}

fun void ctlOsc2Gain() {
	while( true ) {
		osc2_gain => now;
		osc2_gain.value() => wobble.osc2gain;
		<<< "osc2 gain: ", osc2_gain.value() >>>;
	}
}

fun void ctlOsc2Freq() {
	while( true ) {
		osc2_freq => now;
		osc2_freq.value() => wobble.osc2freq;
		<<< "osc2 freq: ", osc2_freq.value() >>>;
	}
}

// Sync
fun void ctlSyncButton() {
	while( true ) {
		// wait for button to pushed on
		sync_button => now;
		if( wobble.fm_on ) {
			wobble.syncFM( 0 );
			osc1_gain.value() => wobble.osc1gain;
			sync_led.unlight();
		}
		else {
			wobble.syncFM( 1 );
			osc1_gain.value() + sync_gain.value() => wobble.osc1gain;
			sync_led.light();
		}
		<<< "fm_on ", wobble.fm_on >>>;
	}
}

fun void ctlSyncGain() {
	while( true ) {
		sync_gain => now;
		if( wobble.fm_on ) {
			osc1_gain.value() + sync_gain.value() => wobble.osc1gain;
		}
		<<< "fm_on ", wobble.fm_on >>>;
		<<< "sync gain: ", sync_gain.value() >>>;
	}
}

// LFO
fun void ctlLfo1Button() {
	while( true ) {
		// wait for button to pushed on
		lfo1_button => now;
		if( wobble.lfo_osc1 ) {
			wobble.lfoOSC1( 0 );
			lfo1_led.unlight();
		}
		else {
			wobble.lfoOSC1( 1 );
			lfo1_led.light();
		}
		<<< "lfo_osc1 ", wobble.lfo_osc1 >>>;
	}
}

fun void ctlLfo1Freq() {
	while( true ) {
		lfo1_freq => now;
		lfo1_freq.value() => wobble.lfo1.freq;
		<<< "lfo 1 freq: ", lfo1_freq.value() >>>;
	}
}

fun void ctlLfo2Button() {
	while( true ) {
		// wait for button to pushed on
		lfo2_button => now;
		if( wobble.lfo_osc2 ) {
			wobble.lfoOSC2( 0 );
			lfo2_led.unlight();
		}
		else {
			wobble.lfoOSC2( 1 );
			lfo2_led.light();
		}
		<<< "lfo_osc2 ", wobble.lfo_osc2 >>>;
	}
}

fun void ctlLfo2Freq() {
	while( true ) {
		lfo2_freq => now;
		lfo2_freq.value() => wobble.lfo2.freq;
		<<< "lfo 2 freq: ", lfo2_freq.value() >>>;
	}
}

fun void ctlLfo3Button() {
	while( true ) {
		// wait for button to pushed on
		lfo3_button => now;
		<<< "nothing here yet..." >>>;
	}
}

fun void ctlLfo3Freq() {
	while( true ) {
		lfo3_freq => now;
		<<< "lfo 3 freq: ", lfo3_freq.value() >>>;
	}
}

// DIST
fun void ctlDistButton() {
	while( true ) {
		// wait for button to pushed on
		dist_button => now;
		if( wobble.dist_on ) {
			wobble.overdrive( 0 );
			dist_led.unlight();
		}
		else {
			wobble.overdrive( 1 );
			dist_led.light();
		}
		<<< "dist_on ", wobble.dist_on >>>;
	}
}

fun void ctlDistGain() {
	while( true ) {
		dist_gain => now;
		dist_gain.value() => wobble.distortion.gain;
		<<< "dist gain: ", dist_gain.value() >>>;
	}
}

// FILTERS
fun void ctlFilterFreq() {
	while( true ) {
		filter_freq => now;
		filter_freq.value() => wobble.filter.freq;
		<<< "filter freq: ", filter_freq.value() >>>;
	}
}

fun void ctlFilterQ() {
	while( true ) {
		filter_q => now;
		filter_q.value() => wobble.filterQ;
		<<< "filter Q: ", filter_q.value() >>>;
	}
}

// MASTER

fun void ctlMaster() {
	while( true ) {
		master_vol => now;
		master_vol.value() => gain.gain;
		<<< "Master vol: ", master_vol.value() >>>;
	}
}

// spork all the listeners as seperate shreds
// OSC 1
spork ~ ctlSin1Button();
me.yield();
spork ~ ctlTri1Button();
me.yield();
spork ~ ctlSaw1Button();
me.yield();
spork ~ ctlOsc1Harm();
me.yield();
spork ~ ctlOsc1Gain();
me.yield();
spork ~ ctlOsc1Freq();
me.yield();

// OSC 2
spork ~ ctlSin2Button();
me.yield();
spork ~ ctlTri2Button();
me.yield();
spork ~ ctlSaw2Button();
me.yield();
spork ~ ctlOsc2Gain();
me.yield();
spork ~ ctlOsc2Freq();
me.yield();

// FM
spork ~ ctlSyncButton();
me.yield();
spork ~ ctlSyncGain();
me.yield();

// LFO
spork ~ ctlLfo1Button();
me.yield();
spork ~ ctlLfo1Freq();
me.yield();

spork ~ ctlLfo2Button();
me.yield();
spork ~ ctlLfo2Freq();
me.yield();

spork ~ ctlLfo3Button();
me.yield();
spork ~ ctlLfo3Freq();
me.yield();

// DIST
spork ~ ctlDistButton();
me.yield();
spork ~ ctlDistGain();
me.yield();


// FILTER
spork ~ ctlFilterFreq();
me.yield();
spork ~ ctlFilterQ();
me.yield();


//MASTER
spork ~ ctlMaster();
me.yield();

// main loop
while(true) {
	wobble.tick( kr );
}