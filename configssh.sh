# This script will do the following
# 1. Install OpenSSH
# 2. Make a user named Ansible
# 3. Give account sudo
# 4. Confirm SSH is active and running
# If you want to change how SSH is configured you will need to update the config by hand.  Currently not supported by this script.

# Use of this script is without warranty.  Use at your own risk.

echo "Installing OpenSSH Server"
sudo apt-get update
sudo apt-get install openssh-server  -y

echo "Going to create user: ansible"
sudo adduser ansible

echo "Giving ansible sudo permissions"
sudo usermod -aG sudo ansible

sudo systemctl status ssh

echo "Install is complete.  Test ansible!"
echo "If you want to change the port, check this scripts config on how to"

# Edit /etc/ssh/sshd_config
# Uncomment #Port 22
# Change the port number
# Save and Close


# Change the port from commented to uncommented
# If it is already uncommented, this will do nothing.
#sed -i "/#PORT =.*/PORT = $port" ~/cfg

# Change the port to what we want
#sed -i "s/PORT/= .*/= $port" ~/cfg

