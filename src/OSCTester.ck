// Generic Test OSC Responder Class

public class OSCTester {
	// a simple patch
	SinOsc s => dac;
	0 => s.gain;
	
	// osc event creator function
	fun OscEvent createOscEvent( string address, int port ) {
		OscRecv recv;
		port => recv.port;
		recv.listen();
		recv.event( address ) @=> OscEvent oe;
		return oe;
	}
	
	fun void test() {
		createOscEvent( "/test, f", 9999 ) @=> OscEvent oe;
		0. => float frq;
		
		while( true ) {
			0. => s.gain;
			oe => now;
			
			if( oe.nextMsg() ) {
				oe.getFloat() => frq;
				<<< "received (via OSC):", frq >>>;
			}
			
			1. => s.gain;
			frq => s.freq;
			0.25::second => now;
			
			me.yield();
		}
	}
	
	fun void run() {
		spork ~ test() @=> Shred tst;
		<<< "test listener is shred #", tst.id() >>>;
		me.yield();
	}
}

//OSCTester test;
//test.run();

//"localhost" => string hostname;
//9999 => int port;

//OscSend xmit;
//xmit.setHost( hostname, port );

//while( true ) {
//	xmit.startMsg( "/test", "f" );
	
//	500. => float temp => xmit.addFloat;
//	<<< "sent (via OSC):", temp >>>;
	
	// wait a little bit
//	1::second => now;
//}
