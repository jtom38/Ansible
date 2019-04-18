
# This will install Vagrant on the device

#1.0 Started to add Vagrant to the project

echo "OS: $OSTYPE"
if [[ "$OSTYPE" == "darin"* ]]; then

# I use debian so sudo
elif [[ "$OSTYPE" == "linux-gnu" ]]; then

	# Download current release 
	wget https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_linux_amd64.zip

	unzip vagrant_2.2.4_linux_amd64.zip

	# Remove the zip
	rm vagrant_2.2.4_linux_amd64.zip

	# copy over to bin
        sudo cp vagrant /usr/bin/vagrant

	rm vagrant	

	echo "Installing VirtualBox 6"
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian cosmic contrib"
	sudo apt update
	sudo apt install virtualbox-6.0
else
	echo "You are running on a OS that is not supported by this script at this time."
	echo "No changes have been made."
	exit
fi
