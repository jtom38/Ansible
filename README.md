# Ansible

This repo contains my configuration and setup for my ansible use.  Use at your own risk.

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

I have a template file in place that should only be used as a reference.  Make a copy of that file and name it hosts then update that file.

The configuration file that is active is looking for a directory that contains all of the inventory files.  This way all files can be parted out rather then one big file.

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

