public class PatternPopulation {
	Genes genes;
	PatternAnimal population[0];
	-1 => int indexOfFittest;
	
	fun void add( PatternAnimal a ) {
		population << a;
	}
	
	fun PatternAnimal getFittest( PatternAnimal uber ) {
		-1 => int fitness;
		PatternAnimal fittest;
		
		for( 0 => int i; i < population.size(); i++ ) {
			genes.fitness( uber.gene, population[i].gene ) => int nextFit;
			if( nextFit > fitness ) {
				nextFit => fitness;
				population[i] @=> fittest;
				i => indexOfFittest;
			}
		}
		
		return fittest;
	}
	
	fun PatternAnimal getFittest( int uber[] ) {
		-1 => int fitness;
		PatternAnimal fittest;
		
		for( 0 => int i; i < population.size(); i++ ) {
			genes.fitness( uber, population[i].gene ) => int nextFit;
			//<<< "fitness: ", nextFit >>>;
			if( nextFit > fitness ) {
				nextFit => fitness;
				population[i] @=> fittest;
				i => indexOfFittest;
			}
		}
		//<<< "fittest: ", indexOfFittest >>>;
		return fittest;
	}
	
	fun PatternAnimal getSecondFittest( PatternAnimal uber ) {
		PatternAnimal secondFittest;
		-1 => int fitness;
		if( indexOfFittest >= 0 ) {
			for( 0 => int i; i < population.size(); i++ ) {
				if( i != indexOfFittest ) {
					genes.fitness( uber.gene, population[i].gene ) => int nextFit;
					if( nextFit > fitness ) {
						nextFit => fitness;
						population[i] @=> secondFittest;
					}
				}
			}
		}
		else {
			//getFittest( uber );
			//getSecondFittest( uber );
			<<< "Can't determine second fittest without first determining fittest" >>>;
		}
		
		return secondFittest;
	}
	
	fun PatternAnimal getSecondFittest( int uber[] ) {
		-1 => int fitness;
		PatternAnimal secondFittest;
		if( indexOfFittest >= 0 ) {
			for( 0 => int i; i < population.size(); i++ ) {
				if( i != indexOfFittest ) {
					genes.fitness( uber, population[i].gene ) => int nextFit;
					if( nextFit > fitness ) {
						nextFit => fitness;
						population[i] @=> secondFittest;
					}
				}
			}
		}
		else {
			//getFittest( uber );
			//getSecondFittest( uber );
			<<< "Can't determine second fittest without first determining fittest" >>>;
		}
		
		return secondFittest;
	}
	
	fun void genocide() {
		0 => population.size;
	}
	
	fun int fittestIndex() {
		return indexOfFittest;
	}
}

// PatternPopulation pop;
// 
// PatternGenerator pg;
// //pg.makePattern(8,3,2,7) @=> p1[];
// //pg.makePattern(8,1,1,4) @=> p2[];
// 
// for( 0 => int i; i < 4; i++ ) {
	// pg.makePattern(8,i+1,1,8) @=> int pat[];
	// PatternAnimal.spawn( pat ) @=> PatternAnimal animal;
	// pop.add( animal );
// }
// 
// for( 0 => int i; i < 4; i++ ) {
	// <<< "pop[",i,"]" >>>;
	// pop.population[i].print();
// }
// 
// pop.getFittest( pg.makePattern(8,3,1,6) ) @=> PatternAnimal fittest;
// <<< "uber:" >>>;
// pg.printLast();
// <<< "fittest:" >>>;
// fittest.print();
