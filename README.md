# Ansible

First things first, install ansible

```bash
sudo apt-get install ansible
```

## Configuration

[doc](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings-locations)

The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:

ANSIBLE_CONFIG (environment variable if set)
ansible.cfg (in the current directory)
~/.ansible.cfg (in the home directory)
/etc/ansible/ansible.cfg

## Inventory

The default location for inventory should be placed in /etc/ansible/hosts.  But you can always overwrite what inventory file is used with the -i flag



## Cheat Sheet

Quick notes for ansible via cmd

```bash
ansible -i \inb
```