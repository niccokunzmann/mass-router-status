#!/usr/bin/expect -f
#
# not working?
# sudo apt-get install expect
#
# taken from https://stackoverflow.com/a/16928662
# and https://www.thegeekstuff.com/2010/10/expect-examples/
#

set timeout 20

set ip [lindex $argv 0]
set password [lindex $argv 1]


# Usage: ping [OPTIONS] HOST
#
# Send ICMP ECHO_REQUEST packets to network hosts
#
#	-4,-6		Force IP or IPv6 name resolution
#	-c CNT		Send only CNT pings
#	-s SIZE		Send SIZE data bytes in packets (default:56)
#	-t TTL		Set TTL
#	-I IFACE/IP	Use interface or IP address as source
#	-W SEC		Seconds to wait for the first response (default:10)
#			(after all -c CNT packets are sent)
#	-w SEC		Seconds until ping exits (default:infinite)
#			(can exit earlier with -c CNT)
#	-q		Quiet, only display output at start
#			and when finished
#	-p		Pattern to use for payload

spawn ssh "root\@$ip" ping -c 1 -w 5 8.8.8.8

expect "assword:"

send "$password\r";

interact

# return code from http://stackoverflow.com/questions/3299502/ddg#3300284
catch wait result
exit [lindex $result 3]

