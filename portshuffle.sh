#!/bin/bash

# Script name: portshuffle.sh
#
# Author: P-C Markovski.
# Date (Git repo init): 2017-08-17.
# Purpose: Generate new random port for the SSHD daemon, reconfigure daemon and restart it.

# ToDo:
#       - Check how uniform the random number distribution is for..
#               - $RANDOM*2 with >15000. (15k-65k)
#               - $RANDOM*2 (max 65k)
#               - /dev/urandom
#       - Graph using ChartJS.


                # Global variables.
MINPORT=15000



                # Create a new random port, in the interval specified by two parameters.
portshuffle()
{
        seed=$(($RANDOM*2))

        while [ $seed -lt $1 -o $seed -gt $2 ]; do
                seed=$(($RANDOM*2))
        done

        echo $seed
}

                # Change the port in the specified daemon.
portchange()
{
                # Apply sed pattern and change the existing port to the random one.
        sed -i s/.*Port.*/"Port $1"/g /etc/ssh/sshd_config
}

if [ $# -ne 2 ]; then
        echo "usage: portshuffle.sh <max_port_number> <min_port_number>"
else
        if [ $2 -lt $1 ]; then
                echo "Parameter 1 must be smaller than parameter 2."
        else
                newport=$(portshuffle $1 $2)            # Generate a new random port.
                printf "Final: %s\n" $newport
                #portchange $newport            # Change the ssh port to newport in the ssh configuration file.
                #/etc/init.d/ssh restart                # Restart the daemon identified by a parameter.
        fi
fi
