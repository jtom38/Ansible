# Ansible Docs

This is the location for my notes with ansible.  Hopefully the things I work though will help someone else with learning how ansible functions.

## Playbooks

Playbooks should be viewed like the configuration file for you process.  This where is where all of your variables and basic tests should be done.  Do not treat roles like playbooks!  More on that later.

### Documentation

YAML allows us to use `#` as a comment value, make use of it.  You can write notes for your team about a task with comments.  Use them, it wont hurt.  

When you are writing a playbook and you need a quick refresher on what the syntax that a module supports use `ansible-doc moduleName` command.  Example: `ansible-doc pip`  

This will give you a quick way to see what flags are supported without having to go to the browser to find out.

## Vault

Vaults are a great way to store secrets in your source code.  Never store insecure secrets in a file other then for quick testing.  Even then, don't put un-encrypted secrets in public locations.

### Config changes

Before you use ansible-value you will want to update your ansible.cfg file.  Uncomment ```#vault_password_file``` and update it to where you will store your secret file.  This is a file that should be added to ```.gitignore``` so that the password is stored safely.  For reference I use .ansible_vault as my file and you can see my .gitignore file to see how I ignore it.

### How to use Vault

Make sure you adjusted your ansible.cfg before doing this.  That password is how vault decrypts values.

```bash
echo 'secret' > .ansible_vault
ansible-value encrypt_string 'sshPassword'
```

With the value that was exported you would add that to the playbook that needs to be able to decrypt the secret to use it.  
Something to note.  When the password that is stored in .ansible_vault that is defined in ansible.cfg changes, the vault might start to fail to decrypt strings.  I have not made it that far yet with vault to confirm how much this is true.

## Roles

Roles are very important when it comes to Ansible.  If you need to define how say pip handles actions you would build a role for it. With that role you can define how pip would work.  Do not treat roles as your playbook.  They are meant to be used as a guide and the playbook passes variables to the role to tell it how something should be configured.

