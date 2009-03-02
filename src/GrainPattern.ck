// GrainPattern - Michael Clemow, 2008 (needs >= Chuck 1.2.1.2)
//
// Requirements: Granular/DataTypes/GrainDef.ck
//

public class GrainPattern {
    GrainDef pattern[0];
    0 => int cursor;  // current index
	
	// Class functions
	fun static void copy( GrainPattern gp1, GrainPattern gp2 ) {
		// copies gp1 data to gp2
		if( gp1.size() == gp2.size() ) {
			for( 0 => int i; i < gp1.size(); i++ ) {
				GrainDef.copy( gp1.pattern[i], gp2.pattern[i] );
			}
		}
		else {
			<<< "Error: GrainPatterns must be equal sizes (did you forget to initialize the GrainPattern you're copying to?)" >>>;
		}
	}
    
    // info
    fun void print() {
		// prints out all the grain defs to the console
		<<< " type	freq		amp		cycles	harms	bpFreq		width" >>>;
        for( 0 => int i; i < pattern.size(); i++ ) {
            <<< i, pattern[i].type, "	", pattern[i].freq, "	", pattern[i].amp, "	", pattern[i].cycles, "	", pattern[i].harmonics, "	", pattern[i].bpFreq, "	", pattern[i].width >>>;
        }
    }
    
    fun int size() {
		// returns the size of the pattern
        return pattern.size();
    }
    
    fun void reset() {
		// resets the position of the cursor
        0 => cursor;
    }
    
	fun int position( int i ) {
		// sets the cursor at the position i.  if i is greater/less than the size of the array, then it will "loop around".
		if( pattern.size() > 0 ) {
			if( i >= 0 && i < pattern.size() ) {
				i => cursor;
			}
			else if( i >= pattern.size() ) {
				i % pattern.size() => cursor;
			}
			else if( i < 0  && Math.abs(i) < pattern.size() ) {
				pattern.size() - Math.abs(i) => cursor;
			}
			else if( i < 0 && Math.abs(i) >= pattern.size() ) {
				pattern.size() - ( Math.abs(i) % pattern.size() ) => cursor;
			}
			else {
				<<< "Error: My head asplode." >>>;
			}
		}
		else {
			0 => cursor;
		}
		return cursor;
	}
	
	fun int isEmpty() {
		// returns true if the pattern is empty
		if( pattern.size() == 0 ) {
			return true;
		}
		else {
			return false;
		}
	}
	
    // append/remove
    fun GrainPattern add( GrainDef gd ) {
		// adds a GrainDef to the end of the pattern
        pattern << gd;
		return this;
    }
	
	fun GrainPattern add( GrainDef gd[] ) {
		// add a GrainDef array to the end of the pattern
		for( 0 => int i; i < gd.size(); i++ ) {
			pattern << gd[i];
		}
		
		return this;
	}
	
	fun GrainPattern add( GrainPattern pat ) {
		// adds contents of GrainPattern pat to this GrainPattern
		return this.add( pat.pattern );
	}
	
	fun GrainPattern addFirst( GrainDef gd ) {
		// add the GrainDef to the beginning of the pattern
		GrainDef old[pattern.size()];
		
		for( 0 => int i; i < pattern.size(); i++ ) {
			pattern[i] @=> old[i];
		}
		
		pattern.clear();
		0 => pattern.size;
		
		pattern << gd;
		
		for( 0 => int i; i < old.size(); i++ ) {
			pattern << old[i];
		}
		return this;
	}
	
	fun GrainPattern addFirst( GrainDef gd[] ) {
		// add the GrainDef array to the beginning of the array
		GrainDef old[pattern.size()];
		
		for( 0 => int i; i < pattern.size(); i++ ) {
			pattern[i] @=> old[i];
		}
		
		pattern.clear();
		0 => pattern.size;
		
		this.add( gd );
		
		for( 0 => int i; i < old.size(); i++ ) {
			pattern << old[i];
		}
		return this;
	}
	
	fun GrainPattern addFirst( GrainPattern pat ) {
		// adds the contents of the GrainPattern pat to this GrainPattern
		this.addFirst( pat.pattern );
		return this;
	}
	
	fun GrainPattern insertAt( GrainDef gd, int p ) {
		// insert GrainDef at position i
		if( p >= 0 && p <= pattern.size() ) {
			GrainDef old[pattern.size()];
			
			for( 0 => int i; i < pattern.size(); i++ ) {
				pattern[i] @=> old[i];
			}
			
			pattern.clear();
			0 => pattern.size;
			
			for( 0 => int i; i < old.size(); i++ ) {
				if( i == p ) {
					pattern << gd;
				}
				pattern << old[i];
			}
		}
		else {
			<<< "Error: index out of range in insertAt()", p >>>;
		}
		return this;
	}
	
	fun GrainPattern insertAt( GrainDef gd[], int p ) {
		// insert GrainDef array at position i
		if( p >= 0 && p <= pattern.size() ) {
			0 => int count;
			for( p => int i; i < pattern.size(); i++ ) {
				if( count == gd.size() ) { break; }
				
				insertAt( gd[count], i );
				
				count++;
			}
		}
		else {
			<<< "Error: index out of range in insertAt()", p >>>;
		}
		return this;
	}
	
	fun GrainPattern insertAt( GrainPattern pat, int p ) {
		// inserts the contents of the GrainPattern pat at index p in this GrainPattern
		insertAt( pat.pattern, p );
		return this;
	}
    
    fun GrainPattern removeLast() {
		// removes the last element in the pattern
        pattern.popBack();
		return this;
    }
    
    fun GrainPattern remove( int index ) {
        // set pattern[] to an array without the GrainDef at index
        if( index < pattern.size() && index >= 0 ) {
            GrainDef old[pattern.size()];
            
            for( 0 => int i; i < pattern.size(); i++ ) {
                pattern[i] @=> old[i];
            }
            
            pattern.clear();
            0 => pattern.size;
            
            for( 0 => int i; i < old.size(); i++ ) {
                if( i != index ) {
                    pattern << old[i];
                }
            }
			return this;
        }
        else {
            <<< "Error: index out of range in remove()", index >>>;
        }
    }
    
    fun GrainPattern replace( int index, GrainDef r ) {
        // replace the GrainDef at index to r
		r @=> pattern[index];
		return this;
    }
    
    fun GrainPattern remove( GrainDef g ) {
        // remove all occurances of g in pattern
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( g.equals(pattern[i]) ) {
				remove( i );
				i - 1 => i;
			}
		}
		return this;
    }
    
    fun GrainPattern replace( GrainDef f, GrainDef r ) {
        // replace all occurances of f with r in pattern
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( f.equals(pattern[i]) ) {
				r @=> pattern[i];
			}
		}
		return this;
    }
	
	fun GrainPattern removeAll( GrainDef defs[] ) {
		// remove all occurances of all the GrainDefs in the array
		GrainDef removeMe;
		for( 0 => int i; i < defs.size(); i++ ) {
			GrainDef.copy( defs[i], removeMe );
			remove( removeMe );
		}
		return this;
	}
	
	fun GrainPattern removeAll( GrainPattern pat ) {
		// remove all occurances of the GrainDefs in the GrainPattern pat from this GrainPattern.
		removeAll( pat.pattern );
		return this;
	}
	
	fun GrainDef[] removeAllSuchThat( GrainDefFunctor gdf ) {
		// removes all GrainDefs in the pattern for which the function in the GrainDefFunctor answers true
		GrainDef removed[0];
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine( pattern[i] ) ) {
				removed << pattern[i];
			}
		}
		this.removeAll( removed );
		return removed;
	}
	
	fun int includes( GrainDef gd ) { 
		// answers true if the pattern contains the GrainDef gd
		int included;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( pattern[i].equals( gd ) ) {
				1 => included;
				break;
			}
		}
		return included;
	}
	
	fun int includesAny( GrainDef gd[] ) {
		// answers true if any GrainDef in gd is in the pattern
		int incAny;
		for( 0 => int i; i < pattern.size(); i++ ) {
			for( 0 => int j; j < gd.size(); j++ ) {
				if( pattern[i].equals( gd[j] ) ) {
					1 => incAny;
					break;
				}
				if( incAny ) {
					break;
				}
			}
		}
		return incAny;
	}
	
	fun int includesAny( GrainPattern pat ) {
		// answers true if any GrainDef included in pat is in this GrainPattern
		return this.includesAny( pat.pattern );
	}
	
	fun int includesAll( GrainDef gd[] ) {
		// answers true if all GrainDefs in gd are in the pattern
		1 => int incAll;
		for( 0 => int i; i < pattern.size(); i++ ) {
			for( 0 => int j; j < gd.size(); j++ ) {
				if( !pattern[i].equals( gd[j] ) ) {
					0 => incAll;
					break;
				}
				if( !incAll ) {
					break;
				}
			}
		}
		return incAll;
	}
	
	fun int includesAll( GrainPattern pat ) {
		// answers true if all GrainDefs included in pat are in this GrainPattern
		return this.includesAll( pat.pattern );
	}
    
    // operations
    fun GrainPattern reverse() {
        // reverse the order of the pattern
		GrainDef gd[pattern.size()];
		for( 0 => int i; i < pattern.size(); i++ ) {
			pattern[i] @=> gd[i];
		}
		
		pattern.clear();
		0 => pattern.size;
		
		for( gd.size() - 1 => int i; i >= 0; i-- ) {
			pattern << gd[i];
		}
		//<<< pattern.size(), " :: size" >>>;
		return this;
    }
    
	
	// re: shiftLeft() and shiftRight(): there is probably a better way to do this in which i can supply an int n to shift n places to the right or left.
    fun GrainPattern shiftLeft() {
        // shift and wrap the pattern n places to the left
		GrainDef p;
		pattern[0] @=> p;
		for( 1 => int i; i < pattern.size(); i++ ) {
			pattern[i] @=> pattern[i-1];
		}
		p @=> pattern[pattern.size() - 1];
		return this;
    }
    
    fun GrainPattern shiftRight() {
        // shift and wrap the pattern n places to the right
		GrainDef p;
		pattern[pattern.size() - 1] @=> p;
		for( pattern.size() - 2 => int i; i >= 0; i-- ) {
			pattern[i] @=> pattern[i+1];
		}
		p @=> pattern[0];
		return this;
    }
	
	fun GrainPattern mirror() {
		for( pattern.size() - 1 => int i; i >= 0; i-- ) {
			pattern << pattern[i];
		}
		return this;
	}
    
    // generators
    fun GrainDef random() {
		// returns a random GrainDef
		Math.rand2( 0, pattern.size() - 1 ) => int r;
        return pattern[ r ];
    }
	
	fun GrainDef pop() {
		// returns the one on the end and removes it from the array
        pattern[pattern.size()-1] @=> GrainDef g;
        pattern.popBack();
        return g;
    }
    
    fun GrainDef next( int n ) {
		// returns the GrainDef at index n.  If n > pattern.size(), we wrap
        pattern[cursor] @=> GrainDef g;
        if( cursor + n >= pattern.size() ) {
            (cursor + n) % pattern.size() => cursor;
        }
        else {
            cursor + n => cursor;
        }
		return g;
    }
	
	fun GrainDef at( int p ) {
		// returns a reference to the GrainDef at index p
		if( p >= 0 && p < pattern.size() ) {
			return pattern[p];
		}
		else {
			<<< "Error: index out of range in at()", p >>>;
		}
	}
	
	fun GrainDef copyAt( int p ) {
		// returns a copy of the GrainDef at index p
		if( p >= 0 && p < pattern.size() ) {
			GrainDef result;
			GrainDef.copy( pattern[p], result );
			return result;
		}
		else {
			<<< "Error: index out of range in copyAt()", p >>>;
		}
	}
	
	fun GrainDef first() {
		// returns the GrainDef in the beginning of the array
		return pattern[0];
	}
	
	fun GrainDef last() {
		// returns the GrainDef in the beginning of the array
		return pattern[pattern.size() - 1];
	}
	
	fun GrainDef[] getPattern() {
		// returns a GrainDef array that is a copy of the array in this GrainPattern
		GrainDef patternCopy[pattern.size()];
		for( 0 => int i; i < pattern.size(); i++ ) {
			GrainDef.copy( pattern[i], patternCopy[i] );
		}
		return patternCopy;
	}
	
	// iterators
	fun void run( GrainDefFunctor gdf ) {
		// evaluates the function for each of the GrainDefs in the pattern
		for( 0 => int i; i < pattern.size(); i++ ) {
			gdf.routine( pattern[i] );
		}
	}
	
	fun GrainDef[] collect( GrainDefFunctor gdf ) {
		// answers an array of GrainDefs consisting of the results of a GrainDefFunctor function on the pattern
		GrainDef results[0];
		for( 0 => int i; i < pattern.size(); i++ ) {
			results << gdf.grainDefRoutine( pattern[i] );
		}
		return results;
	}
	
	// collectAs()...
	
	fun GrainDef[] select( GrainDefFunctor gdf ) {
		// answer a GrainDef array which consists of all items in the receiver for which the GrainDefFunctor answers true
		GrainDef results[0];
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine(pattern[i]) ) {
				results << pattern[i];
			}
		}
		return results;
	}
	
	fun GrainDef[] reject( GrainDefFunctor gdf ) {
		// answer a GrainDef array which consists of all items in the receiver for which the GrainDefFunctor answers false
		GrainDef results[0];
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( !gdf.intRoutine(pattern[i]) ) {
				results << pattern[i];
			}
		}
		return results;
	}
	
	fun GrainDef detect( GrainDefFunctor gdf ) {
		// answer the first item in the pattern for which the function answers true.
		GrainDef result;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine(pattern[i]) ) {
				pattern[i] @=> result;
				break;
			}
		}
		return result;
	}
	
	fun int detectIndex( GrainDefFunctor gdf ) {
		// answer the index of the first item in the pattern for which the function answers true.
		int result;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine(pattern[i]) ) {
				i => result;
				break;
			}
		}
		return result;
	}
	
	// this method is stupid...
	fun float fold( float n, GrainDefFunctor gdf ) {
		// takes an initial value (float) and a function (GrainDefFunctor)--the functor method must also take a float and a GrainDef[] array as inputs (in that order) and return a float--and returns a value (float) that is the accumulated value of the operation on the GrainDefs.
		return gdf.floatRoutine2( n, pattern );
	}
	
	fun int any( GrainDefFunctor gdf ) {
		// answer whether the functor returns true for any of the GrainDefs in pattern
		0 => int result;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine( pattern[i] ) ) {
				1 => result;
				break;
			}
		}
		return result;
	}
	
	fun int every( GrainDefFunctor gdf ) {
		// answer whether the functor returns true for every of the GrainDefs in pattern
		1 => int result;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( !gdf.intRoutine( pattern[i] ) ) {
				0 => result;
				break;
			}
		}
		return result;
	}
	
	fun int count( GrainDefFunctor gdf ) {
		// answer the number of items for which the functor method answers true.
		0 => int count;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( gdf.intRoutine( pattern[i] ) ) {
				count++;
			}
		}
		return count;
	}
	
	fun int occurencesOf( GrainDef def ) {
		// answer the number of items in the pattern that are equal to the def
		0 => int count;
		for( 0 => int i; i < pattern.size(); i++ ) {
			if( pattern[i].equals( def ) ) {
				count++;
			}
		}
		return count;
	}
	
	// this is stupid too...
	fun float sum( GrainDefFunctor gdf ) {
		// answer the sum of all the results of the functor method on the GrainDefs in the pattern.  (gdf must answer with a float)
		0 => float sum;
		for( 0 => int i; i < pattern.size(); i++ ) {
			gdf.floatRoutine( pattern[i] ) +=> sum;
		}
		return sum;
	}
	
	fun float maxItem( GrainDefFunctor gdf ) {
		// answer the maximum of all the results of the functor method on the GrainDefs in pattern.
		gdf.floatRoutine( pattern[0] ) => float max;
		
		for( 1 => int i; i < pattern.size(); i++ ) {
			Math.max( max, gdf.floatRoutine( pattern[i] ) ) => max;
		}
		
		return max;
	}
	
	fun float minItem( GrainDefFunctor gdf ) {
		// answer the minimum of all the results of the functor method on the GrainDefs in pattern.
		gdf.floatRoutine( pattern[0] ) => float min;
		
		for( 1 => int i; i < pattern.size(); i++ ) {
			Math.min( min, gdf.floatRoutine( pattern[i] ) ) => min;
		}
		
		return min;
	}
	
	fun int maxIndex( GrainDefFunctor gdf ) {
		// answer the index of the maximum of all the results of the functor method on the GrainDefs in pattern.
		0 => int index;
		gdf.floatRoutine( pattern[0] ) => float max;
		
		for( 1 => int i; i < pattern.size(); i++ ) {
			gdf.floatRoutine( pattern[i] ) => float result;
			if( max < result ) {
				result => max;
				i => index;
			}
		}
		
		return index;
	}
	
	fun int minIndex( GrainDefFunctor gdf ) {
		// answer the index of the minimum of all the results of the functor method on the GrainDefs in pattern.
		0 => int index;
		gdf.floatRoutine( pattern[0] ) => float max;
		
		for( 1 => int i; i < pattern.size(); i++ ) {
			gdf.floatRoutine( pattern[i] ) => float result;
			if( max > result ) {
				result => max;
				i => index;
			}
		}
		
		return index;
	}
	
	// gravy...
	fun GrainDef[][] powerset() {
		// returns all possible combinations of the pattern as a 2D array
	}
}


