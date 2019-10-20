# Ansible

This repo contains my configuration and setup for my ansible use.  Use at your own risk.

1. Install Ansible on development device
2. Clone this repository to work in
3. Configure devices to remote into
4. Configure Ansible's Inventory files
5. Set Vault Secret
6. Run Connection tests

## Installers

### New hosts

#### Linux

```bash
wget https://github.com/luther38/Ansible/blob/master/scripts/installAnsible.sh
chmod 777 installAnsible.sh
./installOpenSSH.sh
```

#### Windows

```powershell
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file
```

## Configuration

I have a basic configuration file in place at the root of this folder for anisble to find.  If you work out of this directory the configuration file will take effect that is loaded. 

## Inventory

Inventory files have been moved over to .yml format.  The ansibe.cfg is looking for ./dev.yml as it's default inventory file.  For Prod use make another file that will contain all servers that will be managed.

I have a template file in place that should only be used as a reference.  Make a copy of that file and name it hosts then update that file.

The configuration file that is active is looking for a directory that contains all of the inventory files.  This way all files can be parted out rather then one big file.

## Vault Secret

The configuration file is looking for ./.ansible_vault file to contain the secret for vault entries.  Git is already configured to ignore this file.  You will need to make this file and place your key in it so ansible
can decrypt vaults as needed. 

Run the following command and replace secret with your password.  Once that is done move on to generating the encrypted strings.

```shell
echo 'secret' > ./.ansible_vault
```

To generate secure strings for the inventory file run the following command.

```shell
ansible-vault encrypt_string 'secret'
```

This will output the value that needs to be placed 

### Testing Linux devices

```bash
ansible linux -i hosts -m ping
```

### Testing Windows devices

```bash
ansible windows -i hosts -m win_ping
```

## Unit Testing

Still in the works

