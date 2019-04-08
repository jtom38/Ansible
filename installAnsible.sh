
# Shell script to install ansible and other requirements.
# Currently only supports darwin for now.
# Ubuntu installer will be soon


if [[ "$OSTYPE" == "darwin"* ]]; then

	echo "OS: Dawriw"
	echo "[brew] Intalling Ansible"
	brew install ansible

	echo "[pip] Installing WinRM module"
	sudo pip install pywinrm

	echo "[pip] Installing Azure module"
	sudo pip install 'ansible[azure]'

	echo "[pi] Installing Docker module"
	sudo pip install docker

else
	echo "Running on a unsupported OS"
	echo "No changes where made"

fi


