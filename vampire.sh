#!/usr/bin/expect
#
# Usage: ./vampire

set timeout 1

set host "192.168.32.204"
set port "4000"

# Argument for channel number (1-8)
#set channel "0:$argv"

#nc or telnet 
spawn nc $host $port

expect "'^]'."

set temp 1
send "ka\r"
expect "$!"

while {$temp == 1} {
    send "pn\r"
    expect "ok_ptt" {
        puts "OK"
    }
    
}




