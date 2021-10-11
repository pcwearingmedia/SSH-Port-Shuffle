# SSH-Port-Shuffle
- Purpose: This script will generate a new random port with a min MINPORT number, change the SSHD configuration and restart the SSHD daemon.
- Version: 1.0
- Author: P-C Markovski

To Do:
- Bash awscli: Open/close AWS security group port.
- Bash function in 'portshuffle.sh': 1) Change the sshd port number, 2) Restart sshd, 3) Change the AWS security group for the port to keep open. 4) Send REST API put request to a web service that picks up the port number.
- Python REST API with falcon: 1) Listen on predefined port, 2) accept encrypted PUT request containing AWS EC2 EIP and port, 3) write AWS EC2 EIP and port to database.
