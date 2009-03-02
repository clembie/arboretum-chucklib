
public class NoteEvent extends Event {
	// General note properties
	1::second => dur length;
	
	float attackTime;
	float decayTime;
	float sustainLevel;
	float sustainTime;
	float releaseTime;
	
	200. => float frequency;
	1. => float amp;
	dac => UGen out;
	

}