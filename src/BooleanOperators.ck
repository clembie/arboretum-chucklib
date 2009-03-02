// requires IntIterator.ck

public class BOps {
	// Boolean Operations on Integers
	fun int NOT( int a ) {
		return !a;
	}
	
	fun int AND( int a, int b ) {
		return a && b;
	}
	
	fun int OR( int a, int b ) {
		return a || b;
	}
	
	fun int NOR( int a, int b ) {
		return !(a || b);
	}
	
	fun int NAND( int a, int b ) {
		return !(a && b);
	}
	
	fun int XOR( int a, int b ) {
		return (!a && b) || (a && !b);
	}
	
	fun int XNOR( int a, int b ) {
		return !((!a && b) || (a && !b));
	}
	
	// Boolean Operations on Arrays of Integers
	fun int[] arrayNOT( int a[] ) {
		int newArray[0];
		for( 0 => int i; i < a.size(); i++ ) {
			newArray << NOT(a[i]);
		}
		return newArray;
	}
	
	fun int[] arrayAND( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << AND( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	fun int[] arrayOR( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << OR( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	fun int[] arrayNOR( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << NOR( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	fun int[] arrayNAND( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << NAND( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	fun int[] arrayXOR( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << XOR( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	fun int[] arrayXNOR( int a[], int b[] ) {
		// this will change sizes of inputs if they are unequal!
		normalize( a, b );
		IntIterator ia, ib;
		ia.attach( a );
		ib.attach( b );
		int newArray[0];
		while( ia.hasNext() && ib.hasNext() ) {
			newArray << XNOR( ia.next(), ib.next() );
		}
		return newArray;
	}
	
	// Helpers
	fun void normalize( int a[], int b[] ) {
		// this alters array sizes!
		if( a.size() == b.size() ) {
			return;
		}
		else if( a.size() > b.size() ) {
			a.size() - b.size() => int dif;
			for( 0 => int i; i < dif; i++ ) {
				b << 0;
			}
		}
		else if( b.size() > a.size() ) {
			b.size() - a.size() => int dif;
			for( 0 => int i; i < dif; i++ ) {
				a << 0;
			}
		}
	}
}

// Tests

// [0,0,1,1] @=> int a[];
// [0,1,0,1] @=> int b[];
//[0,1,0,1,1,1,1,1,1,1,1] @=> int b[];

// BOps bo;
// bo.normalize( b, a );
// 
// IntIterator ia;
// IntIterator ib;
// ia.attach( a );
// ib.attach( b );
// 
// while( ia.hasNext() ) {
	// <<< ia.next() >>>;
// }
// 
// <<< a.size() >>>;
// <<< b.size() >>>;
// 
// fun void printAB() {
	// ia.goToStart();
	// ib.goToStart();
	// 
	// <<< "a" >>>;
	// while( ia.hasNext() ) {
		// <<< "a: ", ia.next() >>>;
	// }
	// 
	// <<< "b" >>>;
	// while( ib.hasNext() ) {
		// <<< "b: ", ib.next() >>>;
	// }
// }
// 
// fun void print( int ar[] ) {
	// IntIterator i;
	// i.attach( ar );
	// while( i.hasNext() ) {
		// <<< i.next() >>>;
	// }
// }
// 
// printAB();
// <<< "AND" >>>;
// print( bo.arrayAND( a, b ) );
// 
// <<< "OR" >>>;
// print( bo.arrayOR( a, b ) );
// 
// <<< "NOR" >>>;
// print( bo.arrayNOR( a, b ) );
// 
// <<< "NAND" >>>;
// print( bo.arrayNAND( a, b ) );
// 
// <<< "XOR" >>>;
// print( bo.arrayXOR( a, b ) );
// 
// <<< "XNOR" >>>;
// print( bo.arrayXNOR( a, b ) );
// 
// <<< "done!" >>>;
