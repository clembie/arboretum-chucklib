public class PatternAnimal {
	int gene[0];
	
	fun static PatternAnimal spawn( int pattern[] ) {
		PatternAnimal animal;
		for( 0 => int i; i < pattern.size(); i++ ) {
			animal.gene << pattern[i];
		}
		return animal;
	}
	
	fun int[] getGeneticMaterial() {
		int copy[0];
		for( 0 => int i; i < gene.size(); i++ ) {
			copy << gene[i];
		}
		return copy;
	}
	
	fun void print() {
		for( 0 => int i; i < gene.size(); i++ ) {
			<<< gene[i] >>>;
		}
	}
}


