# Ansible Docs

This is the location for my notes with ansible.  Hopefully the things I work though will help someone else with learning how ansible functions.

## Playbooks

Playbooks should be viewed like the configuration file for you process.  This where is where all of your variables and basic tests should be done.  Do not treat roles like playbooks!  More on that later.

### Documentation

YAML allows us to use `#` as a comment value, make use of it.  You can write notes for your team about a task with comments.  Use them, it wont hurt.  

When you are writing a playbook and you need a quick refresher on what the syntax that a module supports use `ansible-doc moduleName` command.  Example: `ansible-doc pip`  

This will give you a quick way to see what flags are supported without having to go to the browser to find out.

## Vault

Vaults are a great way to store secrets in your source code.  Never store insecure secrets in a file other then for quick testing.  Even then, don't put unencrypted secrets in public locations.


