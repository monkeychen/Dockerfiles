#!/bin/bash

# Default user: root/engine ssh_ovirt/ssh_ovirt rcd/rcd

create_ssh_user() {
# Create a user to SSH into as.
useradd $1
SSH_USERPASS=$2
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $1)
echo "ssh user[$1] password: $SSH_USERPASS"
}

# Call all functions
create_ssh_user