#Sensu#

Installs and configures sensu monitoring with Salt.

This has only been tested on Ubuntu 12.04.

## Requirements ##
The formula assumes that redis-server and rabbitmq-server is installed and running on the sensu server node.

The client setup is also assumes that eth0 is the primary NIC.

## Installation ##
To set configuration data, use the pillar file.

### Sensu server ###
    include:
      - sensu.client

### Sensu server ###
    include:
      - sensu.server


