#!/bin/bash

# Script name: portshuffle.sh
#
# Author: P-C Markovski.
# Date (Git repo init): 2017-08-17.
# Purpose: Generate new random port for the SSHD daemon, reconfigure daemon and restart it.

# ToDo:
#	- Check how uniform the random number distribution is for..
#		- $RANDOM with <>15000 if-cases.
#		- od..
#		- RANDOM%65000..
#	- Graph using ChartJS.


		# Global variables.
MINPORT=15000

		# Create a new random port, >15000.
portshuffle()
{
	#seed=$RANDOM
	#seed=$(od -A n -N 2 -t u2 /dev/urandom | cut -d' ' -f2)

		echo $(( ( ($RANDOM*2) % 65000) +1 ))
}

		# Change the port in the specified daemon.
portchange()
{
		# Apply sed pattern and change the existing port to the random one.
	sed -i s/.*Port.*/"Port $1"/g /etc/ssh/sshd_config
}

		# Run script.
newport=$(portshuffle)		# Generate a new random port.
echo $newport			# TEST: Print the port as calculated by portshuffle().
#portchange $newport		# Change the ssh port to newport in the ssh configuration file.
#/etc/init.d/ssh restart		# Restart the daemon identified by a parameter.
