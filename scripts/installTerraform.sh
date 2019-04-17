
# This will install Terraform on the device

#1.0 Started to add Terraform to the project

echo "OS: $OSTYPE"
if [[ "$OSTYPE" == "darin"* ]]; then

# I use debian so sudo
elif [[ "$OSTYPE" == "linux-gnu"  ]]; then

	# Download current release 
	wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip

	unzip terraform_0.11.13_linux_amd64.zip

	# Remove the zip
	rm terraform_0.11.13_linux_amd64.zip

	# copy over to bin
        sudo cp terraform /bin/terraform

	rm terraform	

else
	echo "You are running on a OS that is not supported by this script at this time."
	echo "No changes have been made."
	exit
fi
