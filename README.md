![](https://img.shields.io/badge/Ansible-Consul-green.svg?logo=angular&style=for-the-badge)

>__Please note that the original design goal of this role was more concerned with the initial installation and bootstrapping environment, which currently does not involve performing continuous maintenance, and therefore are only suitable for testing and development purposes,  should not be used in production environments.__

>__请注意，此角色的最初设计目标更关注初始安装和引导环境，目前不涉及执行连续维护，因此仅适用于测试和开发目的，不应在生产环境中使用。__
___

<p><img src="https://raw.githubusercontent.com/goldstrike77/goldstrike77.github.io/master/img/logo/logo_consul.png" align="right" /></p>

__Table of Contents__

- [Overview](#overview)
- [Requirements](#requirements)
  * [Operating systems](#operating-systems)
  * [Consul Versions](#Consul-versions)
- [ Role variables](#Role-variables)
  * [Main Configuration](#Main-parameters)
  * [Other Configuration](#Other-parameters)
- [Dependencies](#dependencies)
- [Example Playbook](#example-playbook)
  * [Hosts inventory file](#Hosts-inventory-file)
  * [Vars in role configuration](#vars-in-role-configuration)
  * [Combination of group vars and playbook](#combination-of-group-vars-and-playbook)
- [License](#license)
- [Author Information](#author-information)
- [Contributors](#Contributors)

## Overview
This Ansible role installs HashiCorp Consul on Linux or Windows operating system, including establishing a filesystem structure and server configuration with some common operational features.

## Requirements
### Operating systems
This role will work on the following operating systems:

  * CentOS 7

### Consul versions

The following list of supported the Consul releases:

  * Consul 1.5+

## Role variables
### Main parameters #
There are some variables in defaults/main.yml which can (Or needs to) be overridden:

##### General parameters
* `consul_datacenter`: Controls the datacenter in which the agent is running.
* `consul_domain`: Controls the domain in which the agent is running.
* `consul_node_role`: Defines node roles.
* `consul_version`: Specify the Consul version.
* `consul_hashiui_is_install`: A boolean value, whether install the Consul hashi-ui.
* `consul_hashiui_version`: Specify the Consul hashi-ui version.
* `consul_path`: Specify the Consul data folder.
* `consul_join_servers`: Address list of servers to join upon starting up.

##### Listen port
* `consul_port_arg`: Defines communication port.

##### System Variables
* `consul_arg.ca_file`: Provides a file name to a PEM-encoded certificate authority.
* `consul_arg.cert_file`: Provides a file name to a PEM-encoded certificate. 
* `consul_arg.dns_allow_stale`: Enables a stale query for DNS information.
* `consul_arg.dns_max_stale`: Limit how stale results are allowed to be.
* `consul_arg.enable_local_script_checks`: Enable them when they are defined in the local configuration files
* `consul_arg.enable_script_checks`: Controls whether health checks that execute scripts are enabled on this agent.
* `consul_arg.enable_syslog`: Enables logging to syslog.
* `consul_arg.encrypt`: Create by consul keygen, Specifies the secret key to use for encryption of Consul network traffic.
* `consul_arg.encrypt_verify_incoming`: Enables enforcing encryption for incoming gossip.
* `consul_arg.encrypt_verify_outgoing`: Enables enforcing encryption for outgoing gossip.
* `consul_arg.https`: Enables The HTTPS API.
* `consul_arg.key_file`: Provides a the file name to a PEM-encoded private key.
* `consul_arg.log_level`: The level of logging to show after the Consul agent has started.
* `consul_arg.raft_protocol`: Controls the internal version of the Raft consensus protocol used for server communications.
* `consul_arg.uid`: Sets the Unix userID that the processes are executed as.
* `consul_arg.ulimit_nofile`: The number of files launched by systemd.
* `consul_arg.ulimit_nproc`: The number of processes launched by systemd.
* `consul_arg.user`: Sets the Unix username that the processes are executed as.
* `consul_arg.verify_incoming`: Enables enforce the use of TLS or verify a client's authenticity for server RPC and HTTPS API.
* `consul_arg.verify_incoming_https`: Enables enforce the use of TLS or verify a client's authenticity for HTTPS API.
* `consul_arg.verify_outgoing`: Enables enforce make use of TLS for outgoing connections.
* `consul_arg.verify_server_hostname`: Enables enforce verify the hostname of the certificate.

##### Backup parameters
* `consul_backupset_arg.keep`: The number of backups days to keep.
* `consul_backupset_arg.cloud_rsync`: Whether rsync for cloud storage.
* `consul_backupset_arg.cloud_drive`: Specify the cloud storage providers.
* `consul_backupset_arg.cloud_bwlimit`: Controls the bandwidth limit.
* `consul_backupset_arg.cloud_event`: Define transfer events.
* `consul_backupset_arg.cloud_config`: Specify the cloud storage configuration.

##### ACL Variables
* `consul_acl_arg.enabled`: Enables ACLs.
* `consul_acl_arg.datacenter`: Designates the datacenter which is authoritative for ACL information.
* `consul_acl_arg.default_policy`: The policy controls when cannot be read from the primary_datacenter or leader node.
* `consul_acl_arg.down_policy`:  The default policy controls the behavior of a token when there is no matching rule. 
* `consul_acl_arg.master_token`: Only used for servers.
* `consul_acl_arg.ttl`: Control Time-To-Live caching of ACL policies. 

##### DNS Variables
* `consul_dns_recursors`: Specifies the address of an upstream DNS server.
* `consul_dns_service_ttl`: A TTL on service lookups with a per-service policy.

##### Performance
* `consul_performance.leave_drain_time`: A duration that a server will dwell during a graceful leave in order to allow requests.
* `consul_performance.raft_multiplier`: An integer multiplier used by servers to scale key Raft timing parameters. 
* `consul_performance.rpc_hold_timeout`: A duration that a server will retry internal RPC requests during leader elections.

##### Service Mesh
* `environments`: Define the service environment.
* `tags`: Define the service custom label.
* `exporter_is_install`: Whether to install prometheus exporter.
* `consul_public_register`: false Whether register a exporter service with public consul client.
* `consul_public_exporter_token`: Public Consul client ACL token.
* `consul_public_http_prot`: The consul Hypertext Transfer Protocol.
* `consul_public_clients`: List of public consul clients.
* `consul_public_http_port`: The consul HTTP API port.

### Other parameters
There are some variables in vars/main.yml:

## Dependencies
- Ansible versions >= 2.8 are supported.
- Python >= 2.7.5

## Example

### Hosts inventory file
See tests/inventory for an example.

    node01 ansible_host='192.168.1.10' consul_node_role='server'
    node02 ansible_host='192.168.1.11' consul_node_role='server'
    node03 ansible_host='192.168.1.12' consul_node_role='server'

### Vars in role configuration
Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
         - role: ansible-role-OS-consul
           consul_node_role: 'server'

### Combination of group vars and playbook
You can also use the group_vars or the host_vars files for setting the variables needed for this role. File you should change: group_vars/all or host_vars/`group_name`

    consul_datacenter: 'dc01'
    consul_domain: 'local'
    consul_node_role: 'client'
    consul_version: '1.5.3'
    consul_hashiui_is_install: false
    consul_hashiui_version: '1.3.0'
    consul_path: '/data'
    consul_join_servers:
      - '1.1.1.1'
      - '1.1.1.2'
      - '1.1.1.3'
    consul_port_arg:
      dns: '53'
      dns_interface: '8600'
      exporter: '9107'
      hashiui: '3001'
      http: '8500'
      serf_lan: '8301'
      serf_wan: '8302'
      server: '8300'
    consul_arg:
      ca_file: 'certificate.pem'
      cert_file: 'certificate.pem'
      dns_allow_stale: true
      dns_max_stale: '10s'
      enable_local_script_checks: true
      enable_script_checks: true
      enable_syslog: true
      encrypt: 'i+9cwfvqtD6hw8XVKzONAw=='
      encrypt_verify_incoming: true
      encrypt_verify_outgoing: true
      https: true
      key_file: 'server.key'
      log_level: 'WARN'
      raft_protocol: '3'
      uid: '2011'
      ulimit_nofile: '20480'
      ulimit_nproc: '20480'
      user: 'consul'
      verify_incoming: false
      verify_incoming_https: false
      verify_outgoing: false
      verify_server_hostname: false
    consul_backupset_arg:
      keep: '30'
      cloud_rsync: true
      cloud_drive: 'azureblob'
      cloud_bwlimit: '10M'
      cloud_event: 'sync'
      cloud_config:
        account: 'blobuser'
        key: 'base64encodedkey=='
        endpoint: 'blob.core.chinacloudapi.cn'
    consul_acl_arg:
      enabled: true
      datacenter: '{{ consul_datacenter }}'
      default_policy: 'deny'
      down_policy: 'extend-cache'
      master_token: '7471828c-d50a-4b25-b6a5-d80f02a03bae'
      ttl: '30s'
    consul_dns_recursors:
      - '223.5.5.5'
      - '119.29.29.29'
      - '8.8.8.8'
    consul_dns_service_ttl: 
      '*': 60s
      web: 30s
      app: 30s
      dbs: 5s
    consul_performance:
      leave_drain_time: 5s
      raft_multiplier: 3
      rpc_hold_timeout: 7s
    environments: 'Development'
    tags:
      subscription: 'default'
      owner: 'nobody'
      department: 'Infrastructure'
      organization: 'The Company'
      region: 'IDC01'
    exporter_is_install: false
    consul_public_register: false
    consul_public_exporter_token: '00000000-0000-0000-0000-000000000000'
    consul_public_http_prot: 'https'
    consul_public_http_port: '8500'
    consul_public_clients:
      - '127.0.0.1'

## License
![](https://img.shields.io/badge/MIT-purple.svg?style=for-the-badge)

## Author Information
Please send your suggestions to make this role better.

## Contributors
Special thanks to the [Connext Information Technology](http://www.connext.com.cn) for their contributions to this role.
