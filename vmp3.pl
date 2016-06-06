# tutorial from: 
# http://xmodulo.com/how-to-write-simple-tcp-server-and-client-in-perl.html

use IO::Socket::INET;

#autoflush on socket

$| = 1;

my $socket = new IO::Socket::INET (
        PeerHost => '192.168.32.204',
        PeerPort => '4000',
        Proto => 'tcp' );

die "can`t connect to server $!\n" unless $socket;
print "connected to server \n";

my $req = "fv\r";
my $size = $socket->send($req);

print "sent data of length $size\n";

shutdown($socket, 1);

my $resp = "";
$socket->recv($resp, 1024);
print "received resp: $resp\n";

$socket->close();


