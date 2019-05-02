ElasticSearch
=========

This role will install and configure ElastiSearch on requested servers.

Requirements
------------

No requirements are needed for this role.

Role Variables
--------------

```yaml
cluster_name: 'cluster'

node_name: ''

# https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html
#
node_master: true

node_data: true

path_data: '/var/lib/elasticsearch'

path_logs: '/var/log/elastisearch'

http_port: 9200

### Transport ###
#
#https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-transport.html
#

# The host address to bind the transport service to. Defaults to transport.host (if set) or network.bind_host.
transport_host: 'localhost'

# A bind port range. Defaults to 9300-9400.
transport_port: 9300

#
# Firewall configuration
#

# Allow http_port though UFW
ufw_http_port: false

# Allow transport_port though UFW
ufw_transport_port: false

#
# systemd configuration
#

# Enable ElasticSearch on system startup
systemd_enabled: false

# Restart ElasticSearch after running though playbook
systemd_restart: false
```

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- name: testing elastic role
  hosts: elastic

  tasks:
        - name: Install ElasticSearch
          import_role: 
                name: elasticsearch
          vars:
                cluster_name: "cookies"
                ufw_http_port: true
                ufw_transport_port: true
                systemd_enabled: true
                systemd_restart: true


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
