Hyperized.RabbitMQ
=========

Sets up and manages RabbitMQ HA clusters.

Requirements
------------

Ansible 2.1 or above is highly recommended.
Ubuntu Trusty on AWS EC2

Role Variables
--------------

```
# Enable cluster setting
rabbitmq_use_cluster: True

# Set up vhosts
rabbitmq_vhosts:
  /:
  /examplevhost:

# Set up users
rabbitmq_users:
  root:
    password: hello
    tags: administrator
    permissions:
      - vhost: /
        configure_priv: .*
        write_priv: .*
        read_priv: .*
      - vhost: /fd
        configure_priv: .*
        write_priv: .*
        read_priv: .*

# Set up queues
rabbitmq_queues:
  my.queue:
    vhost: /examplevhost
    user: root

# Set up exchanges
rabbitmq_exchanges:
  my.exchange:
    name: my.exchange
    user: root
    vhost: /examplevhost
    type: fanout
    bindings:
      - name: my.queue
        type: queue
        routing_key: '*'
```

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: hyperized.rabbitmq }

Additionally, for testing purposes a script (/root/reset.sh) will be placed on the server that clears the entire broker and allows you to re-run this role from scratch.

License
-------

MIT

Author Information
------------------

Gerben Geijteman <gerben.geijteman@fdmediagroep.nl>
