#!/bin/bash
#
# Install the required packages
#

if ! which expect &>/dev/null; then
    sudo apt-get install expect
fi

