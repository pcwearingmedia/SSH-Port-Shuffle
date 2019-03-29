#!/bin/bash

# Script name: portshuffle.sh
#
# Author: P-C Markovski.
# Date (Git repo init): 2017-08-17.
# Purpose: Generate new random port for the SSHD daemon, reconfigure daemon and restart it.

# ToDo:
#	- Check how uniform the random number distribution is for..
#		- $RANDOM*2 with >15000. (15k-65k)
#		- $RANDOM*2 (max 65k)
#		- /dev/urandom
#	- Graph using ChartJS.


		# Global variables.
MINPORT=15000

		# Create a new random port, >15000.
portshuffle()
{
	seed=$RANDOM

	while [ $seed -lt $1 -o $seed -gt $2 ]; do
		seed=$RANDOM
	done

	echo $seed
}

		# Change the port in the specified daemon.
portchange()
{
		# Apply sed pattern and change the existing port to the random one.
	sed -i s/.*Port.*/"Port $1"/g /etc/ssh/sshd_config
}

		# Run script.
newport=$(portshuffle $1 $2)		# Generate a new random port.
printf "Final: %s\n" $newport
#portchange $newport		# Change the ssh port to newport in the ssh configuration file.
#/etc/init.d/ssh restart		# Restart the daemon identified by a parameter.
