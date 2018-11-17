#!/bin/bash

while true; do
	echo ----------------------
	nmcli device wifi list | grep -i frei
	sleep 1
done
