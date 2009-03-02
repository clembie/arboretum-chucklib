// GrainForker - Michael Clemow, 2008
//
// Requirements: Granular/Grains/Grain2.ck
//


public class GrainForker extends Forkable {
	// class vars
	static int lastId;
	// instance vars
	lastId++ => int id;
	
	fun void run( GrainDef @ def ) {
		Grain grain;
		grain.set( def );
		spawn( grain );
	}
}
