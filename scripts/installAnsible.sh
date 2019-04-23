
# Shell script to install ansible and other requirements.
# Currently only supports darwin for now.
# Ubuntu installer will be soon

# 1.1: Added sudo command and justed the layout


echo "OS: $OSTYPE"
if [[ "$OSTYPE" == "darwin"* ]]; then

	echo "[brew] Intalling Ansible"
	brew install ansible

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "[sudo] Install Ansible"
	sudo apt update
	sudo apt install software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible
else
	echo "Running on a unsupported OS"
	echo "No changes where made"
	exit
fi

echo "[pip] Installing WinRM module"
sudo pip install pywinrm

echo "[pip] Installing Azure module"
sudo pip install 'ansible[azure]'

echo "[pip] Installing Docker module"
sudo pip install docker


echo "Installing roles from galaxy.ansible.com"
echo "[galaxy] Nagios Core - Server Side "
ansible-galaxy install networklore.nagios
