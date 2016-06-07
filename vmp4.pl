#!/usr/bin/perl -w
# tutorial from: 
# http://xmodulo.com/how-to-write-simple-tcp-server-and-client-in-perl.html

use IO::Socket::INET;
use IO::Select;


#autoflush on socket

$| = 1;

my $socket = new IO::Socket::INET (
        PeerHost => '192.168.32.204',
        PeerPort => '4000',
        Proto => 'tcp' );

die "can`t connect to server $!\n" unless $socket;
print "connected to server \n";

my $req = "fv\n";

while (1) 
{ 
    my $size = $socket->send($req);
    my $resp = "";
    $socket->recv($resp, 1024); 
    print "[$resp for $req\n]";
    if ($resp eq "1.0\n") {
        print "OK received for $req \n";
    } else {
        print "Lost connection !\n";
    }
    
}


shutdown($socket, 1);
$socket->close();


