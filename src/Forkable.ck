// Forkable - Spencer Salazar, 2008
//
// This is a suggested base class from Spencer that encapsulates both the Forkable and the Forker concept as an Event.
//
// Requirements: (none)
//

public class Forkable extends Event
{
   0 => int _isFinished;
   Forkable @ children[0];

   // override this in subclasses
   fun void run()
   {

   }

   // private; executes run() and performs shred initialization/cleanup
   fun void runShell()
   {
       run();

       for(0 => int i; i < children.size(); i++)
       {
           children[i].wait();
       }

       1 => _isFinished;
       this.broadcast();
	   me.yield();
   }

   // call this to spork/fork the Forkable
   fun void start()
   {
       spork ~ runShell();
	   me.yield();
   }

   // returns 1 if this Forkable has completely finished executing; 0 otherwise
   fun int isFinished()
   {
       return _isFinished;
   }

   // protected; starts a new Forkable as a child Forkable.  This Forkable is not considered finished
   // and thus will not exit until all child Forkables are finished.
   fun void spawn(Forkable @ forkable)
   {
       children << forkable;
       forkable.start();
   }

   // block/pass time until Forkable has finished
   fun void wait()
   {
       if(!isFinished())
           this => now;
   }
}
