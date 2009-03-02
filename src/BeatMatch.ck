public class BeatMatch {
    SndBuf A;
    SndBuf B;
    
    dur matchDur;
    
    0 => int globalPosition;
    0.0 => float globalRate;
    1.0 => float globalGain;
    
    0 => int setup;
    0 => int bIsBigger;
    
    // changes the rate of the second argument to match the first
    fun void match(string a, string b) {
        // setup SndBuf objects
        a => A.read;
        b => B.read;
        
        // until a better solution is implemented
        0.0 => A.gain;
        0.0 => B.gain;
        
        if( A.length() < B.length() ) {
            multiplier( A.length(), B.length() ) => A.rate;
            1 => B.rate;
            1 => bIsBigger;
            //B.length() => matchDur;
        }
        else if( B.length() < A.length() ) {
            multiplier( B.length(), A.length() ) => B.rate;
            1 => A.rate;
            //A.length() => matchDur;
        }
        
        1.0 => globalRate;
        
        // let us know this has been done
        1 => setup;
    }
    
    // returns a multiplier for making b as long as a
    fun float multiplier(dur a, dur b) {
        (1 + ((a - b) / b)) => float m;
        return m;
    }
    
    
    // play the loops
    fun void play() {
        globalPosition => A.pos;
        globalPosition => B.pos;
        
        // a horrible envelope
        globalGain => A.gain => B.gain;
        
        matchDur => now;
        
        0.0 => A.gain => B.gain;  // ugh...
    }
    
    fun void loop( int c ) {
        for( 0 => int i; i < c; i++ ) {
            play();
        }
    }
    
    
    fun void length( dur d ) {
        if( setup ) {
            d => matchDur;
            
            multiplier( d, A.length() ) => float adiff;
            multiplier( d, B.length() ) => float bdiff;
            
            //<<<A.rate(), adiff>>>;
            //<<<B.rate(), bdiff>>>;
            
            if( bIsBigger ) {
                A.rate() / bdiff => A.rate;
                B.rate() / bdiff => B.rate;
            }
            else {
                A.rate() / adiff => A.rate;
                B.rate() / adiff => B.rate;
            }
        }
        else {
            <<<"Error: use match() before length();">>>;
        }
    }
    
    fun void matchPlay(dur d, int c) {
        if( setup ) {
            d => matchDur;
            
            multiplier( d, A.length() ) => float adiff;
            multiplier( d, B.length() ) => float bdiff;
            
            <<<A.rate(), adiff>>>;
            <<<B.rate(), bdiff>>>;
            
            if( bIsBigger ) {
                A.rate() / bdiff => A.rate;
                B.rate() / bdiff => B.rate;
            }
            else {
                A.rate() / adiff => A.rate;
                B.rate() / adiff => B.rate;
            }
            
            while( c > 0 ) {
                0 => A.pos;
                0 => B.pos;
                matchDur => now;
                //<<<matchDur>>>;
                c--;
            }
        }
        else {
            <<<"Error: use match() before matchPlay();">>>;
        }
    }
    
    fun void connect(UGen ugen) {
        // more fun later
        A => ugen;
        B => ugen;
    }
    
    // gain
    fun void gain(float g) {  // gain for both
        g => globalGain;
        //g => A.gain => B.gain;
    }
    
    // these two are borked for now...
    fun void gain1(float g) {  // gain for SndBuf A
        //g => A.gain;
    }
    
    fun void gain2(float g) {  // gain for SndBuf B
        //g => B.gain;
    }
    
    
    
    // rate
    fun void rate(float r) {  // rate for both
        A.rate() * r => A.rate;
        B.rate() * r => B.rate;
        matchDur / r => matchDur;
        r => globalRate;
    }
    
    fun float getRate() {
        return globalRate;
    }
    
    fun void rate1( float r ) {
        // soon...
    }
    
    fun void rate2( float r ) {
        // soon...
    }
    
    fun dur getMatchDur() {
        return matchDur;
    }
}