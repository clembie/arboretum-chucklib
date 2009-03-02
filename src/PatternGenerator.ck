public class PatternGenerator {
	int lastPattern[4];
	
	fun int[] describe( int pattern[] ) {
		pattern.size() => int spc;
		firstOccurance(pattern) => int str;
		lastOccurance(pattern) => int end;
		occurances(pattern) => int occ;
		(end-str)/(occ-1) => int frq;
		
		return [spc,frq,str,end];
	}
	
	fun int[] describeReverse( int pattern[] ) {
		describe(pattern) @=> int desc[];
		desc[0] => int spc;
		desc[1] => int frq;
		desc[2] => int str;
		desc[3] => int end;
		return [spc, frq, (spc+1-end), (spc+1-str)];
	}
	
	fun int[] makePattern( int spc, int frq, int str, int end ) {
		spc => lastPattern[0];
		frq => lastPattern[1];
		str => lastPattern[2];
		end => lastPattern[3];
		
		int pattern[0];
		//0 => pattern.size;
		frq => int frq_count;
		for( 0 => int i; i < spc; i++ ) {
			if( i >= (str - 1) && i <= (end - 1) ) {
				if( frq_count % frq == 0 ) {
					pattern << 1;
				}
				else {
					pattern << 0;
				}
				frq_count++;
			}
			else {
				pattern << 0;
			}
		}
		return pattern;
	}
	
	fun int[] makePattern( int desc[] ) {
		desc[0] => lastPattern[0];
		desc[1] => lastPattern[1];
		desc[2] => lastPattern[2];
		desc[3] => lastPattern[3];
		return makePattern( desc[0], desc[1], desc[2], desc[3] );
	}
	
	fun int lastOccurance( int pattern[] ) {
		// i return the ordinal number of the last occurance of the symbol 
		// or 0 in the case that there are no occurances of the symbol
		-1 => int place;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( pattern[i] ) {
				i => place;
			}
		}
		return place + 1;
	}
	
	fun int firstOccurance( int pattern[] ) {
		// i return the ordinal number of the first occurance of the symbol
		// or 0 in the case that there are no occurances of the symbol
		-1 => int place;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( pattern[i] ) {
				i => place;
				break;
			}
		}
		return place + 1;
	}
	
	fun int occurances( int pattern[] ) {
		// i count the occurances of the symbol in the pattern
		0 => int count;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( pattern[i] ) {
				count++;
			}
		}
		return count;
	}
	
	fun void printLast() {
		makePattern( lastPattern ) @=> int lp[];
		for( 0 => int i; i < lp.size(); i++ ) {
			<<< lp[i] >>>;
		}
	}
	
	fun int[] makeLast() {
		return makePattern( lastPattern );
	}
}

// tests
// PatternGenerator pg;
// 
// pg.makePattern(8,2,1,7) @=> int myPattern[];
// pg.printLast();
// 
// pg.describe( pg.makeLast() ) @=> int description[];
// 
// for( 0 => int i; i < 4; i++ ) {
	// <<< description[i] >>>;
// }
// 
// <<< "occurances: ", pg.occurances( myPattern ) >>>;
// <<< "first occurance: ", pg.firstOccurance( myPattern ) >>>;
// <<< "last occurance: ", pg.lastOccurance( myPattern ) >>>;
// <<< "reverse: " >>>;
// 
// pg.describeReverse( myPattern ) @=> int reverse[];
// 
// for( 0 => int i; i < 4; i++ ) {
	// <<< reverse[i] >>>;
// }
// 
// pg.makePattern( pg.describeReverse( myPattern ) ) @=> int reversedPattern[];
// pg.printLast();
