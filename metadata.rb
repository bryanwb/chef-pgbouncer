maintainer       "Christoph Krybus"
maintainer_email "ckrybus@googlemail.com"
license          "Apache 2.0"
description      "Installs and configures pgbouncer"
version          "0.2.0"

recipe "pgbouncer", "Installs and configures pgbouncer"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute "pgbouncer/databases",
  :display_name => "PgBouncer databases",
  :description => "Dictionary consisting of database names with connection info.",
  :default => {}
attribute "pgbouncer/userlist",
  :display_name => "PgBouncer userlist",
  :description => "Dictionary consisting of usernames with passwords, used in the userlist.txt file.",
  :default => {}

# Administrative settings
attribute "pgbouncer/logfile",
  :display_name => "PgBouncer logfile",
  :description => "Location of pgbouncer logfile.",
  :default => "/var/log/postgresql/pgbouncer.log"
attribute "pgbouncer/pidfile",
  :display_name => "PgBouncer pidfile",
  :description => "Location of pgbouncer pidfile.",
  :default => "/var/run/postgresql/pgbouncer.pid"

# Where to wait for clients
attribute "pgbouncer/listen_addr",
  :display_name => "PgBouncer listen address",
  :description => "IP address or * which means all ip-s.",
  :default => "127.0.0.1"
attribute "pgbouncer/listen_port",
  :display_name => "PgBouncer listen port",
  :description => "Accept connections on the specified port.",
  :default => "6432"
attribute "pgbouncer/unix_socket_dir",
  :display_name => "PgBouncer unix socket dir",
  :description => "Specify the dir for the unix socket that will be used to listen for incoming connections.",
  :default => "/var/run/postgresql"

# Authentication settings
attribute "pgbouncer/auth_type",
  :display_name => "PgBouncer authentication type",
  :description => "Specify the authentication type to use.",
  #:choice => \[ "any", "trust", "plain", "crypt", "md5" \],
  :default => "trust"
attribute "pgbouncer/auth_file",
  :display_name => "PgBouncer authentication file",
  :description => "Location of pgbouncer userlist.txt file.",
  :default => "/etc/pgbouncer/userlist.txt"

# Users allowed into database 'pgbouncer'
attribute "pgbouncer/admin_users",
  :display_name => "PgBouncer admin users",
  :description => "Comma-separated list of users, who are allowed to change settings.",
  :default => ""
attribute "pgbouncer/stats_users",
  :display_name => "PgBouncer stats users",
  :description => "Comma-separated list of users who are just allowed to use SHOW command.",
  :default => ""

# Pooler personality questions
attribute "pgbouncer/pool_mode",
  :display_name => "PgBouncer pool mode",
  :description => "When server connection is released back to pool.",
  #:choice => \[ "session", "transaction", "statement" \],
  :default => "session"
attribute "pgbouncer/server_reset_query",
  :display_name => "PgBouncer server reset query",
  :description => "Query for cleaning connection immediately after releasing from client.",
  :default => ""
attribute "pgbouncer/server_check_query",
  :display_name => "PgBouncer server check query",
  :description => "When taking idle server into use, this query is ran first.",
  :default => "select 1"
attribute "pgbouncer/server_check_delay",
  :display_name => "PgBouncer server check delay",
  :description => "If server was used more recently that this many seconds ago, \
                   skip the check query. Value 0 may or may not run in immediately.",
  :default => "10"

# Connection limits
attribute "pgbouncer/max_client_conn",
  :display_name => "PgBouncer max client connections",
  :description => "Total number of clients that can connect.",
  :default => "100"
attribute "pgbouncer/default_pool_size",
  :display_name => "PgBouncer default pool size",
  :description => "PgBouncer default pool size.",
  :default => "20"
attribute "pgbouncer/log_connections",
  :display_name => "PgBouncer log connections",
  :description => "PgBouncer log connections.",
  :default => "1"
attribute "pgbouncer/log_disconnections",
  :display_name => "PgBouncer log disconnections",
  :description => "PgBouncer log disconnections.",
  :default => "1"
attribute "pgbouncer/log_pooler_errors",
  :display_name => "PgBouncer log pooler errors",
  :description => "Log error messages pooler sends to clients.",
  :default => "1"
