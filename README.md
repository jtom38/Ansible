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

```

Review the installAnsible.sh for quick setup.

Make sure you run the commands out of this folder so things work as desired.

## Configuration

I have a basic configuration file in place at the root of this folder for anisble to find.

## Inventory

I have a template file in place that should only be used as a refrence.  Make a copy of that file and name it hosts then update that file.

## Testing Inventory



### Testing Linux devices

```bash
ansible linux -i hosts -m ping
```

### Testing Windows devices

```bash
ansible windows -i hosts -m win_ping
```



