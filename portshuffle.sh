#!/bin/bash

		# Global variables.
MINPORT=15000

		# Create a new random port, >15000.
portshuffle()
{
	seed=$RANDOM

	if [[ $seed -gt $MINPORT ]]
	then
		echo $seed
	fi

	if [[ $seed -lt $MINPORT ]]
	then
		echo $(($seed+15000))
	fi
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
portchange $newport		# Change the ssh port to newport in the ssh configuration file.
/etc/init.d/ssh restart		# Restart the daemon identified by a parameter.
