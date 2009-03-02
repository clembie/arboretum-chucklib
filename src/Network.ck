// Network - abstraction of multiple nodes on a network indexed by hostname

public class Network {
	// abstraction of a network
	-1 => int numnodes;
	Node nodes[0];
	
	fun int addHost( string hostname, string ip, int port ) {
		Node newNode;
		hostname => newNode.hostname;
		ip => newNode.ip;
		port => newNode.port;
		newNode @=> nodes[hostname];
		numnodes++;
		return numnodes;
	}
	
	fun Node node( string hostname ) {
		return nodes[hostname];
	}
	
	fun int port( string hostname ) {
		return nodes[hostname].port;
	}
	
	fun string ip( string hostname ) {
		return nodes[hostname].ip;
	}
}