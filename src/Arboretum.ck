// The Arboretum is a Network.  This is a class that creates the Arboretum network

public class Arboretum extends Network {
	"head" => string self;
	
	addHost( "elm", "192.168.1.150", 9999 );
	addHost( "maple", "192.168.1.149", 9999 );
	addHost( "ash", "192.168.1.148", 9999 );
	addHost( "ginko", "192.168.1.147", 9999 );
	addHost( "cedar", "192.168.1.146", 9999 );
	addHost( "beech", "192.168.1.134", 9999 );
	addHost( "birch", "192.168.1.129", 9999 );
	addHost( "cherry", "192.168.1.127", 9999 );
	addHost( "spruce", "192.168.1.126", 9999 );
	addHost( "oak", "192.168.1.124", 9999 );
	addHost( "redwood", "192.168.1.1", 9999 );
	addHost( "head", "192.168.1.118", 9999 );
}