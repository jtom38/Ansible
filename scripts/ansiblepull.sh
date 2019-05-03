
# Script file to enable all of my ansible-pull commands.
# Used for documentation and rebuilding if needed

# Notes
# -o command will only run the playbook when changes take place.  

$REPO = 'https://github.com/luther38/ansible.git'

# This pb will tell all linux hosts to configure auto install of security updates
ansible-pull -U REPO -o playbook/linux/auto-securityupdates.yml
