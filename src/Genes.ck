public class Genes {
	BOps bool;
	
	fun int[] mate( int parentA[], int parentB[] ) {
		int mask[ parentA.size() ];
		int child[ parentA.size() ];
		for( 0 => int i; i < mask.size(); i++ ) {
			Math.rand2(0,1) => mask[i];
		}
		//<<< "before mutation" >>>;
		for( 0 => int i; i < mask.size(); i++ ) {
			if( mask[i] ) {
				parentA[i] => child[i];
			}
			else {
				parentB[i] => child[i];
			}
			//<<< i, child[i] >>>;
		}
		//<<< "after mutation" >>>;
		return mutate( child );
	}
	
	fun int[] mutate( int child[] ) {
		int newChild[ child.size() ];
		0 => int mutated;
		for( 0 => int i; i < child.size(); i++ ) {
			if( maybe && maybe && maybe) {
				bool.NOT( child[i] ) => newChild[i];
				1 => mutated;
			}
			else {
				child[i] => newChild[i];
			}
			if( mutated ) {
				1 => newChild[ Math.rand2(0, newChild.size()-1) ];
			}
			//<<< i, newChild[i] >>>;
		}
		return newChild;
	}
	
	fun int fitness( int uber[], int mench[] ) {
		0 => int fitness;
		for( 0 => int i; i < mench.size(); i++ ) {
			if( mench[i] == uber[i] ) {
				fitness++;
			}
		}
		return fitness;
	}
}

// Genes g;
// PatternGenerator pg;
// pg.makePattern(8,2,1,8) @=> int pat[];
// pg.makePattern(8,3,2,6) @=> int pat2[];
// 
// // int children[0][0];
// 
// // for( 0 => int i; i < 8; i++ ) {
	// // children << g.mate(pat, pat2);
// // }
// 
// // for( 0 => int i; i < 8; i++ ) {
	// // for( 0 => int j; j < 8; j++ ) {
		// // <<< children[i][j] >>>;
	// // }
// // }
// 
// g.mate( pat, pat2 ) @=> int child1[];
// g.mate( pat, pat2 ) @=> int child2[];
// g.mate( pat, pat2 ) @=> int child3[];
// g.mate( pat, pat2 ) @=> int child4[];
// 
// 
// <<< "child1 fitness:", g.fitness( pat, child1 ) >>>;
// <<< "child1 fitness:", g.fitness( pat, child2 ) >>>;
// <<< "child1 fitness:", g.fitness( pat, child3 ) >>>;
// <<< "child1 fitness:", g.fitness( pat, child4 ) >>>;


