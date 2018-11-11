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

spawn ssh "root\@$ip" ping -c 1 89.233.43.71

expect "assword:"

send "$password\r";

interact

# return code from http://stackoverflow.com/questions/3299502/ddg#3300284
catch wait result
exit [lindex $result 3]

