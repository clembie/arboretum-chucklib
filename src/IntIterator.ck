// FYI, do not reuse Iterators.  Once they're attached, they don't like to 
// be attached to anything else.

public class IntIterator {
	int array[];
	-1 => int index;
	
	fun void attach( int a[] ) {
		a @=> array;
	}
	
	fun int hasNext() {
		if( index < array.size() - 1 ) {
			return 1;
		}
		else {
			return 0;
		}
	}
	
	fun int hasPrevious() {
		if( index > 0 ) {
			return 1;
		}
		else {
			return 0;
		}
	}
	
	fun int nextIndex() {
		return index + 1;
	}
	
	fun int previousIndex() {
		return index - 1;
	}
	
	fun int next() {
		index++;
		if( inBounds() ) {
			return array[index];
		}
		else {
			<<< "out of bounds! ", index >>>;
			return index;
		}
	}
	
	fun int previous() {
		index--;
		if( inBounds() ) {
			return array[index];
		}
		else {
			<<< "out of bounds! ", index >>>;
			return index;
		}
	}
	
	fun int inBounds() {
		if( index >= array.size() || index < 0 ) {
			return 0;
		}
		else {
			return 1;
		}
	}
	
	fun void goToStart() {
		-1 => index;
	}
	
	fun void goToEnd() {
		array.size() => index;
	}
	
	fun int getIndex() {
		return index;
	}
	
	fun void set( int n ) {
		if( inBounds() ) {
			n => array[index];
		}
		else {
			<<< "cannot set: ", n, " out of bounds! ", index >>>;
		}
	}
	
	fun void add( int n ) {
		if( inBounds() ) {
			array.size() + 1 => array.size;
			for( array.size()-2 => int i; i > index; i-- ) {
				array[i] => array[i+1];
			}
			n => array[index+1];
		}
		else {
			<<< "cannot add: ", n, " out of bounds! ", index >>>;
		}
	}
}

// tests
// 
// [0,1,2,3,4,5,6,7,8,9] @=> int myInts[];
// IntIterator i;
// 
// i.attach( myInts );
// <<< i.array.size() >>>;
// i.goToEnd();
// 
// while( i.hasPrevious() ) {
	// <<< i.index, i.previous() >>>;
	// if( i.index == 5 ) {
		// i.add(13);
	// }
// }
// 
// <<< i.array.size() >>>;
// 
// i.goToStart();
// 
// while( i.hasNext() ) {
	// <<< i.index, i.next() >>>;
// }

// this should throw an error msg:
//i.set(8);
//<<< i.getIndex() >>>;
