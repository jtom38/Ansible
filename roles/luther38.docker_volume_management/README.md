# docker_volume_backup

This role helps with making backups of your docker volumes for you.

## Requirements

This role makes use of the docker cli tool on ansible_os_family == 'Debian' || 'RedHat'

## Variables

``` yaml

# Required

# Defines what task will be ran.
# Expects: 'backup' or 'restore'
# Defaults: Null
action: string

# Defines what container to look for to copy the mount points for the backup job.
# Defaults: Null
container_name: string

# Defines the mount point from within the container that we are going to make a backup of.
# Defaults: Null
mount_point: string

# Defines where on the host device we are going to place the tar file.
# Defaults: Null
backup_location: string

# Defines the name of the tar file.  
# Defaults: Null
tar_file: string

# Optional
# Checks to make sure that the volume is present.  Creates one if not found by name.
# Defaults: false
create_volume: bool

# Stops the container to run the backup on the data.
# Defaults: false
stop_container: bool

```

## Examples

``` yaml

- include_role:
    name: docker_volume_management
  vars:
    action: backup
    container_name: 'ubuntu'
    mount_point: '/data'
    backup_folder: '~/backup'
    tar_file: ubuntuData.tar

- include_role:
    name: docker_volume_management
  vars:
    action: restore
    create_volume: true
    stop_container: true
    volume_name: 'ubuntuData'
    backup_folder: '~/backup'
    tar_file: ubuntuData.tar

```
