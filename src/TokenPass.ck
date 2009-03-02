// TokenPass - "abstract" class for taking the grunt-work out of implementing token-passing scheme
// for a network, which in this case is the Arboretum.  Doesn't do much, so subclass it.

public class TokenPass {
	// the network
	Arboretum arb;
	
	// an iterable list of names (could also include head node)
	["redwood", 
	"elm", 
	"maple", 
	"ash", 
	"ginko", 
	"cedar", 
	"beech", 
	"birch", 
	"cherry",
	"spruce",
	"oak"] @=> string machines[];
	
	// create token even
	createOscEvent( "/token, i", 9999 ) @=> OscEvent oe;
	
	
	// osc event creator function
	fun OscEvent createOscEvent( string address, int port ) {
		OscRecv recv;
		port => recv.port;
		recv.listen();
		recv.event( address ) @=> OscEvent oe;
		return oe;
	}
	
	fun void send( int out ) {
		// sends an int to another machine on the network
		OscSend xmit;
		xmit.setHost( arb.ip(machines[out]), arb.port(machines[out]) );
		xmit.startMsg( "/token", "i" );
		out => xmit.addInt;
	}
	
	fun void trigger( int token ) {
		// override me in subclasses
		<<< arb.self, "has the token", token >>>;
		1::second => now;
		<<< arb.self, "sending to", machines[(token+1)%11], (token+1)%11 >>>;
	}
	
	fun void listen() {
		while( true ) {
			// wait for token
			oe => now;
			
			// receive token
			-1 => int intok;
			if( oe.nextMsg() ) {
				oe.getInt() => intok;
			}
			
			// do something (with the token)
			trigger( intok );
			
			// increment token and pass it on
			(intok + 1) % 11 => int outtok;
			
			send( outtok );
		}
	}
}

//TokenPass pass;
//pass.listen();
