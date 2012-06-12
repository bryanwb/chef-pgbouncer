
default[:pgbouncer][:user] = "postgres"
default[:pgbouncer][:databases] = {"*" => "host=#{node.name} port=5432"}
default[:pgbouncer][:userlist] = {}
default[:pgbouncer][:ignore_startup_parameters] = nil


# Distro-Dependent settings
if platform?("redhat", "centos", "scientific", "fedora")
  # this value is hardcoded into rpm from yum.postgresql.org
  # yet still required as commandline parameter WTF
  default[:pgbouncer][:initfile] = "/etc/pgbouncer.ini"
  default[:pgbouncer][:additional_config_file] = "/etc/sysconfig/pgbouncer"
  default[:pgbouncer][:pidfile] = "/var/run/pgbouncer/pgbouncer.pid"
  default[:pgbouncer][:unix_socket_dir] = "/tmp"
  default[:pgbouncer][:logfile] = "/var/log/pgbouncer.log"
else
  default[:pgbouncer][:initfile] = "/etc/pgbouncer/pgbouncer.ini"
  default[:pgbouncer][:additional_config_file] = "/etc/default/pgbouncer"
  default[:pgbouncer][:pidfile] = "/var/run/postgresql/pgbouncer.pid"
  default[:pgbouncer][:unix_socket_dir] = "/var/run/postgresql"
  default[:pgbouncer][:logfile] = "/var/log/postgresql/pgbouncer.log"
end


# Where to wait for clients 
default[:pgbouncer][:listen_port] = "6432"

# Authentication settings
default[:pgbouncer][:auth_type] = "trust"
default[:pgbouncer][:auth_file] = "/etc/pgbouncer/userlist.txt"

# Users allowed into database 'pgbouncer'
default[:pgbouncer][:admin_users] = "postgres"
default[:pgbouncer][:stats_users] = "postgres"

# Pooler personality questions
default[:pgbouncer][:pool_mode] = "session"
default[:pgbouncer][:server_reset_query] = "DISCARD ALL"
default[:pgbouncer][:server_check_query] = "select 1"
default[:pgbouncer][:server_check_delay] = "10"

# Connection limits
default[:pgbouncer][:max_client_conn] = "100"
default[:pgbouncer][:default_pool_size] = "20"
default[:pgbouncer][:log_connections] = "1"
default[:pgbouncer][:log_disconnections] = "1"
default[:pgbouncer][:log_pooler_errors] = "1"
default[:pgbouncer][:reserve_pool_size] = false
default[:pgbouncer][:reserve_pool_timeout] = false
default[:pgbouncer][:server_idle_timeout] = false
default[:pgbouncer][:server_connect_timeout] = false

# logging
default[:pgbouncer][:log_connections] = "1"
default[:pgbouncer][:log_disconnections] = "1"

# Connection to Postgres

default[:pgbouncer]['psqlopts'] = "-qAtX"
default[:pgbouncer]['pghost'] = "localhost"
default[:pgbouncer]["pghostaddr"] = ""
default[:pgbouncer]["pgport"] = "5432"
default[:pgbouncer]["pgdatabase"] = "postgres"
default[:pgbouncer]["pguser"] = "postgres"
default[:pgbouncer]["pgpassword"] = ""
default[:pgbouncer]["pgpassfile"] = "/home/postgres/.pgpass"


# Timeouts

# Low-level tuning options

