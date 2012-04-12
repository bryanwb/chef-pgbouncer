        
Description
===========

This cookbook installs and configures pgbouncer on a ubuntu/debian system.


Requirements
============

## Cookbooks:

This cookbook doesn't have direct dependencies on other cookbooks. Depending on your OS configuration and security policy, you may need additional recipes or cookbooks for this cookbook's recipes to converge on the node. In particular, the following Operating System nuances may affect the behavior:

* apt cache outdated

On Ubuntu/Debian, use Opscode's `apt` cookbook to ensure the package cache is updated so Chef can install packages, or consider putting apt-get in your bootstrap process or [knife bootstrap template](http://wiki.opscode.com/display/chef/Knife+Bootstrap).

## Platforms:

Tested on Ubuntu 10.04. Uses the pgbouncer init script.

* Debian
* Ubuntu


Attributes
==========


This cookbook uses many attributes, broken up into a few different kinds.


* `node['pgbouncer']['databases']` - dictionary consisting of database names with connection info, default {}
* `node['pgbouncer']['userlist']` - dictionary consisting of usernames with passwords, used in the userlist.txt file, default {}

Administrative settings
-----------------------

* `node['pgbouncer']['logfile']` - location of pgbouncer logfile, default "/var/log/postgresql/pgbouncer.log"
* `node['pgbouncer']['pidfile']` - location of pgbouncer pidfile, default "/var/run/postgresql/pgbouncer.pid"

Where to wait for clients
-------------------------

* `node['pgbouncer']['listen_addr']` - ip address or * which means all ip-s, default "127.0.0.1"
* `node['pgbouncer']['listen_port']` - accept connections on the specified port, default "6432"
* `node['pgbouncer']['unix_socket_dir']` - dir for the unix socket that will be used to listen for incoming connections, default "/var/run/postgresql"

Authentication settings
-----------------------

* `node['pgbouncer']['auth_type']` - authentication type, default => "trust"
* `node['pgbouncer']['auth_file']` - location of pgbouncer userlist.txt file, default "/etc/pgbouncer/userlist.txt"

Users allowed into database 'pgbouncer'
---------------------------------------

* `node['pgbouncer']['admin_users']` - comma-separated list of users, who are allowed to change settings, default ""
* `node['pgbouncer']['stats_users']` - comma-separated list of users who are just allowed to use SHOW command, default ""

Pooler personality questions
----------------------------

* `node['pgbouncer']['pool_mode']` - when server connection is released back to pool, default "session"
* `node['pgbouncer']['server_reset_query']` - query for cleaning connection immediately after releasing from client, default ""
* `node['pgbouncer']['server_check_query']` - when taking idle server into use, this query is ran first, default "select 1"
* `node['pgbouncer']['server_check_delay']` - if server was used more recently that this many seconds ago, skip the check query. Value 0 may or may not run in immediately, default "10"

Connection limits
-----------------

* `node['pgbouncer']['max_client_conn']` - total number of clients that can connect, default "100"
* `node['pgbouncer']['default_pool_size']` - default pool size, default "20"
* `node['pgbouncer']['log_connections']` - log connections, default "1"
* `node['pgbouncer']['log_disconnections']` - log disconnections, default "1"
* `node['pgbouncer']['log_pooler_errors']` - log error messages pooler sends to clients, default "1"


Usage
=====

Using this cookbook is pretty straightforward. Add the desired recipes to the 
run list of a node, or create a role. Adjust any attributes as desired. 
For example, to create a basic connection pooler role for PostgreSQL databases:

    % cat roles/connection_pooler.rb
    name "connection pooler"
    description "Lightweight connection pooler for PostgreSQL."
    run_list("recipe[pgbouncer]")
    override_attributes(
      "pgbouncer" => {
        "databases" => {
          "pgbouncer_db_name1" => "host=127.0.0.1 port=5432 dbname=postgres_db_name1",
          "pgbouncer_db_name2" => "host=127.0.0.1 port=5432 dbname=postgres_db_name2"
        },
        "userlist" => {
          "username1" => "secret_password1",
          "username2" => "secret_password2"
        }
      }
    )


License and Author
==================

Author:: Christoph Krybus (<ckrybus@googlemail.com>)
Author:: Bryan Berry (<bryan.berry@gmail.com>)

Copyright:: 2011, Christoph Krybus
Copyright:: 2011, UN FAO

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

